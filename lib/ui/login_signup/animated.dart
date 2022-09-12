// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/loading.dart';

import '../../firebase_services/auth_login.dart';
import '../screens/screens.dart';

class AnimatedListExample extends StatefulWidget {
  @override
  AnimatedListExampleState createState() {
    return AnimatedListExampleState();
  }
}

class AnimatedListExampleState extends State<AnimatedListExample> {
  final AuthLogin _auth = AuthLogin();

  double screenHeight = 260;
  String title = "Login";
  List<String> hints = ["Email", "Password", "Name"];
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final items = [];
  int counter = 2;
  void addItem() {
    setState(() {
      if (counter == 2) {
        counter += 1;
        items.insert(0, "itens ${items.length + 1}");
        _listKey.currentState!
            .insertItem(0, duration: const Duration(milliseconds: 600));
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      if (counter == 3) {
        counter -= 1;
        _listKey.currentState!.removeItem(
            index,
            (context, animation) => SizeTransition(
                sizeFactor: animation,
                child: const Card(
                  child: ListTile(
                    title: Text("Name"),
                  ),
                )),
            duration: const Duration(milliseconds: 600));

        // items.remove("itens ${counter}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Loading>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/organise1.jpeg",
                          ),
                          fit: BoxFit.fill)),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: MediaQuery.of(context).size.width,
                  height: screenHeight.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: AnimatedList(
                            key: _listKey,
                            initialItemCount: counter,
                            itemBuilder: (context, index, animation) =>
                                SizeTransition(
                                  sizeFactor: animation,
                                  key: UniqueKey(),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: TextField(
                                            controller: controllers[index],
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontStyle: FontStyle.italic),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 2.w),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                hintText: hints[index],
                                                hintStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontStyle:
                                                        FontStyle.italic))),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width - 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade300,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                // **************************

                                value.setLoading(true);
                                // ********************

                                //   For Signup
                                if (value.signup != false) {
                                  dynamic result = await _auth.creatUser(
                                    email: controllers[0].text,
                                    password: controllers[1].text,
                                    name: controllers[2].text,
                                  );
                                  if (result == null) {
                                    Fluttertoast.showToast(
                                        msg: "Error Signup",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2);
                                    value.setLoading(false);
                                    // Navigator.of(context).pop();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: " Signup Succesful",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2);
                                    value.setLoading(false);
                                    // Navigator.of(context).pop();
                                  }
                                }
                                // ********************  Signup

                                //  For Login

                                else if (value.signup == false) {
                                  dynamic login =
                                      await _auth.signInWithEmailAndPassword(
                                          email: controllers[0].text,
                                          password: controllers[1].text);

                                  if (login != null) {
                                    Fluttertoast.showToast(
                                        msg: "Successful Login",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2);
                                    value.setLoading(false);

                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            duration: const Duration(
                                                milliseconds: 700),
                                            alignment: Alignment.center,
                                            type: PageTransitionType.fade,
                                            child: const HomePage(),
                                            isIos: true));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "error Login",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2);
                                    value.setLoading(false);
                                  }
                                }

                                // ***********
                              },
                              child: value.loading
                                  ? Center(
                                      child: SpinKitWave(
                                      color: Colors.black54,
                                      size: 30.sp,
                                    ))
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          const Icon(
                                            Icons.key,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            value.signup ? "Signup" : "Login",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 17.sp),
                                          )
                                        ]),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Switch(
                              value: value.signup,
                              onChanged: (val) {
                                if (val) {
                                  addItem();
                                  value.setSignup(true);

                                  counter = 3;
                                  title = "Signup";

                                  screenHeight = 340;
                                  setState(() {});
                                } else if (val != true) {
                                  removeItem(0);
                                  value.setSignup(false);

                                  title = "Login";

                                  counter = 2;

                                  screenHeight = 260;
                                  setState(() {});
                                }
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
