

import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
   int?  status;
  @JsonKey(name: "message")
   String?  message;

}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
   String?  id;
  @JsonKey(name: "name")
   String?  name;
  @JsonKey(name: "noOfNotification")
   int?  noOfNotification;
  CustomerResponse(this.id, this.name, this.noOfNotification);

  // to json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>_$CustomerResponseFromJson(json);
// from  json
  Map<String, dynamic> toJson() =>_$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse{
  @JsonKey(name: "phone")
   String?  phone;
  @JsonKey(name: "link")
   String?  link;
  @JsonKey(name: "email")
   String?  email;
  ContactResponse(this.email, this.link, this.phone);

  // to json
  factory ContactResponse.fromJson(Map<String, dynamic> json) =>_$ContactResponseFromJson(json);
// from  json
  Map<String, dynamic> toJson() =>_$ContactResponseToJson(this);
}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
   CustomerResponse?  customer;
  @JsonKey(name: "contacts")
   ContactResponse?  contacts;
  AuthenticationResponse(this.contacts, this.customer);

  // to json
factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>_$AuthenticationResponseFromJson(json);
// from  json
Map<String, dynamic> toJson() =>_$AuthenticationResponseToJson(this);
}
