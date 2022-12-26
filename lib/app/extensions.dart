import 'dart:ffi';

// extension on String
extension nonNullString on String? {
  String orEmpty(){
    if(this == null){
      return "";
    }else{
      return this!;
    }
  }
}


// extension on int
extension nonNullInteger on int? {
  int orZero(){
    if(this == null){
      return 0;
    }else{
      return this!;
    }
  }
}