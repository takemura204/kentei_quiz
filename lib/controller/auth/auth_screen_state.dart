import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';

@freezed
abstract class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({
    @Default(0) final int currentImageIndex,
  }) = _Create;
}
