import 'package:flutter/material.dart';
import 'package:registration_tidy/helper_class.dart';
import 'package:registration_tidy/module.dart';
import 'package:registration_tidy/list_screen.dart';

import 'main.dart';

class EditFormScreen extends StatefulWidget {
  const EditFormScreen({super.key});

  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  var studentNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var selectedGender;
  var _selectedQualification;

  var _firstTimeFlag = false;
  var _selectedId = 0;

  @override
  Widget build(BuildContext context) {
    if (!_firstTimeFlag) {
      print('data Executed');

      _firstTimeFlag = true;

      print('Data Received');

      final RegistrationDetails =
          ModalRoute.of(context)!.settings.arguments as RegistrationModels;

      _selectedId = RegistrationDetails.id!;

      studentNameController.text = RegistrationDetails.studentName;
      fatherNameController.text = RegistrationDetails.fatherName;
      motherNameController.text = RegistrationDetails.motherName;
      dateOfBirthController.text = RegistrationDetails.dateOfBirth;
      emailController.text = RegistrationDetails.email;
      phoneController.text = RegistrationDetails.phone;
      selectedGender = RegistrationDetails.gender;
      _selectedQualification = RegistrationDetails.qualification;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: mounted,
        title: Text(
          'Registration form',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('---->delete button clicked');
              showAlertDialog(context);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tidy Life Pvt Ltd',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white10,
                    backgroundImage:
                        AssetImage('image/tidy_image.png'),
                    radius: 75,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Name :'),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  reuseableFormField(
                    studentNameController,
                    'Enter Student Name',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a student name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Father Name :'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  reuseableFormField(
                    fatherNameController,
                    'Enter Father Name',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter father\'s name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Mother Name :'),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  reuseableFormField(
                    motherNameController,
                    'Enter Mother Name',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter mother\'s name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Gender :'),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Radio(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Date Of Birth :',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  reuseableFormField(
                    dateOfBirthController,
                    'Enter DOB',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'E-mail :',
                    ),
                  ),
                  SizedBox(
                    width: 54,
                  ),
                  reuseableFormField(
                    emailController,
                    'Enter Email',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'phone :',
                    ),
                  ),
                  SizedBox(
                    width: 54,
                  ),
                  reuseableFormField(
                    phoneController,
                    'Enter Phone Number',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      } else if (value.length != 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Qualification :'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: DropdownButton(
                      value: _selectedQualification,
                      hint: Text('Select Qualification'),
                      items: <String>[
                        '10th',
                        '12th',
                        'Degree',
                        'Master Degree',
                        'None'
                      ].map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedQualification = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 255,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  ),
                  onPressed: () {
                    print('----> Update Button Clicked');
                    if (_formKey.currentState!.validate()) {
                      _update();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ListScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _update() async {
    print('---->save');
    print('---->Student Name:${studentNameController.text}');
    print('---->Father Name:${fatherNameController.text}');
    print('---->Mother Name:${motherNameController.text}');
    print('---->DOB:${dateOfBirthController.text}');
    print('---->E-mail:${emailController.text}');
    print('---->Phone:${phoneController.text}');
    print('---->Qualification:${_selectedQualification}');
    print('---->Gender:${selectedGender}');

    Map<String, dynamic> row = {
      DataBaseHelper.columnId: _selectedId,
      DataBaseHelper.columnStudentName: studentNameController.text,
      DataBaseHelper.columnFatherName: fatherNameController.text,
      DataBaseHelper.columnMotherName: motherNameController.text,
      DataBaseHelper.columnDateOfBirth: dateOfBirthController.text,
      DataBaseHelper.columnEmail: emailController.text,
      DataBaseHelper.columnPhone: phoneController.text,
      DataBaseHelper.columnGender: selectedGender.toString(),
      DataBaseHelper.columnQualification: _selectedQualification.toString(),
    };

    final result = await dbHelper.updateRegistrationDetails(row);
    print('-------------------$result');

    _showSuccessSnackBar(this.context, 'Update Successfully');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ListScreen()),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  delete() async {
    await dbHelper.deleteRegistrationDetails(_selectedId);
    Navigator.of(this.context).push(
      MaterialPageRoute(builder: (context) => ListScreen()),
    );
    _showSuccessSnackBar(this.context, 'deleted successfully');
  }

  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          actions: [
            ElevatedButton(
              onPressed: () {
                delete();
              },
              child: Text('yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            )
          ],
        );
      },
    );
  }

  Widget reuseableFormField(
    TextEditingController userController,
    String hintname,
    String? Function(String?)? validator,
  ) {
    return Expanded(
      child: Container(
        height: 61,
        child: Card(
          margin: EdgeInsets.only(right: 16),
          child: TextFormField(
            controller: userController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintname,
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
