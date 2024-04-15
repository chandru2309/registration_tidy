import 'package:flutter/material.dart';
import 'package:registration_tidy/helper_class.dart';
import 'package:registration_tidy/list_screen.dart';

import 'main.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var studentNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var selectedGender;
  var _selectedQualification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Registration form',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 5),
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
                    backgroundImage: AssetImage('image/tidy_image.png'),
                    radius: 75,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Name :'),
                  ),
                  SizedBox(width: 55),
                  reusableFormField(
                    studentNameController,
                    'Enter Student Name',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Father Name :'),
                  ),
                  SizedBox(width: 10),
                  reusableFormField(
                    fatherNameController,
                    'Enter Father Name',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter father\'s name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Mother Name :'),
                  ),
                  SizedBox(width: 6),
                  reusableFormField(
                    motherNameController,
                    'Enter Mother Name',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter mother\'s name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Gender :'),
                  ),
                  SizedBox(width: 35),
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Male'),
                      SizedBox(width: 15),
                      Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Date Of Birth :'),
                  ),
                  SizedBox(width: 10),
                  reusableFormField(
                    dateOfBirthController,
                    'Enter DOB',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('E-mail :'),
                  ),
                  SizedBox(width: 54),
                  reusableFormField(
                    emailController,
                    'Enter Email',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      } else if (!value!.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Phone :'),
                  ),
                  SizedBox(width: 54),
                  reusableFormField(
                    phoneController,
                    'Enter Phone Number',
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a phone number';
                      } else if (value?.length != 10) {
                        return 'Phone number must be 10 digits';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                        return DropdownMenuItem(value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedQualification = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 255,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  ),
                  onPressed: _save,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('----> Save Button Clicked');
      print('---->Student Name:${studentNameController.text}');
      print('---->Father Name:${fatherNameController.text}');
      print('---->Mother Name:${motherNameController.text}');
      print('---->DOB:${dateOfBirthController.text}');
      print('---->E-mail:${emailController.text}');
      print('---->Phone:${phoneController.text}');
      print('---->Qualification:${_selectedQualification}');
      print('---->Gender:${selectedGender}');

      Map<String, dynamic> row = {
        DataBaseHelper.columnStudentName: studentNameController.text,
        DataBaseHelper.columnFatherName: fatherNameController.text,
        DataBaseHelper.columnMotherName: motherNameController.text,
        DataBaseHelper.columnDateOfBirth: dateOfBirthController.text,
        DataBaseHelper.columnEmail: emailController.text,
        DataBaseHelper.columnPhone: phoneController.text,
        DataBaseHelper.columnGender: selectedGender,
        DataBaseHelper.columnQualification: _selectedQualification,
      };
      final result = await dbHelper.insertregistrationdetails(row);
      print('-------------------$result');
      _showSuccessSnackBar('Saved Successfully');
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListScreen()));
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget reusableFormField(
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