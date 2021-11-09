import 'package:flutter/cupertino.dart';
import 'package:hodomojoflutterassignment/Constants/colors.dart';


import 'package:sizer/sizer.dart';

Widget textDetailsWidget( title,desc){
  return Container(
    color: cLightYellow,
height: 20.h,

    child: Padding(

      padding: const EdgeInsets.fromLTRB(16,6,0,0),
      child: Align(

          alignment: Alignment.topLeft,
          child: Column(
      children: [

               Align(
                 alignment: Alignment.topLeft,
                 child: Text(title,style:TextStyle(color: cLightGrey, fontSize:18 ),
        ),
               ),
        SizedBox(height:3,),
        Text(desc,style:TextStyle(color: cDarkGrey, fontSize:16 ,fontWeight: FontWeight.bold))


      ],
    ),
  ))
  );


}