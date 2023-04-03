import 'package:shared_preferences/shared_preferences.dart';

class HelperFuncitons {
// keys
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

// saving the data to SF :
 static Future<bool?> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(userLoggedInKey,isUserLoggedIn);
  }
 static Future<bool?> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userNameKey,userNameKey);
  }
 static Future<bool?> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userEmailKey,userEmail);
  }


// getting the data from SF :
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<bool?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userEmailKey);
  }

  static Future<bool?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userNameKey);
  }
}
