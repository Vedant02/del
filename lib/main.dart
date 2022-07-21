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
      home: MyFlutterList(),
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  State<MyFlutterList> createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  //List userList1 = ['asdad', 'sqwqws' , 'dssadaa','asasadc','dsaddas','dasdqwq'];
  List<Map<String, int>> userList1 = [
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18}
  ];
  // List userList2 = ['saaa', 'asdwqd'];
  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();

  // void addUserData(User user) {
  //   setState(() {
  //     userList.add(user);
  //   });
  // }

  // void showUserDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           content: AddUserDialog(addUserData),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 64,
        height: 45,
        child: FloatingActionButton(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.1)),
          backgroundColor: const Color(0xff91DEF2),
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Form(
                        key: fkey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter Site Name'),
                              controller: message,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Something";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter No. of Blocks'),
                              controller: number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Number";
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (fkey.currentState!.validate()) {
                                    userList1.add(
                                        {message.text: int.parse(number.text)});
                                    Navigator.pop(context);
                                    setState(() {});
                                  }
                                },
                                child: const Text('Add'))
                          ],
                        )),
                  );
                });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Container(
        color: Color(0xffE5E5E5),

        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffE5E5E5),
            ),
          ),
          Positioned(
            left: 20,
            top: 23,
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          Positioned(
            left: 55,
            top: 20,
            child: Text(
              "Projects",
              style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
            ),
          ),
          Align(
            alignment: Alignment(0.94, -0.96),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.blue[500],
                ),
              ),
            ),
          ),

          Container(

            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                bottom: MediaQuery.of(context).size.height * 0.10,
                right: MediaQuery.of(context).size.height * 0.020,
                left: MediaQuery.of(context).size.height * 0.020),

            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 15),
              itemCount: userList1.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 148,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  child: InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 10.0,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 13,
                            left: 11,
                            child: Image.asset('assets/images/proj_2.png'),
                          ),
                          Positioned(
                            top: 69,
                            left: 16,
                            child: Text(
                              userList1[index].keys.elementAt(0).toString(),
                              style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                            ),
                          ),
                          const Positioned(
                            top: 90,
                            left: 17,
                            child: Text(
                              "Ongoing Site",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  color: Color(0xff796A6A)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
                );
              },
            ),
          ),

        ]),
        // child:
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Row(
      //     children: [
      //       Expanded(
      //           child: ListView.builder(
      //               itemCount: userList1.length,
      //               itemBuilder: (context, i) {
      //                 return SizedBox(
      //                     height: 500,
      //                     child: Card(
      //                         child: Center(child: Text(userList1[i]))
      //                     )
      //                 );
      //               })
      //       ),
      //       Expanded(
      //           child: ListView.builder(
      //               itemCount: userList2.length,
      //               itemBuilder: (context, i) {
      //                 return SizedBox(
      //                   height: 500,
      //                   child: Card(
      //                     child: Center(child: Text(userList2[i])),
      //                   ),
      //                 );
      //               })
      //       ),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height*0.85,
      //   child: ListView.builder(itemBuilder: (context,index)
      //   {
      //     return Stack(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   margin: EdgeInsets.only(
      //                     top: 30
      //                   ),
      //                   height: 180,
      //                   width: 148,
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20.0)),
      //                     elevation: 10.0,
      //                     child: ListTile(
      //                       title: Text(userList[index].username),
      //                       subtitle: Text(userList[index].email),
      //                       trailing: Text(userList[index].phoneNo),
      //
      //                     ),),
      //                 ),
      //                 VerticalDivider(width: 0),
      //
      //                 Container(
      //                   margin: EdgeInsets.only(
      //                       top: 30
      //                   ),
      //                   height: 180,
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20.0)),
      //                     elevation: 10.0,
      //                     child: ListTile(
      //                       title: Text(userList[index+1].username),
      //                       subtitle: Text(userList[index+1].email),
      //                       trailing: Text(userList[index+1].phoneNo),
      //
      //                     ),),
      //                   width: 148,
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     );
      //   },
      //     itemCount: userList.length,
      //   ),
      // ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: MyFlutterList(),
//     );
//   }
// }
//
// class MyFlutterList extends StatefulWidget {
//   const MyFlutterList({Key? key}) : super(key: key);
//
//   @override
//   State<MyFlutterList> createState() => _MyFlutterListState();
// }
//
// class _MyFlutterListState extends State<MyFlutterList> {
//   List userList1 = [];
//   List userList2 = [];
//   static int count = 0;
//   TextEditingController name = TextEditingController();
//   TextEditingController number = TextEditingController();
//
//   // void addUserData(User user) {
//   //   setState(() {
//   //     userList.add(user);
//   //   });
//   // }
//
//   // void showUserDialog() {
//   //   showDialog(
//   //       context: context,
//   //       builder: (_) {
//   //         return AlertDialog(
//   //           content: AddUserDialog(addUserData),
//   //           shape: RoundedRectangleBorder(
//   //             borderRadius: BorderRadius.circular(10),
//   //           ),
//   //         );
//   //       });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: SizedBox(
//         width: 64,
//         height: 45,
//         child: FloatingActionButton(
//           shape:
//           BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.1)),
//           backgroundColor: const Color(0xff91DEF2),
//           child: const Icon(Icons.add), //child widget inside this button
//           // onPressed: showUserDialog,
//           onPressed: (){
//             showDialog(barrierDismissible: true,context: context, builder: (_){
//               return AlertDialog(
//                 content: Container(
//                   height: 200,
//                   width: 200,
//                   child: Form(child: Column(
//                     children: [
//                       TextFormField(
//                         controller: name,
//                         decoration: const InputDecoration(
//                             hintText: 'Enter Site Name',
//                             border: OutlineInputBorder()
//                         ),
//                       ),
//                       TextFormField(
//                         controller: number,
//                         decoration: const InputDecoration(
//                             hintText: 'Enter No of Blocks',
//                             border: OutlineInputBorder()
//                         ),
//                       ),
//                       ElevatedButton(onPressed: (){
//                         if(count % 2 == 0) {
//                           userList1.add(name.text);
//                           count += 1;
//                         } else {
//                           userList2.add(name.text);
//                           count += 1;
//                         }
//                         //Navigator.pop(context);
//                         setState((){});
//                       }, child: const Text('Add'))
//                     ],
//                   ),
//                   ),
//                 )
//               );
//             });
//           },
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//
//       body:Container(
//             color: Color(0xffE5E5E5),
//             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.10,
//                 bottom: MediaQuery.of(context).size.height*0.10,
//                 right: MediaQuery.of(context).size.height*0.015,
//                 left: MediaQuery.of(context).size.height*0.006),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                       child: ListView.builder(
//                           itemCount: userList1.length,
//                           itemBuilder: (context, i) {
//                             return Container(
//                               height: 180,
//                               margin: EdgeInsets.only(top: 22,
//                                   left: 75,
//                                   right: 20),
//                               child: InkWell(
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0)),
//                                   elevation: 10.0,
//                                   child: Stack(
//                                     children: [
//                                       Positioned(
//                                         top: 13,
//                                         left: 11,
//                                         child: Image.asset('assets/images/proj_2.png'),
//                                       ),
//                                       Positioned(
//                                         top: 69,
//                                         left: 16,
//                                         child: Text(userList1[i],
//                                           style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
//                                         ),
//                                       ),
//                                       const Positioned(
//                                         top: 90,
//                                         left: 17,
//                                         child: Text(
//                                           "Ongoing Site",
//                                           style: TextStyle(
//                                               fontSize: 10,
//                                               fontFamily: 'Inter',
//                                               color: Color(0xff796A6A)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: () {},
//                               ),
//                             );
//                           })
//                   ),
//                   Expanded(
//                       child: ListView.builder(
//                           itemCount: userList2.length,
//                           itemBuilder: (context, i) {
//                             return Container(
//                               height: 180,
//                               margin: EdgeInsets.only(top: 22,
//                                   right: 75,
//                                   left: 20),
//                               child: InkWell(
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0)),
//                                   elevation: 10.0,
//                                   child: Stack(
//                                     children: [
//                                       Positioned(
//                                         top: 13,
//                                         left: 11,
//                                         child: Image.asset('assets/images/proj_2.png'),
//                                       ),
//                                       Positioned(
//                                         top: 69,
//                                         left: 16,
//                                         child: Text(userList2[i],
//                                           style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
//                                         ),
//                                       ),
//                                       const Positioned(
//                                         top: 90,
//                                         left: 17,
//                                         child: Text(
//                                           "Ongoing Site",
//                                           style: TextStyle(
//                                               fontSize: 10,
//                                               fontFamily: 'Inter',
//                                               color: Color(0xff796A6A)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: () {},
//                               ),
//                             );
//                           })
//                   ),
//                 ],
//               ),
//
//           )
//
//       // body: Container(
//       //   height: MediaQuery.of(context).size.height*0.85,
//       //   child: ListView.builder(itemBuilder: (context,index)
//       //   {
//       //     return Stack(
//       //       children: [
//       //         Row(
//       //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //           crossAxisAlignment: CrossAxisAlignment.center,
//       //           children: [
//       //             Column(
//       //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //               crossAxisAlignment: CrossAxisAlignment.center,
//       //               children: [
//       //                 Container(
//       //                   margin: EdgeInsets.only(
//       //                     top: 30
//       //                   ),
//       //                   height: 180,
//       //                   width: 148,
//       //                   child: Card(
//       //                     shape: RoundedRectangleBorder(
//       //                         borderRadius: BorderRadius.circular(20.0)),
//       //                     elevation: 10.0,
//       //                     child: ListTile(
//       //                       title: Text(userList[index].username),
//       //                       subtitle: Text(userList[index].email),
//       //                       trailing: Text(userList[index].phoneNo),
//       //
//       //                     ),),
//       //                 ),
//       //                 VerticalDivider(width: 0),
//       //
//       //                 Container(
//       //                   margin: EdgeInsets.only(
//       //                       top: 30
//       //                   ),
//       //                   height: 180,
//       //                   child: Card(
//       //                     shape: RoundedRectangleBorder(
//       //                         borderRadius: BorderRadius.circular(20.0)),
//       //                     elevation: 10.0,
//       //                     child: ListTile(
//       //                       title: Text(userList[index+1].username),
//       //                       subtitle: Text(userList[index+1].email),
//       //                       trailing: Text(userList[index+1].phoneNo),
//       //
//       //                     ),),
//       //                   width: 148,
//       //                 ),
//       //               ],
//       //             ),
//       //           ],
//       //         ),
//       //       ],
//       //     );
//       //   },
//       //     itemCount: userList.length,
//       //   ),
//       // ),
//     );
//   }
// }
