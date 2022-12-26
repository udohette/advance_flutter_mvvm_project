import 'package:advance_fluuter_project/data/network/app_api.dart';
import 'package:advance_fluuter_project/data/request/request.dart';
import '../response/response.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

}
class RemoteDataSourceImplementation implements RemoteDataSource{
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementation(this._appServiceClient);


  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password, loginRequest.imei, loginRequest.deviceType);

  }

}