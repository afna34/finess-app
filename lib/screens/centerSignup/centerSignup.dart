import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerHomeScreen/centerInterface.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/color.dart';
import '../../constants/color.dart';
import '../../constants/color.dart';
import '../../constants/color.dart';
import '../../constants/color.dart';
import '../../constants/style.dart';
import '../../model/centerModel.dart';
import '../centerLogin/centerLogin.dart';
import '../userLogin/UserLogin.dart';

class CenterSignup extends StatefulWidget {
  const CenterSignup({Key? key}) : super(key: key);

  @override
  State<CenterSignup> createState() => _CenterSignupState();
}

class _CenterSignupState extends State<CenterSignup> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final centerNameEditingControl = TextEditingController();
  final emailEditingControl = TextEditingController();
  final catchingEditingControl = TextEditingController();
  final locationEditingControl = TextEditingController();
  final summaryEditingControl = TextEditingController();
  final trainerEditingControl = TextEditingController();
  final studentsJoinedEditingControl = TextEditingController();
  final qualificationEditingControl = TextEditingController();
  final feeAmountEditingControl = TextEditingController();
  final feeDetailsEditingControl = TextEditingController();
  final contactEditingControl = TextEditingController();
  final passwordEditingControl = TextEditingController();
  final confirmPasswordEditingControl = TextEditingController();

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
      body: ListView(
        children: [
          Center(
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
                            'Add your center details',
                            style: submitBtn,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: centerNameEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              controller: centerNameEditingControl.text = value!;
                            },
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 3 Character)");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Center Name',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
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
                            controller: locationEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              locationEditingControl .text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Location',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: catchingEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              catchingEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Give a catching word',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: summaryEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              summaryEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Short summary',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: trainerEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              trainerEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Trainer name',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: studentsJoinedEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              studentsJoinedEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Number of students joined',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: qualificationEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              qualificationEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Qualification',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: feeAmountEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              feeAmountEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Fee amount',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: feeDetailsEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              feeDetailsEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Fee Details',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          TextFormField(
                            controller: contactEditingControl,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            style: loginText,
                            onSaved: (value) {
                              contactEditingControl.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("cannot be Empty");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Contact',
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
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller: confirmPasswordEditingControl,
                            obscureText: true,
                            validator: (value) {
                              if (confirmPasswordEditingControl.text !=
                                  passwordEditingControl.text) {
                                return "Password don't match";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              confirmPasswordEditingControl.text = value!;
                            },
                            style: loginText,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white), //<-- SEE HERE
                              ),
                              labelText: 'Confirm password',
                              labelStyle: TextStyle(color: whiteTxt, fontSize: 19),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              signUp(emailEditingControl.text, passwordEditingControl.text);
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
                                    'Sign up',
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
                        "Already have an account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CenterLogin()));
                        },
                        child: Text(
                          'Login',
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
        ],
      ),
    );
  }
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? worker = _auth.currentUser;

    CenterModel workerModel = CenterModel();

    // writing all the values
    workerModel.email = worker!.email;
    workerModel.uid = worker.uid;
    workerModel.centerName = centerNameEditingControl.text;
    workerModel.location = locationEditingControl.text;
    workerModel.catchingWord = catchingEditingControl.text;
    workerModel.summary = summaryEditingControl.text;
    workerModel.students = studentsJoinedEditingControl.text;
    workerModel.password = passwordEditingControl.text;
    workerModel.trainerName = trainerEditingControl.text;
    workerModel.qualification = qualificationEditingControl.text;
    workerModel.feeAmount = feeAmountEditingControl.text;
    workerModel.feeDetails = feeDetailsEditingControl.text;
    workerModel.contact = contactEditingControl.text;

    await firebaseFirestore
        .collection("CenterDetails")
        .doc(centerNameEditingControl.text)
        .set(workerModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => centerInterface()),
            (route) => false);
  }
}
