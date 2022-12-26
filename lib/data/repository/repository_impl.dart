import 'package:advance_fluuter_project/data/data_source/remote_data_source.dart';
import 'package:advance_fluuter_project/data/mapper/mapper.dart';
import 'package:advance_fluuter_project/data/network/error_handler.dart';
import 'package:advance_fluuter_project/data/network/failure.dart';
import 'package:advance_fluuter_project/data/network/network_info.dart';
import 'package:advance_fluuter_project/data/request/request.dart';
import 'package:dartz/dartz.dart';


import '../../domain/model/model.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl extends Repository{

  RemoteDataSource  _remoteDataSource;
  NetworkInfo  _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
     if (await _networkInfo.isConnected) {
       try{
         // it's safe to  call the API
         final response = await _remoteDataSource.login(loginRequest);
         if (response.status  == APIInternalStatus.SUCCESS ) { //success
           //return data
           return Right(response.toDomain());
         }  else{
           // return Business Logic error
           return Left(Failure(response.status ?? APIInternalStatus.FAILURE, response.message ?? ResponseMessage.DEFAULT)); //Failure left
         }

       }catch(error){
         return Left(ErrorHandler.handler(error).failure);;
       }

     }  else{
       // return connection error
       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
     }

  }

}