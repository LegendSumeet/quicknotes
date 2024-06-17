import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_and_register.g.dart';

@Riverpod(keepAlive: true)
class IsLoggedIn extends _$IsLoggedIn {
  @override
  bool build() {
    return false;
  }

  void login() {
    state = true;
  }
}

@Riverpod(keepAlive: true)
class IsRegistered extends _$IsRegistered {
  @override
  bool build() {
    return false;
  }

  void register() {
    state = true;
  }
}
