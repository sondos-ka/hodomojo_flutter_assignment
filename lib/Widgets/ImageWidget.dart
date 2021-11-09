import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget ImageWidget(url){
  return Padding(
    padding: EdgeInsets.all(8),
    child: ClipRRect(
      child: Image.network(
     url,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius
          .circular(16),
    ),
  );



}