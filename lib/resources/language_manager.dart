

import 'package:advance_fluuter_project/resources/string_manager.dart';

enum LanguageType{
   ENGLISH,
  ARABIC
}

extension LanguageTypeExtension on LanguageType{
     String getValue(){
       switch(this){

         case LanguageType.ENGLISH:
           return  AppStrings.ENGLISH;

         case LanguageType.ARABIC:
           return  AppStrings.ARABIC;
       }
     }
}