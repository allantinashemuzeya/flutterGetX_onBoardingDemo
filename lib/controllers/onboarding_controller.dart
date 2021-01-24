import 'package:flutter/material.dart';
import 'package:onborading_demo/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnBoardingController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length -1;
  forwardAction(){
    if(isLastPage){
      // Go to home page
    }else{
        pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      'assets/order.png',
      'Order Your Food',
      'Now you can order from your mobile phone'
    ),
    OnBoardingInfo(
      'assets/cook.png',
      'Cooking Safe food',
      'We maintain safety and We Keep clean while making food'
    ),
    OnBoardingInfo(
      'assets/deliver.png',
      'Quick Delivery',
      'Order your favourite meals and expect immediate delivery.'
    ),
  ];

}