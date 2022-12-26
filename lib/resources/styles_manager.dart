

import 'package:flutter/cupertino.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight,Color color,){
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);

}
//Regular style
TextStyle getRegularTextStyle({@required double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManager.regular, color);
}
//Light style
TextStyle getLightTextStyle({@required double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManager.light, color);
}
//Medium style
TextStyle getMediumTextStyle({@required double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManager.medium, color);
}
//Semi Bold style
TextStyle getSemiBoldTextStyle({@required double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManager.semiBold, color);
}
//Bold style
TextStyle getBoldTextStyle({@required double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManager.bold, color);
}