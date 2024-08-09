import 'package:flutter/material.dart';

import 'login.dart';


class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  var _formkey = GlobalKey<FormState>();

  var confirmpassword = TextEditingController();
  var newpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE4C9E5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formkey,
                child: Stack(
                  children: [
                    Positioned(
                        left: -30,
                        right: 275,
                        top: -175,
                        bottom: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFFFEB06A),
                          ),
                        )),
                    Positioned(
                        left: 275,
                        right: -40,
                        top: 100,
                        bottom: -350,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFF36D6E7),
                          ),
                        )),
                    Positioned(
                      left: 37,
                      right: 37,
                      top: 200,
                      bottom: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 300,
                            ),
                            Text(
                              "Reset Password ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Set the new password for your account so you can login and access all the features.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0XFFD3D3D3),
                              ),
                              child: TextFormField(
                                  controller: newpassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Enter new password',
                                    labelStyle: TextStyle(
                                      color: Color(0XFF4D4C4C),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z 0-9]+$')
                                            .hasMatch(value)) {
                                      return 'Please enter correct password';
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0XFFD3D3D3),
                              ),
                              child: TextFormField(
                                  controller: confirmpassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'confirm Password',
                                    labelStyle: TextStyle(
                                      color: Color(0XFF4D4C4C),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z 0-9]+$')
                                            .hasMatch(value)) {
                                      return 'Please enter correct password';
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0XFFFEB06A),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                LoginScreen())));
                                  },
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

