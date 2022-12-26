class SliderObject{
  String title;
  String subTitle;
  String image;

  // Constructor to  take in  the boarding argument
  SliderObject(this.title, this.subTitle, this.image);
}
class Customer{
  String id;
  String name;
  int noOfNotification;
  Customer(this.id, this.name, this.noOfNotification);
}
class Contact{
  String phone;
  String link;
  String email;
  Contact(this.email, this.link, this.phone);
}
class Authentication{
  Customer? customer;
  Contact? contact;
  Authentication(this.customer,  this.contact);
}
class DeviceInfo{
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);

}