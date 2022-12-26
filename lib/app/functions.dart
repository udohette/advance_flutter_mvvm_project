

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../domain/model/model.dart';

Future<DeviceInfo>  getDeviceDetails() async{
  String name ="unknown";
  String identifier ="unknown";
  String  version ="unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try{
    if (Platform.isAndroid) {
      // return android device info
      var  build = await  deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id;
      version = build.version.toString();


    }else if (Platform.isIOS) {
      // return ios  device info
      var  build = await  deviceInfoPlugin.iosInfo;
      name = "${build.name!} ${build.model}";
      identifier = build.identifierForVendor.toString();
      version = build.systemVersion.toString();
    }


  }on PlatformException{
    // return default data here
    return DeviceInfo(name, identifier, version!);
  }
  return DeviceInfo(name, identifier, version!);
  }