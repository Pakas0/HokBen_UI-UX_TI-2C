import 'package:flutter/material.dart';
import 'home_page.dart';
import 'order_status.dart';
import 'all_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HokBen Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED1C24)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // home: const OrderStatusPage(),
      // home: const AllMenuPage(),
    );
  }
}
