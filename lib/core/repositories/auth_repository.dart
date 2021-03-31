import 'package:base_structor/core/models/request/req_sign_in.dart';
import 'package:base_structor/core/models/request/req_sign_up.dart';
import 'package:base_structor/core/repositories/base_repository.dart';

abstract class IAuthRepository {
  Future<dynamic> doLogin({ReqSignIn signInData});
  Future<dynamic> doRegister({ReqSignUp signUpData});
  Future<dynamic> forgotPassword({String email});
}

class AuthRepository extends BaseRepository implements IAuthRepository {
  
  AuthRepository() {
    print("Auth Repo Init");
  }

  @override
  Future<dynamic> doLogin({ReqSignIn signInData}) {
    return http.httpPost(url: "account/login", data: signInData);
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
}
