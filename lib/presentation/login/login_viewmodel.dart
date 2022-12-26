import 'dart:async';

import 'package:advance_fluuter_project/domain/use_case/login_usecase.dart';
import 'package:advance_fluuter_project/presentation/base/baseviewmodel.dart';
import 'package:advance_fluuter_project/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput, LoginViewModelOutput {

  StreamController _usernameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username); // data class operation same as Kotlin
    _validate();
  }

  @override
  setUserPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password); // data class operation same as Kotlin
    _validate();

  }

  @override
  login() async {
    (await _loginUseCase.execute(
        LoginUseCaseInput(loginObject.username, loginObject.password)))?.fold(
            (failure) =>
        {
          // left -> failure
          print(failure.message),
        },
            (data) =>
        {
          // right -> success
          print(data.customer?.name),
        });
  }

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;


  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;


  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));


  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllOutputValid => _isAllInputValidStreamController.stream.map((_) => _isAllInputValid());


  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String username) {
    return username.isNotEmpty;
  }

  bool _isAllInputValid() {
    return _isUserNameValid(loginObject.username) && _isPasswordValid(loginObject.password);
  }
  _validate(){
   inputIsAllInputValid.add(null);
  }
}

abstract class LoginViewModelInput{
  // threes functions for actions
  setUsername(String username);

  setUserPassword(String password);

  login();


  // two Sink for streams
Sink get  inputUsername;

Sink get inputPassword;

  Sink get inputIsAllInputValid;

}

abstract class LoginViewModelOutput{
  // this will take two Streams output
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllOutputValid;
}