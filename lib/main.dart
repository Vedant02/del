import 'package:del/user.dart';
import 'package:del/user_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home : MyFlutterList(),
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  State<MyFlutterList> createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {

  List<User> userList = [];
  
  @override
  Widget build(BuildContext context) {



    void addUserData(User user){
      setState((){
        userList.add(user);
      });
    }

    void showUserDialog(){
      showDialog(context: context, builder: (_){
        return AlertDialog(
          content: AddUserDialog(addUserData),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }
      );
    }

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 64,
        height: 45,
          child:FloatingActionButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.1)
            ),
            backgroundColor: Color(0xff91DEF2),
            child: Icon(Icons.add), //child widget inside this button
            onPressed: showUserDialog,
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Container(
        height: MediaQuery.of(context).size.height*0.85,
        child: ListView.builder(itemBuilder: (context,index)
        {
          return Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 30
                        ),
                        height: 180,
                        width: 148,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 10.0,
                          child: ListTile(
                            title: Text(userList[index].username),
                            subtitle: Text(userList[index].email),
                            trailing: Text(userList[index].phoneNo),

                          ),),
                      ),
                      VerticalDivider(width: 0),

                      Container(
                        margin: EdgeInsets.only(
                            top: 30
                        ),
                        height: 180,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 10.0,
                          child: ListTile(
                            title: Text(userList[index+1].username),
                            subtitle: Text(userList[index+1].email),
                            trailing: Text(userList[index+1].phoneNo),

                          ),),
                        width: 148,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
          itemCount: userList.length,
        ),
      ),
    );
  }
}
