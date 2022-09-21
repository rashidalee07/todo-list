import 'package:flutter/material.dart';
import 'package:hive_db/hive_db_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

///import 'hive_db_class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  box = await Hive.openBox('myBox');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Hive DB',
    theme: ThemeData(
        
        primarySwatch: Colors.purple,
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.grey[400]),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.grey[400]),
          titleMedium: TextStyle(color: Colors.grey[400]),
          titleSmall: TextStyle(color: Colors.grey[400]),
          displayLarge: TextStyle(color: Colors.grey[400]),
          displayMedium: TextStyle(color: Colors.grey[400]),
          displaySmall: TextStyle(color: Colors.grey[400]),
          headlineLarge: TextStyle(color: Colors.grey[400]),
          headlineMedium: TextStyle(color: Colors.grey[400]),
          headlineSmall: TextStyle(color: Colors.grey[400]),
          labelLarge: TextStyle(color: Colors.grey[400]),
          labelMedium: TextStyle(color: Colors.grey[400]),
          labelSmall: TextStyle(color: Colors.grey[400]),
          bodyLarge: TextStyle(color: Colors.grey[400]),
          bodyMedium: TextStyle(color: Colors.grey[400]),
          bodySmall: TextStyle(color: Colors.grey[400]),
        ),

        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey[400]),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)))),
    home: const HiveDBClass(),
  ));
}
