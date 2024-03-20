import 'package:flutter/material.dart';
import 'package:registration_tidy/form_screen.dart';
import 'package:registration_tidy/helper_class.dart';
import 'package:registration_tidy/splash_screen.dart';

final dbHelper=DataBaseHelper();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:SplashScreen()
    );
  }
}