
// this class is to  convert the response into  a non  nullable object

import 'package:advance_fluuter_project/app/extensions.dart';
import 'package:advance_fluuter_project/data/response/response.dart';
import 'package:advance_fluuter_project/domain/model/model.dart';

const ZERO = 0;
const EMPTY = "";

extension CustomerResponseMapper on CustomerResponse?{
  //this is method is to convert data from data layer to  domain layer
  Customer toDomain(){
    return Customer(this?.id?.orEmpty() ?? EMPTY, this?.name?.orEmpty() ?? EMPTY, this?.noOfNotification?.orZero() ?? ZERO);
  }
}

extension ContactResponseMapper on ContactResponse?{
  Contact toDomain(){
    return Contact(this?.email?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY, this?.phone?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.customer?.toDomain(),  this?.contacts?.toDomain());
  }
}