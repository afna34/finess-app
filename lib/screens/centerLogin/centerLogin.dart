import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/centerHomeScreen/centerHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/color.dart';
import '../../constants/style.dart';
import '../centerHomeScreen/centerInterface.dart';
import '../centerSignup/centerSignup.dart';

class CenterLogin extends StatefulWidget {
  const CenterLogin({Key? key}) : super(key: key);

  @override
  State<CenterLogin> createState() => _CenterLoginState();
}

class _CenterLoginState extends State<CenterLogin> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  String? errorMessage;
  final emailEditingControl = TextEditingController();
  final passwordEditingControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Login your account',
                          style: submitBtn,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: emailEditingControl,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: loginText,
                          onSaved: (value) {
                            emailEditingControl.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white), //<-- SEE HERE
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                          ),
                        ),
                        TextFormField(
                          controller: passwordEditingControl,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordEditingControl.text = value!;
                          },
                          style: loginText,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white), //<-- SEE HERE
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            signIn(emailEditingControl.text, passwordEditingControl.text);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: btnText,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CenterSignup()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>CenterHomeScreen())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
