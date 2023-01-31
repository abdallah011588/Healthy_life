
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';

import '../main.dart';
import 'category_items/category_items_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('فوائد صحية'),
        actions: [
          IconButton(
              onPressed: (){
                Share.share('https://github.com/abdallah011588/Healthy_life');
              },
              icon: const Icon(Icons.share_rounded)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const[
                    Text("Rate us"),
                    SizedBox(width: 10,),
                    Icon(Icons.star,color: Colors.amber,),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                value: 1,
                onTap: (){},
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                     Text("About us"),
                    SizedBox(width: 10,),
                     Icon(Icons.info_outline,color: Colors.green,),
                  ],
                ),
                value: 2,
                onTap: (){},
              ),
            ],

          ),
        ],
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (context,AsyncSnapshot snapshot) {
        //  print(snapshot.data[0]);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
                child: CircularProgressIndicator(
                  backgroundColor:Colors.grey[300],
                  color: HexColor('45BE22'),
                ));
          }

          else if (snapshot.connectionState == ConnectionState.done) {

            if (snapshot.hasError) {
              return const Text('Error');
            }

            else if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return itemBuilder(
                      context,
                    snapshot.data[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 20,
                    color: Colors.grey[300],
                  );
                },
                itemCount: allData.length,
              );
            }
            else {
              return const Text('Empty data');
            }
          }
          else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),

    ) ;
  }
}

Widget itemBuilder(context,Map model,)
{
  return InkWell(
    onTap:(){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>CategoryItemsScreen(
              itemName: model["name"],
              items: model["items"],
            ),
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsetsDirectional.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model["name"],
              style: TextStyle(color: HexColor('794626'),fontSize: 18),
            ),
            const SizedBox(height: 10.0,),
           Image.memory(base64Decode(model["image"])),
            //   Image.network('${model.image}'),
          ],
        ),
      ),
    ),
  );
}



