import 'package:flutter/material.dart';

import 'form_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Tidy Life Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: 160,
        child: FloatingActionButton(
          onPressed: () {
            print('Launch Button Clicked');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FormScreen()));
          },
          child: Text('Click here to Register'),
        ),
      ),
    );
  }
}
