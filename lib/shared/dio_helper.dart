import 'package:dio/dio.dart';

class DioHelper {
  static  Dio? dio;
  static  init(){

    dio=Dio(
      BaseOptions(
        baseUrl:  'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true,
      ),

    );

  }


  static Future<Response>getData({

    required String url,
    Map<String , dynamic>?query,


  })async
  {

    return await dio!.get(

      url,

    );
  }



}