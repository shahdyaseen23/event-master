import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'GiftScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  locale: Locale('ar'),
  supportedLocales: [
    Locale('ar'),
    Locale('en'),
  ],
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.ltr, // ← المحاذاة للشمال
      child: child!,
    );
  },
  theme: ThemeData(
    fontFamily: 'Cairo',
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Color(0xFFE3F2FD),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      centerTitle: true,
    ),
  ),
  home: GiftsScreen(),
);
  }
}