
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/userInterface.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/style.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25)
          ),
          width: 285,
          height: 400,

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
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: loginText,
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
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: loginText,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: whiteTxt,
                        fontSize: 19,
                    ),
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
          ],
          ),
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
