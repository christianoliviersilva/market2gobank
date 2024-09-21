import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:marketapp/presenter/pages/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Market Shopping 2goBank |',    
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 184, 33, 22),
        foregroundColor: Colors.white,   
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
        useMaterial3: true,     
      ),
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
    );
  }
}