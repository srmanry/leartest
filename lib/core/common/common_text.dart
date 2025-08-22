

import 'package:flutter/material.dart';


 Text appName =  Text("Preissler's Lunch",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color: Color(0xFF000000)),);


 Widget fieldName( String fieldName){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(fieldName,style: TextStyle(fontSize:14,fontWeight: FontWeight.w500,color: Colors.black ),),
  );
 }



 Widget BottonText(){
 return  Padding(
     padding: const EdgeInsets.only(bottom: 20,),
     child: Column(children: [
       const Text(
         'Your Profile helps us customize your experience',
         style: TextStyle(fontSize: 16, color:Color(0xFF9CA3AF)),
       ),
       SizedBox(height: 8,),
       Row(mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Icon(Icons.lock_open_outlined,size: 20,color: Color(0xFF9CA3AF),),
           const Text('Your data is secure and private',style: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF)),),
         ],
       ),
     ],),
   );
 }