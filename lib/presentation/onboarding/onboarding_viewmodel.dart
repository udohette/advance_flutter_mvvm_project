import 'dart:async';

import 'package:advance_fluuter_project/domain/model/model.dart';
import 'package:advance_fluuter_project/presentation/base/baseviewmodel.dart';

import '../../resources/assets_manager.dart';
import '../../resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput, OnBoardingViewModelOutput{
  // Stream Controllers
  final StreamController<SliderViewObject> _streamController = StreamController();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
      int nextIndex = _currentIndex++;
      if (nextIndex >= _list.length) {
        _currentIndex = 0; // infinite loop to  go  item  inside the slider
      }
     //_postDataToView();
    return _currentIndex;
    }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex ==  -1) {
      _currentIndex =  _list.length - 1; // infinite loop to  go  the length of slider list
    }
   // _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderObject => _streamController.sink;

  //output
  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject) => slideViewObject);

  //private function
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onboarding_logo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onboarding_logo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onboarding_logo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onboarding_logo4),
  ];

  _postDataToView(){
    inputSliderObject.add(SliderViewObject(_list[_currentIndex], _list.length,_currentIndex));
  }


}
// input means the order that our viewModel will  receive from our view
abstract class OnBoardingViewModelInput{
  void goNext();// when user clicks on right arrow to  go next
  void goPrevious();// when user clicks on left arrow to  go previous
  void onPageChange(int index);
  Sink get inputSliderObject; // this is the way  to add data to the Stream...Stream input
}

// output means the data or result  that will  be sent from  our view model to  our view
abstract class OnBoardingViewModelOutput{
  Stream<SliderViewObject> get outputSliderViewObject;

}
class SliderViewObject{
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}