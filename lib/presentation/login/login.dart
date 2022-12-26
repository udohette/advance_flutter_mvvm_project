import 'package:advance_fluuter_project/app/di.dart';
import 'package:advance_fluuter_project/domain/use_case/login_usecase.dart';
import 'package:advance_fluuter_project/presentation/login/login_viewmodel.dart';
import 'package:advance_fluuter_project/resources/color_manager.dart';
import 'package:advance_fluuter_project/resources/string_manager.dart';
import 'package:advance_fluuter_project/resources/val;ues_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  TextEditingController _usernameEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _usernameEditingController.addListener(() {
      _viewModel.setUsername(_usernameEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _viewModel.setUserPassword(_passwordEditingController.text);
    });

  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
        body: Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
     // color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                //SvgPicture.asset(ImageAssets.loginIc),
                Image(image: AssetImage(ImageAssets.splashLogo)),
                SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUsernameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _usernameEditingController,
                        decoration: InputDecoration(
                          hintText: AppStrings.username,
                          labelText: AppStrings.username,
                          errorText: (snapshot.data ?? true) ? null : AppStrings.usernameError,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        //obscureText: true,
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: (snapshot.data ?? true) ? null : AppStrings.passwordError,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllOutputValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: AppSize.s40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false) ? () {_viewModel.login();} : null,
                            child: const Text(AppStrings.login)),
                      );
                    },
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(
                  top: AppPadding.p8,
                  right: AppPadding.p28,
                  left: AppPadding.p28,
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushReplacementNamed(context, Routes.forgotPasswordRoute);
                        }, child: Text(AppStrings.forgetPassword, style: Theme.of(context).textTheme.subtitle2,)
                        ),

                        TextButton(onPressed: (){
                          Navigator.pushReplacementNamed(context, Routes.registerRoute);
                        }, child: Text(AppStrings.registerText, style: Theme.of(context).textTheme.subtitle2,)
                        ),
                      ],
                  ),
                )
              ],
            )
        ),
      ),
    ));
  }
}