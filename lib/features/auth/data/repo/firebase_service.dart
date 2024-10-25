import '../../../../core/networking/api_service/api_result.dart';
import '../../../../core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class FirebaseAuthService {
// Single Responsibility: Each Repository has a single responsibility,
// which is to provide data for a specific type of entity.

  Future<ServiceResult<AuthResultStatus>> signUp(RegisterModel registerModel);

  Future<ServiceResult<AuthResultStatus>> signIn(LoginModel loginModel);

  Future<ServiceResult<void>> signOut();
}
