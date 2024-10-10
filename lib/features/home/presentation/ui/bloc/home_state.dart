part of 'home_bloc.dart';


@freezed
class  HomeState with _$HomeState{
  const factory HomeState({
    bool? isLoading,
    bool? isSuccess,
    String? error,
    List<SymbolEntity>? symbolsList,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    isLoading: false,
    isSuccess:false,
    symbolsList : [],
    error: '',
  );
}