// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:khebra/core/remote/service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khebra/features/home/screens/home_screen.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit(this.api) : super(MainInitialState());
  ServiceApi api;

  int currentIndex = 0;

  List<Widget> navigationBarViews =const [
    HomeScreen(),
   
  ];

  void getHomePage() {
    currentIndex = 0;
    
  }


  void changeNavigationBar(int index) {
    currentIndex = index;
    print(currentIndex);
    // if (currentIndex == 0) getMarketers();

    // if (currentIndex == 1)
    //   if (myOrdersResponse.data == null)
    //   getMyOrders();
    // if (currentIndex == 2) {
    //   getUsers();
    //   getMyPosts();
    // }
    emit(AppNavBarChangeState());
  }
}
