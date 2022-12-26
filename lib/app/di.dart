

import 'package:advance_fluuter_project/app/app_prefs.dart';
import 'package:advance_fluuter_project/data/data_source/remote_data_source.dart';
import 'package:advance_fluuter_project/data/network/app_api.dart';
import 'package:advance_fluuter_project/data/network/network_info.dart';
import 'package:advance_fluuter_project/domain/repository/repository.dart';
import 'package:advance_fluuter_project/presentation/login/login_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/dio_factory.dart';
import '../data/repository/repository_impl.dart';
import '../domain/use_case/login_usecase.dart';

//final instance = GetIt.instance;
GetIt instance= GetIt.instance;




Future<void> initAppModule()async {

  final sharePrefs = await SharedPreferences.getInstance();

  //shared Preference instance
  instance.registerLazySingleton<SharedPreferences>(() => sharePrefs);

  //app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => instance());

  //Network Info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));

  //dio  factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio =   await instance<DioFactory> ().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementation(instance()));

  // Repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));
}

initLoginModule(){
  if (!GetIt.instance.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }

}