import 'package:advance_fluuter_project/domain/model/model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';



abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}