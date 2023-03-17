import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerHomeScreen/centerInterface.dart';
import 'package:flutter/material.dart';

import 'userHomeScreen/userInterface.dart';

class CenterSettings extends StatefulWidget {
  const CenterSettings({Key? key}) : super(key: key);

  @override
  State<CenterSettings> createState() => _CenterSettingsState();
}

class _CenterSettingsState extends State<CenterSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(44, 50, 3, 3),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>centerInterface()));
                      },
                      child: Container(
                      child: Image(
                          image: AssetImage
                            (
                            'images/backIcone.png',
                          ),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 50, 3, 3),
                    child: Text('Edit your profile',style: smllTitleBtn,),
                  ),
                ],
              ),
            ),
            Container(
              child: Image(
                image: AssetImage
                  (
                  'images/profilePicEdit.png',
                ),
              ),),
            Container(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)
                ),
                width: 320,
                height: 600,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
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
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                          ),
                          labelText: 'Summary',
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
                          labelText: 'No of students joined',
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
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: Text(
                              'Submit',
                              style: smllTitleBtn,
                            )),
                      ),
                    ),
                  ],
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
