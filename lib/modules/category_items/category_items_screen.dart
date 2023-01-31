import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';

import '../item_details/item_details_screen.dart';

class CategoryItemsScreen extends StatelessWidget
{
  final String itemName;
  final List items;

  const CategoryItemsScreen({
    required this.itemName,
    required this.items,
  });


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(itemName),
          actions: [
            IconButton(
                onPressed: (){
                  Share.share('https://github.com/abdallah011588/Healthy_life');
                },
                icon: const Icon(Icons.share_rounded)),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return categoryItemBuilder(context,items[index],);
          },
          separatorBuilder: (context,index){
            return Container(
              height: 10,
              color: Colors.grey[300],
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}



Widget categoryItemBuilder(context,Map model )
{
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>ItemsDetailsScreen(model: model),
          ) ,
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100.0,
        padding: const EdgeInsetsDirectional.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                model["name"] ,
                style: TextStyle(color: HexColor('794626'),fontSize: 18),
              ),
            ),
            const Spacer(),
            Image.memory(base64Decode(model["image"])),
          ],
        ),
      ),
    ),
  );
}