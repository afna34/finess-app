import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/screens/centerHomeScreen/centerHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/color.dart';
import '../../../constants/style.dart';

class CenterProfileEditing extends StatefulWidget {
  const CenterProfileEditing({Key? key}) : super(key: key);

  @override
  State<CenterProfileEditing> createState() => _CenterProfileEditingState();
}

class _CenterProfileEditingState extends State<CenterProfileEditing> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  String? downloadUrl;
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
                            'Edit your details',
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
                          ),$^ $^
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
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () async{
                              try {
                                updateData();
                                Fluttertoast.showToast(msg: 'Uploaded');
                              } catch (error) {
                                Fluttertoast.showToast(
                                    msg: 'You have to choose an image');
                              }
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
                                    'Save',
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

  updateData() async {
    await FirebaseFirestore.instance
        .collection('CenterDetails')
        .doc(_auth.currentUser!.uid)
        .update({
      "centerName": centerNameEditingControl.text,
      "location": locationEditingControl.text,
      "location": locationEditingControl.text,
      "catchingWord": catchingEditingControl.text,
      "summary": summaryEditingControl.text,
      "students": studentsJoinedEditingControl.text,
      "trainerName": trainerEditingControl.text,
      "qualification": qualificationEditingControl.text,
      "feeAmount": feeAmountEditingControl.text,
      "feeDetails": feeDetailsEditingControl.text,
      "contact": contactEditingControl.text,
    });
    Fluttertoast.showToast(msg: "Saved your data :)");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => CenterHomeScreen()),
            (route) => false);
  }



  Future getGallaryImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 5);
    if (pickedFile != null) {

      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
