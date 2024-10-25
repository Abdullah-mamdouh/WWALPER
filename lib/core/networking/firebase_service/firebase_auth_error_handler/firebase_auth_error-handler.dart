
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../error_model.dart';
import '../firebase_constant.dart';

enum AuthResultStatus {

  successful,
  invalidCredential,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
  ////////////////////////////////////
  // successful,
  // emailAlreadyExists,
  // wrongPassword,
  // invalidEmail,
  // userNotFound,
  // userDisabled,
  // operationNotAllowed,
  // tooManyRequests,
  // undefined,
}

class ResponseMessage {
  static const String INVALID_EMAIL =
      FirebaseErrors.invalidEmail;
  static const String EMAIL_ALREADY_EXISTS =
      FirebaseErrors.emailAlreadyExists;
  static const String WRONG_PASSWORD =
      FirebaseErrors.wrongPassword;
  static const String INVALID_CREDENTIA =FirebaseErrors.invalidCredential;
  static const String USER_NOT_FOUND =
      FirebaseErrors.userNotFound;
  static const String USER_DISABLED =
      FirebaseErrors.userDisabled;
  static const String TOO_MANY_REGUSTES =
      FirebaseErrors.tooManyRequests;
  static const String OPERATION_NOT_ALLOWED =
      FirebaseErrors.operationNotAllowed;
  static const String UNDIFIEND =
      FirebaseErrors.undefined;
}

extension AuthExceptionHandler on AuthResultStatus {
  ErrorModel getFailure() {
    //print(e.code);
    //var status;
    switch (this) {
      case AuthResultStatus.invalidEmail:
        return ErrorModel(
            code: 0, message: ResponseMessage.INVALID_EMAIL);
      case AuthResultStatus.wrongPassword:
        return ErrorModel(
            code: 0, message: ResponseMessage.WRONG_PASSWORD);
      case AuthResultStatus.invalidCredential:
        return ErrorModel(
            code: 0, message: ResponseMessage.INVALID_CREDENTIA);
      // case AuthResultStatus.ERROR_USER_DISABLED:
      //   return ErrorModel(
      //       code: 0, message: ResponseMessage.USER_DISABLED);
      // case AuthResultStatus.ERROR_TOO_MANY_REQUESTS:
      //   return ErrorModel(
      //       code: 0, message: ResponseMessage.TOO_MANY_REGUSTES);
      // case AuthResultStatus.ERROR_OPERATION_NOT_ALLOWED:
      //   return ErrorModel(
      //       code: 0, message: ResponseMessage.OPERATION_NOT_ALLOWED);
      case AuthResultStatus.emailAlreadyExists:
        return ErrorModel(
            code: 0, message: ResponseMessage.EMAIL_ALREADY_EXISTS);
      // case AuthResultStatus.unknown:
      //   return ErrorModel(
      //       code: 0, message: ResponseMessage.UNDIFIEND);
      default:
        return ErrorModel(
            code: 0, message: ResponseMessage.UNDIFIEND);

    }
  }

}

class ErrorHandler implements Exception {
  late ErrorModel firebaseErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseException) {
      // dio error so its an error from response of the API or from dio itself
      firebaseErrorModel = handleErrorAuth(error);
    } else {
      // default error
      firebaseErrorModel = AuthResultStatus.unknown.getFailure();
    }
  }
}

ErrorModel handleErrorAuth( FirebaseException error) {
  print(error.code.toString()+'asfssssdasssfffffffffffffffffffffff');
  switch (error.code) {
    case "invalid-email":
      return AuthResultStatus.invalidEmail.getFailure();
    case "invalid-credential":
      return AuthResultStatus.invalidCredential.getFailure();
    case "wrong-password":
      return AuthResultStatus.wrongPassword.getFailure();
    case "weak-password":
      return AuthResultStatus.weakPassword.getFailure();
    // case "ERROR_USER_DISABLED":
    //   return AuthResultStatus.ERROR_USER_DISABLED.getFailure();
    // case "ERROR_TOO_MANY_REQUESTS":
    //     return AuthResultStatus.ERROR_TOO_MANY_REQUESTS.getFailure();
    // case "ERROR_OPERATION_NOT_ALLOWED":
    //   return AuthResultStatus.ERROR_OPERATION_NOT_ALLOWED.getFailure();
    case "email-already-in-use":
      return AuthResultStatus.emailAlreadyExists.getFailure();
    default:
      return AuthResultStatus.unknown.getFailure();
  }
}
