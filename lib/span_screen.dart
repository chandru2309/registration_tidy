import 'package:flutter/material.dart';

import 'edit_form_screen.dart';
import 'helper_class.dart';
import 'main.dart';
import 'module.dart';

class SpanScreen extends StatefulWidget {
  const SpanScreen({super.key});

  @override
  State<SpanScreen> createState() => _SpanScreenState();
}

class _SpanScreenState extends State<SpanScreen> {
  List<RegistrationModels> registrationDetailslist = [];

  @override
  void initState() {
    super.initState();
    print('---->initState');
    _getRegistrationDetails();
  }

  _getRegistrationDetails() async {
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
              title: Container(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Name: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].studentName,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Father Name: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].fatherName,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Mother Name: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].motherName,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   DOB: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].dateOfBirth,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].email,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Phone: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].phone,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Gender: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].gender,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '   Qualification: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: registrationDetailslist[index].qualification,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
