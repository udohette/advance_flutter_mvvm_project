import 'package:advance_fluuter_project/presentation/login/login.dart';
import 'package:advance_fluuter_project/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:advance_fluuter_project/resources/assets_manager.dart';
import 'package:advance_fluuter_project/resources/routes_manager.dart';
import 'package:advance_fluuter_project/resources/string_manager.dart';
import 'package:advance_fluuter_project/resources/val;ues_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/model/model.dart';
import '../../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();


  _bindOnBoardingViewModelToOnBoardingView(){
    _viewModel.start();
  }
  @override
  void initState() {
    _bindOnBoardingViewModelToOnBoardingView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot){
        return _getContentFromWidget(snapshot.data);
      },
    );
  }

  Widget _getContentFromWidget(SliderViewObject? sliderViewObject){
    if (sliderViewObject == null) {
      return Container();
    }else{
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.white
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numberOfSlides,
            onPageChanged: (value) {
             _viewModel.onPageChange(value);
            },
            itemBuilder: (context, index){
              return onBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }, child: Text(AppStrings.skip, textAlign: TextAlign.end, style: Theme.of(context).textTheme.subtitle2,)
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
      return Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Arrow
            Padding(padding: EdgeInsets.all(AppPadding.p14,),
              child: GestureDetector(
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.leftArrowIc)),
                onTap: () => _pageController.animateToPage(_viewModel.goPrevious(), duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut),
              ),
            ),
            //Circles Indicator
            Row(
              children: [
                for(int i = 0; i < sliderViewObject.numberOfSlides; i ++)
                  Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: _getProperCircle(i, sliderViewObject.currentIndex),
                  ),
              ],
            ),
            //Right Arrow
            Padding(padding: EdgeInsets.all(AppPadding.p14,),
              child: GestureDetector(
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.rightArrowIc)),
                onTap: () => _pageController.animateToPage(_viewModel.goNext(), duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut),
              ),
            )
          ],
        ),
      );
    }

    Widget _getProperCircle(int index, int _currentIndex){
       if (index == _currentIndex) {
         return SvgPicture.asset(ImageAssets.hollowCircleIc); // Selected Index
       } else{
         return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected Index
       }
    }

    @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class onBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

   onBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1,),
        ),
        SizedBox(height: AppSize.s60,),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

