import 'package:base_structor/core/models/base_view_model.dart';
import 'package:base_structor/core/models/request/req_sign_in.dart';
import 'package:base_structor/core/models/request/req_sign_up.dart';
import 'package:base_structor/core/repositories/auth_repository.dart';
import 'package:base_structor/core/services/http_service.dart';

import '../init/locator.dart';


class AuthViewModel extends BaseViewModel implements IAuthRepository {
  AuthRepository _authRepository = locator<AuthRepository>();


  AuthViewModel() {
    print("Auth VM Init");
    state = BaseState.Initial;
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
