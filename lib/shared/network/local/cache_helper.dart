import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{

  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

  }


 static Future<bool> putData({
  required String key,
  required bool value,
})async
  {
  return await  sharedPreferences.setBool(key, value);
  }



  static dynamic getData({
    required String key,
  })
  {

    return sharedPreferences.get(key);
  }



 static Future<bool> removeData({
  required String key,
})async

  {
  return await sharedPreferences.remove(key);
  }
}



