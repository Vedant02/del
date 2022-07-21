import 'package:flutter/material.dart';

import 'user.dart';

class AddUserDialog extends StatefulWidget {

  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {


  @override
  Widget build(BuildContext context) {

    Widget buildTextfield(String hint, TextEditingController controller){
      return Container(
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller ,
        ),
      );
    }

    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var PhoneNoController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child : Column(
          children: [
            Text(
                'Add User'
            ),
            buildTextfield("Username",usernameController),
            buildTextfield("Email",emailController),
            buildTextfield("Phone NO",PhoneNoController),

            ElevatedButton(onPressed: () {
              final user = User(usernameController.text, emailController.text, PhoneNoController.text);

              widget.addUser(user);

            }, child: Text('Add User'),),


          ],
        ),
      )

    );
  }
}
