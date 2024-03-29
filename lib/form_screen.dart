import 'package:flutter/material.dart';
import 'package:registration_tidy/helper_class.dart';
import 'package:registration_tidy/list_screen.dart';

import 'main.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: mounted,
        title: Text(
          'Registration form',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
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
            )),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white10,
                  backgroundImage:
                      AssetImage('image/500x500-square-bg-trans.png'),
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
                reuseableFormField(studentNameController, 'Enter Student Name'),
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
                reuseableFormField(fatherNameController, 'Enter Father Name'),
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
                reuseableFormField(motherNameController, 'Enter Mother Name'),
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
                    }),
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
                Text('Female')
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
                reuseableFormField(dateOfBirthController, 'Enter DOB'),
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
                reuseableFormField(emailController, 'Enter Email'),
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
                reuseableFormField(phoneController, 'Enter Phone Number'),
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
                      return DropdownMenuItem(value: value, child: Text(value));
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
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  onPressed: () {
                    print('----> Save Button Clicked');
                    _save();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ListScreen()));
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  void _save() async {
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
      DataBaseHelper.columnStudentName: studentNameController.text,
      DataBaseHelper.columnFatherName: fatherNameController.text,
      DataBaseHelper.columnMotherName: motherNameController.text,
      DataBaseHelper.columnDateOfBirth: dateOfBirthController.text,
      DataBaseHelper.columnEmail: emailController.text,
      DataBaseHelper.columnPhone: phoneController.text,
      DataBaseHelper.columnGender: selectedGender.toString(),
      DataBaseHelper.columnQualification: _selectedQualification.toString(),
    };
    final result = await dbHelper.insertregistrationdetails(row);
    print('-------------------$result');
    _showSuccessSnacksBar(this.context, 'Saved Successfully');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListScreen()));
  }

  void _showSuccessSnacksBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  Widget reuseableFormField(
      TextEditingController userController, String hintname) {
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
          ),
        ),
      ),
    );
  }
}
