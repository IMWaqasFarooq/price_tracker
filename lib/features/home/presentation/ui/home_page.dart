import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetSymbolsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Symbols'),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.error!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error ?? "")));
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.symbolsList == null || state.symbolsList!.isEmpty) {
                return  Center(child: Text('No symbols available.', style: TextStyle(fontSize: 14.sp),));
              }

              return ListView.builder(
                itemCount: state.symbolsList!.length,
                itemBuilder: (context, index) {
                  final symbol = state.symbolsList![index];
                  return Card(
                    margin:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    child: Padding(
                      padding:  EdgeInsets.all(15.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(symbol.displaySymbol ?? "", style:  TextStyle(fontSize: 15.sp)),
                          Text(formatToFourDecimalPlaces(symbol.price),
                              style:  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,
                                  color: symbol.color??Colors.black)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String formatToFourDecimalPlaces(double? number) {

    if(number!=null){
      String numberStr = number.toString();

      if (numberStr.contains('.') && numberStr.split('.')[1].length > 4) {
        return number.toStringAsFixed(4);
      }

      return numberStr;
    }else{
      return "---";
    }

  }
}
