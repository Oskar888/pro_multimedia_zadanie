part of 'first_cubit.dart';

@freezed
class FirstState with _$FirstState {
  const factory FirstState.loading() = _Loading;

  const factory FirstState.loaded() = _Loaded;
}
