

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosapp/layout/cubit/states.dart';

import '../../shared/dio_helper.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<dynamic> data=[];

  void getData() async{
    emit(GetTodosLoadingState());
    await DioHelper.getData(
      url: '/todos/',

    ).then((value) {
     data = value.data;
      emit(GetTodosSuccessState());
      print('susssssssss');
    }).catchError((error) {
      emit(GetTodosErrorState());
      print(GetTodosErrorState());
    });

  }


}