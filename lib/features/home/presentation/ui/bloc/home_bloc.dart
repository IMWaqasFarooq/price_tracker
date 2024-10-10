import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dartz/dartz.dart';
import 'package:price_tracker/features/home/data/models/symbol_price_model.dart';
import 'dart:async';

import '../../../domain/entity/error_entity.dart';
import '../../../domain/entity/symbol_entity.dart';
import '../../../domain/use_cases/close_web_socket_use_case.dart';
import '../../../domain/use_cases/connect_web_socket_use_case.dart';
import '../../../domain/use_cases/get_symbols_use_case.dart';
import '../../../domain/use_cases/listen_price_use_case.dart';
import '../../../domain/use_cases/subscribe_to_symbol_use_case.dart';
import 'home_event.dart';

part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSymbolsUseCase getSymbolsUseCase;
  final ConnectWebSocketUseCase connectWebSocketUseCase;
  final SubscribeToWebSocketUseCase subscribeToWebSocketUseCase;
  final CloseWebSocketUseCase closeWebSocketUseCase;
  final ListenToPriceUpdatesUseCase listenToPriceUpdatesUseCase;

  StreamSubscription<Either<ErrorEntity, List<SymbolPriceUpdate>>>? _priceUpdatesSubscription;

  HomeBloc({
    required this.getSymbolsUseCase,
    required this.connectWebSocketUseCase,
    required this.subscribeToWebSocketUseCase,
    required this.closeWebSocketUseCase,
    required this.listenToPriceUpdatesUseCase,
  }) : super(HomeState.initial()) {
    on<GetSymbolsEvent>(_onGetSymbolsEvent);
    on<UpdateSymbolPricesEvent>(_onUpdateSymbolPricesEvent);
  }

  Future<void> _onGetSymbolsEvent(GetSymbolsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    final result = await getSymbolsUseCase.call();
    result.fold(
          (error) async {
        emit(state.copyWith(isLoading: false, error: error.message));
      },
          (symbols) async {
        emit(state.copyWith(isLoading: false, symbolsList: symbols, isSuccess: true));

        final connectResult = await connectWebSocketUseCase.call();
        connectResult.fold(
              (error) async {
            emit(state.copyWith(error: error.message));
          },
              (success) async {
            for (var symbol in symbols) {
              final subscribeResult = await subscribeToWebSocketUseCase.call(symbol.symbol ?? "");
              subscribeResult.fold(
                    (error) async {
                  emit(state.copyWith(error: error.message));
                },
                    (success) async {
                  print(success);
                },
              );
            }

            _priceUpdatesSubscription = listenToPriceUpdatesUseCase.call().listen(
                  (eitherData) {
                eitherData.fold(
                      (error) {
                        print(error.message);
                  },
                      (data) {

                    add(UpdateSymbolPricesEvent(data));
                  },
                );
              },
              onError: (error) {
                emit(state.copyWith(error: error.toString()));
              },
            );
          },
        );
      },
    );
  }

  void _onUpdateSymbolPricesEvent(UpdateSymbolPricesEvent event, Emitter<HomeState> emit) {

    final updatedSymbols = List<SymbolEntity>.from(state.symbolsList!.map((symbol) {
      final updatesForSymbol = event.priceData.where((data) => data.s == symbol.symbol).toList();

      if (updatesForSymbol.isNotEmpty) {
        final latestUpdate = updatesForSymbol.last;
        if (latestUpdate.p != null) {

          final newPrice = latestUpdate.p;
          late Color color;
          if(newPrice! == (symbol.price??0)){
            color =Colors.grey;
          }else if(newPrice < (symbol.price??0)){
            color =Colors.redAccent;
          }else{
            color = Colors.green;
          }
          return symbol.copyWith(price: newPrice,color: color);
        }
      }

      return symbol;
    }));

    emit(state.copyWith(symbolsList: updatedSymbols));
  }

  @override
  Future<void> close() {
    _priceUpdatesSubscription?.cancel();
    closeWebSocketUseCase.call();
    return super.close();
  }
}