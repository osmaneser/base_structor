import 'package:base_structor/core/models/request/req_sign_in.dart';
import 'package:base_structor/core/models/request/req_sign_up.dart';
import 'package:base_structor/core/repositories/auth_repository.dart';
import 'package:base_structor/core/services/http_service.dart';
import 'package:flutter/material.dart';

import '../init/locator.dart';

enum AuthState { Initial, Loading, Done, Error }

class AuthViewModel with ChangeNotifier implements IAuthRepository {
  AuthRepository _authRepository = locator<AuthRepository>();

  AuthState _state;

  get state => _state;
  set state(AuthState value) {
    _state = value;
    notifyListeners();
  }

  AuthViewModel() {
    print("Auth VM Init");
  }

  @override
  Future doLogin({ReqSignIn signInData}) {
    _authRepository.doLogin(signInData: signInData);
  }

  @override
  Future doRegister({ReqSignUp signUpData}) {
    // TODO: implement doRegister
    throw UnimplementedError();
  }

  @override
  Future forgotPassword({String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  HttpService http;
}
