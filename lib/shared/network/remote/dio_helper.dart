import 'package:dio/dio.dart';
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca


//https://newsapi.org/v2/everything?q=tesla&from=2021-07-20&sortBy=publishedAt&apiKey=5aba255bbaa94fc98c02a13326d010d4
class DioHelper
{

  static late Dio dio;

 static init()
 {
   dio= Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true,
       headers: {
         'Content-Type':'application/json',
       }
     ),
   );
 }

 static Future<Response> getData({
   required String url,
    Map<String,dynamic> ? query,
    String lang="en",

 }) async
 {
   dio.options.headers =
   {
     'Content-Type':'application/json',
     'Lang':lang,
   };

   return await dio.get(url, queryParameters: query,);
 }

}