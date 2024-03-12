import 'package:flutter/material.dart';
import 'package:registration_tidy/helper_class.dart';
import 'list_screen.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:ListScreen()
    );
  }
}