import 'package:flutter/material.dart';
import 'package:registration_tidy/edit_form_screen.dart';
import 'package:registration_tidy/helper_class.dart';
import 'package:registration_tidy/module.dart';

import 'form_screen.dart';
import 'main.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<RegistrationModels> registrationDetailslist = [];

  @override
  void initState() {
    super.initState();
    print('---->initState');
    _registrationDetails();
  }

  _registrationDetails() async {
    final _registrationModels = await dbHelper.getAllRegistrationDetails();
    _registrationModels.forEach((registrationDetailsrow) {
      setState(() {
        var registrationDetails = RegistrationModels(
          registrationDetailsrow[DataBaseHelper.columnId],
          registrationDetailsrow[DataBaseHelper.columnStudentName],
          registrationDetailsrow[DataBaseHelper.columnFatherName],
          registrationDetailsrow[DataBaseHelper.columnMotherName],
          registrationDetailsrow[DataBaseHelper.columnDateOfBirth],
          registrationDetailsrow[DataBaseHelper.columnEmail],
          registrationDetailsrow[DataBaseHelper.columnPhone],
          registrationDetailsrow[DataBaseHelper.columnGender],
          registrationDetailsrow[DataBaseHelper.columnQualification],
        );
        print(registrationDetailsrow[DataBaseHelper.columnId]);
        print(registrationDetailsrow[DataBaseHelper.columnStudentName]);
        print(registrationDetailsrow[DataBaseHelper.columnFatherName]);
        print(registrationDetailsrow[DataBaseHelper.columnMotherName]);
        print(registrationDetailsrow[DataBaseHelper.columnDateOfBirth]);
        print(registrationDetailsrow[DataBaseHelper.columnEmail]);
        print(registrationDetailsrow[DataBaseHelper.columnPhone]);
        print(registrationDetailsrow[DataBaseHelper.columnGender]);
        print(registrationDetailsrow[DataBaseHelper.columnQualification]);
        registrationDetailslist.add(registrationDetails);
      });
    });
  }

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
      body: ListView.builder(
        itemCount: registrationDetailslist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditFormScreen(),
                  settings: RouteSettings(
                      arguments: registrationDetailslist[index])));
            },
            child: ListTile(
              title: Text(registrationDetailslist[index].studentName +
                  '\n' +
                  registrationDetailslist[index].fatherName +
                  '\n' +
                  registrationDetailslist[index].motherName +
                  '\n' +
                  registrationDetailslist[index].dateOfBirth +
                  '\n' +
                  registrationDetailslist[index].email +
                  '\n' +
                  registrationDetailslist[index].phone +
                  '\n' +
                  registrationDetailslist[index].gender +
                  '\n' +
                  registrationDetailslist[index].qualification +
                  '\n'),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        height: 65,
        width: 160,
        child: FloatingActionButton(
          onPressed: () {
            print('---->Launch Button Clicked');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FormScreen()));
          },
          child: Text('Click here to Register'),
        ),
      ),
    );
  }
}
