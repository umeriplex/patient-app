import 'package:get/get.dart';
import 'package:patient_app/features/auth/model/user_model.dart';
import 'package:patient_app/features/auth/repository/auth_repository.dart';

class AuthController extends GetxController{
  final AuthRepository _authRepository;
  AuthController(this._authRepository);

  Future<bool> registerUser(String email, String password) async {
    return await _authRepository.registerUser(email, password);
  }

  Future<bool> loginUser(String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }

  Future<bool> saveUserDetails(UserModel user) async {
    return await _authRepository.saveUserDetails(user);
  }

  Future<UserModel?> getUser(String email) async {
    return await _authRepository.getUserDetails(email);
  }

  Future<void> signOut() async {
    await _authRepository.logoutUser();
  }

  Future<bool> isUserLoggedIn() async {
    return await _authRepository.isLogged();
  }

}