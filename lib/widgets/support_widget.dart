import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppWidget{

  static TextStyle headlineTextStyle(double size){
    return TextStyle( color: Colors.black, fontSize: size, fontFamily: 'Poppins');
  }

  static TextStyle lightTextStyle(double size){
    return TextStyle( color: Colors.black, fontSize: size, fontFamily: 'Poppins1');
  }

  static Widget selectedCategory(String name) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: Material(
            elevation:3.0,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Center(child: Text(name, style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 18.0,),)),
            ),
          ),
    );

    
  }
   static TextStyle whiteTextStyle(double size){
    return TextStyle( color: Colors.white, fontSize: size, fontFamily: 'Poppins');
  }

  static TextStyle blackTextStyle(double size){
    return TextStyle( color: Colors.black, fontSize: size, fontFamily: 'Poppins');
  }

}