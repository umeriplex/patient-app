import 'package:patient_app/core/session/cache.dart';
import 'package:patient_app/utils/app_constants.dart';

import '../../features/auth/model/user_model.dart';

class UserSession {
  static final UserSession _instance = UserSession._internal();
  UserModel? _user;
  late Cache cache;
  UserSession._internal();

  factory UserSession() => _instance;

  UserModel? get user => _user;

  Future<void> init() async {
    try{
      cache = Cache();
      await cache.init();
      _user = cache.getUserDetails();

      print('UserSession Initialized');

    }catch (ex){
      print("Error initializing UserSession: $ex");
    }
  }

  Future<UserModel?> saveUserDetails (UserModel user) async {
    try{
      _user = await cache.saveUserDetails(user);
      return _user;
    }catch (ex){
      print("Error Saving User Details: $ex");
      return null;
    }
  }

  UserModel? getUserDetails ()  {
    try{
      _user = cache.getUserDetails();
      return _user;
    }catch (ex){
      print("Error Getting User Details: $ex");
      return null;
    }
  }

  Future<bool> clearUserDetails () async {
    try{
      return await cache.clearData(AppConstants.USER_DETAILS);
    }catch (ex){
      print("Error Clearing User Details: $ex");
      return false;
    }
  }




}