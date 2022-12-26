import 'package:advance_fluuter_project/presentation/forgot_password/forgot_passowrd.dart';
import 'package:advance_fluuter_project/presentation/login/login.dart';
import 'package:advance_fluuter_project/presentation/main/main.dart';
import 'package:advance_fluuter_project/presentation/onboarding/onboarding.dart';
import 'package:advance_fluuter_project/presentation/register/register.dart';
import 'package:advance_fluuter_project/presentation/splash/splah.dart';
import 'package:advance_fluuter_project/presentation/store_details/store_details.dart';
import 'package:advance_fluuter_project/resources/string_manager.dart';
import 'package:flutter/material.dart';

import '../app/di.dart';

class Routes{
  static const String splashRoute = "/splash";
  static const String onBoardingRoute = "/onbBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetails";
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context)=> const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (context)=> const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context)=> const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context)=> const MainView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (context)=> const ForgotPasswordView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context)=> const OnBoardingView());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (context)=> const StoreDetailsView());

      default: return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.noPageRouteFound),
      ),
      body: Center(child: const Text(AppStrings.noPageRouteFound)),
    ));
  }
}