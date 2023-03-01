import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerInterface.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/color.dart';
import '../constants/style.dart';

class CenterLogin extends StatefulWidget {
  const CenterLogin({Key? key}) : super(key: key);

  @override
  State<CenterLogin> createState() => _CenterLoginState();
}

class _CenterLoginState extends State<CenterLogin> {
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
          height: 650,

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
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: loginText,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                    labelText: 'Center Name',
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
                    labelText: 'Give a catching word',
                    labelStyle: TextStyle(
                      color: whiteTxt,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: loginText,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                    labelText: 'Location',
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
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                    labelText: 'Short Summary',
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
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                    labelText: 'Number of students joined',
                    labelStyle: TextStyle(
                        color: whiteTxt,
                        fontSize: 19
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: TextField(
              //     style: loginText,
              //     decoration: InputDecoration(
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
              //       ),
              //       labelText: 'Logo',
              //       labelStyle: TextStyle(
              //           color: whiteTxt,
              //           fontSize: 19
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>centerInterface()));
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
