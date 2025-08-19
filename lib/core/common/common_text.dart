

import 'package:flutter/material.dart';


 Text appName =  Text("Preissler's Lunch",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color: Color(0xFF000000)),);


 Widget fieldName( String fieldName){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(fieldName,style: TextStyle(fontSize:14,fontWeight: FontWeight.w500,color: Colors.black ),),
  );
 }