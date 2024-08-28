import 'dart:convert';
import 'package:patient_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/model/user_model.dart';
class Cache {
  static final Cache _cache = Cache._internal();
  late SharedPreferences _preferences;
  Cache._internal();

  factory Cache() => _cache;
  SharedPreferences get preferences => _preferences;

  Future<void> init () async {
    try{
      _preferences = await SharedPreferences.getInstance();

      print('Cache Initialized');
    }catch (ex){
      print("Error initializing Cache: $ex");
    }
  }

  Future<UserModel?> saveUserDetails (UserModel user) async {
    try{
      await _cache._preferences.setString(AppConstants.USER_DETAILS, jsonEncode(user.toJson()));
      return user;
    }catch (ex){
      print("Error Saving User Details: $ex");
      return null;
    }
  }

  UserModel? getUserDetails () {
    try{
      var user = _cache._preferences.getString(AppConstants.USER_DETAILS);
      if(user != null){
        return UserModel.fromJson(jsonDecode(user));
      }
    }catch (ex){
      print("Error Getting User Details: $ex");
    }
    return null;
  }

  Future<bool> putString (String key, String value) async {
    try{
      await _cache._preferences.setString(key, value);
      return true;
    }catch (ex){
      print("Error while putting string: $ex");
      return false;
    }
  }

  Future<String?> getString (String key) async {
    try{
      return _cache._preferences.getString(key);
    }catch (ex){
      print("Error while putting string: $ex");
      return null;
    }
  }

  Future<bool> clearData (String key) async {
    try{
      await _cache._preferences.remove(key);
      return true;
    }catch (ex){
      print("Error while clearing data: $ex");
      return false;
    }
}




}