import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_life/shared/component.dart';

import 'modules/layout.dart';

Future<void> main() async {

  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await readJson();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فوائد صحية',
      theme: lightTheme,
      home: const Directionality(
          textDirection: TextDirection.rtl,
          child: AppLayout()
      ),
      debugShowCheckedModeBanner: false,
      /* ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              color: HexColor('45BE22'),//Colors.green,
              elevation: 0,
            ),
          ),*/
    );
  }
}






Map<String, dynamic> fruitItems={};
Map<String, dynamic>  vegetableItems= {};
Map<String, dynamic>  meetItems={};
Map<String, dynamic>  trainItems={};
Map<String, dynamic>  habitItems={};
Map<String, dynamic>  herbItems={};
List  allData=[];

Future readJson() async {
  final String response = await rootBundle.loadString("assets/app_json_data.json");
  final data = json.decode(response);
   fruitItems = data["فاكهة"];
   vegetableItems = data["خضروات"];
   meetItems = data["لحوم"];
   trainItems = data["تمارين"];
   habitItems = data["عادات"];
   herbItems = data["أعشاب"];


  return allData=[  fruitItems, vegetableItems ,meetItems ,herbItems ,trainItems ,habitItems];
}