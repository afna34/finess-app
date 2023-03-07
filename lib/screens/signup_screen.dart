import 'package:fitness_app/screens/userInterface.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
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
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Create your account',
                        style: submitBtn,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: fullNameEditingController,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: loginText,
                        onSaved: (value) {
                          fullNameEditingController.text = value!;
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
                            borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                          ),
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                              color: whiteTxt,
                              fontSize: 19
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailEditingController,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: loginText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: whiteTxt,
                              fontSize: 19
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordEditingController,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        style: loginText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: whiteTxt,
                              fontSize: 19
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>userInterface()));
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
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
