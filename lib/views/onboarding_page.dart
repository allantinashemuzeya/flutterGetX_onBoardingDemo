import 'package:flutter/material.dart';
import 'package:onborading_demo/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {

  final _controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onBoardingPages[index].imageAsset),
                      SizedBox(height: 32),
                      Text(
                        _controller.onBoardingPages[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          _controller.onBoardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ));
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onBoardingPages.length,
                    (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color:
                                    _controller.selectedPageIndex.value == index
                                        ? Colors.red
                                        : Colors.grey,
                                shape: BoxShape.circle),
                          );
                        })),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child:FloatingActionButton(
                  elevation: 0,
                 child: Obx((){ return Text(_controller.isLastPage ? 'Start' : 'Next');}) ,
                onPressed: _controller.forwardAction,
                 ),
              )
          ],
        ),
      ),
    );
  }
}
