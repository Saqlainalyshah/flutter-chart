import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/lineChart/example2/example_2.dart';
import 'package:flutter_chart/model/model.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();
   ApiResponse apiRes=ApiResponse();

// Your getHttp function
  Future<ApiResponse> getHttp() async {
    final dio = Dio();

   try{
     final response = await dio.get('https://reqres.in/api/{resource}?page=2&per_page=6');
    final data = response.data;
       apiRes = ApiResponse.fromJson(data);
       print(apiRes);
     setState(() {
     });
   }catch (e){
     print(e.toString());
   }


    return apiRes;
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Flutter Chart"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Example2(apiRes: apiRes,),
      ),

    );
  }
}
