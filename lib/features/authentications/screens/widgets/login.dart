// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/grouplist_screen.dart';
import 'package:project_2tamayoz/services/login_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'forgetpass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _EmployeeLoginScreenState();
}

class _EmployeeLoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    setState(() {});
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                      Column(
                        children: [
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
                                    "LogIn ",
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black26,
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
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Color(0XFF4D4C4C),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\,]+@([\w-]+\.)+[\w]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Please enter correct email';
                                        } else {
                                          return null;
                                        }
                                      },
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
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          labelText: 'Password',
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
                                        onPressed: () async {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            print(emailController.text);
                                            print(passwordController.text);
                                            loadingIndecatorTrue();

                                            try {
                                              await LoginService().login(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                              print('Success');
                                              loadingIndecatorFalse();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          GroupListScreen())));
                                              Get.snackbar(
                                                'Hi',
                                                'Sign in successful',
                                              );
                                            } catch (e) {
                                              print(e.toString());
                                              Get.snackbar(
                                                'Sorry',
                                                e.toString(),
                                                colorText: Colors.white,
                                              );
                                            }
                                            loadingIndecatorFalse();
                                          }
                                        },
                                        child: Text(
                                          'LogIn',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    ForgotPass())));
                                      },
                                      child: Text(
                                        'Forgot Your Password?',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
