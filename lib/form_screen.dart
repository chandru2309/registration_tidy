import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var studentNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
                child: Text(
              'Tidy Life Pvt Ltd',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            Text(
              'Registration Form',
              style: TextStyle(fontSize: 18),
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
                reuseableFormField(studentNameController),
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
                reuseableFormField(fatherNameController),
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
                reuseableFormField(motherNameController),
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
                    value: 'Yes',
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    }),
                Text('Male'),
                SizedBox(width: 15,),
                Radio(
                  value: 'No',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                Text('Female')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget reuseableFormField(TextEditingController userController) {
    return Expanded(
      child: Container(
        height: 50,
        child: Card(
          margin: EdgeInsets.only(right: 16),
          child: TextFormField(
            controller: userController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
