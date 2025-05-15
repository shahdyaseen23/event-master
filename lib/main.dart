import 'package:flutter/material.dart';
import 'RestaurantListScreen.dart'; // صفحة قائمة المطاعم
import 'ReservationScreen.dart'; // صفحة الحجز

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFFE3F2FD), // أزرق فاتح
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomeScreen (),
    );
  }
}
