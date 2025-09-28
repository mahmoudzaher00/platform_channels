import 'package:flutter/services.dart';

class NativeCommunications{
  static const platFormChannel =MethodChannel('com.native.channel');
  Future<double> getSumFromNative(double num1,double num2)async{
    try{
      final Map<String,dynamic> args = <String,dynamic>{
        'num1':num1,
        'num2':num2,
      };
      final result = await platFormChannel.invokeMethod('getSum',args);
      return result;
    }on PlatformException catch(e){
      throw 'Failed to get sum ${e.message}';
    }
  }

  Future<String> getNameFromNative(String name)async{
    try{
      final Map<String,dynamic> args = <String,dynamic>{
        'name':name,
      };
      final result = await platFormChannel.invokeMethod('getName',args);
      return result;
    }on PlatformException catch(e){
      throw 'Failed to get sum ${e.message}';
    }
  }
}