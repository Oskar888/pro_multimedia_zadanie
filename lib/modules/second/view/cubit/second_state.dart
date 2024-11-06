part of 'second_cubit.dart';

@freezed
class SecondState with _$SecondState {
  const factory SecondState.loading() = _Loading;

  const factory SecondState.loaded() = _Loaded;
}
