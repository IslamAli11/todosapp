import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosapp/shared/dio_helper.dart';
import 'package:todosapp/view/splash_screen.dart';

import 'layout/cubit/cubit.dart';

void main() async{

  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit()..getData(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}

