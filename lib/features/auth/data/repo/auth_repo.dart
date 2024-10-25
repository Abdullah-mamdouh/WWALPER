
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wwalper_app/core/networking/api_service/api_result.dart';

import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'firebase_service.dart';

class AuthRepo  extends FirebaseAuthService{
  final FirebaseAuth auth ;

  AuthRepo(this.auth);
  @override
  Future<ServiceResult<AuthResultStatus>> signIn(LoginModel loginModel) async{
    try{
            final UserCredential response = await auth.signInWithEmailAndPassword(
              email: loginModel.email,
              password: loginModel.password,
            );
            if(response.user != null ){
              print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+response.user.toString()+'ssssssssssssssssssssssssssssssssssssssssss');
              return ServiceResult.success(AuthResultStatus.successful);
            }else{
              return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
            }
          } catch (errro) {
            return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)) );
          }

  }

  @override
  Future<ServiceResult<void>> signOut() async{
    try {
     final response =  await auth.signOut();
     return ServiceResult.success(AuthResultStatus.successful);
    } catch (error) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(error)));
    }
  }

  @override
  Future<ServiceResult<AuthResultStatus>> signUp(RegisterModel registerModel) async{
    try{
      final UserCredential response = await auth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      if(response.user != null ){
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+response.user.toString()+'ssssssssssssssssssssssssssssssssssssssssss');
        return ServiceResult.success(AuthResultStatus.successful);
      }else{
        return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
      } catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)) );
    }
  }
}
