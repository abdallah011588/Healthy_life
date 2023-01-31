import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';

class ItemsDetailsScreen extends StatelessWidget
{
  final Map model;

  const ItemsDetailsScreen({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model["name"],
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Share.share('https://github.com/abdallah011588/Healthy_life');
                },
                icon: const Icon(Icons.share_rounded)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.memory(base64Decode( model["image"]) ,width: double.infinity,fit: BoxFit.cover,),
                   Text( model["text"],style: TextStyle(fontSize: 18.0,height: 2.0,color: HexColor('794626')),),
                ],
              ),
          ),
        ),
      ),
    );
  }
}








