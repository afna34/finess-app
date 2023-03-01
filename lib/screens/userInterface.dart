import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerInterface.dart';
import 'package:flutter/material.dart';

class userInterface extends StatefulWidget {
  const userInterface({Key? key}) : super(key: key);

  @override
  State<userInterface> createState() => _userInterfaceState();
}

class _userInterfaceState extends State<userInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(

                child:
            Image(image: AssetImage
              (
                'images/userImage.png',
            ),

            )),

            // Container(
            //   child: Positioned(
            //       right: 130,
            //       top: 190,
            //     child: Container(
            //
            //       height: 45,
            //       width: 150,
            //       decoration: BoxDecoration(
            //         color: boxColor,
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     )
            //   ),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 216.5, 0, 0),
              height: 650,
              color: primaryColor,
              child: Column(
                children: [
                  Container(
                    child:
                    Text('\nHi , Afna ',style: titleBtn,),
                  ),
                  Container(
                    child:
                    Text('Chekout top fitness centers\n',style: shadowTxt,),
                  ),

                  //search bar starting
                  Container(
                    height: 52,
                    width: 300,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Image(
                            image: AssetImage
                              (
                              'images/searchIcone.png',
                            ),
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Container(
                          child: Text('  Search your center',style: shadowTxt2,),
                        ),
                      ],
                    ),
                  ),
                  //search bar ending

                  Container(

                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>centerInterface()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 100,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: secondayColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                                        child: Image(
                                          image: AssetImage
                                            (
                                            'images/beFitLogo.png',
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text('Be fit fitness',style: appText,),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(25, 10, 0, 5),
                                                    child: Image(
                                                      image: AssetImage
                                                        (
                                                        'images/smallocation.png',
                                                      ),
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('  Manjeri,Malappuram',style: shadowTxt2,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//next container
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>centerInterface()));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20.0),
                                    height: 100,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: secondayColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                                          child: Image(
                                            image: AssetImage
                                              (
                                              'images/beFitLogo.png',
                                            ),
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text('Be fit fitness',style: appText,),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.fromLTRB(25, 10, 0, 5),
                                                      child: Image(
                                                        image: AssetImage
                                                          (
                                                          'images/smallocation.png',
                                                        ),
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text('  Manjeri,Malappuram',style: shadowTxt2,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //next container
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 100,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: secondayColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                                        child: Image(
                                          image: AssetImage
                                            (
                                            'images/beFitLogo.png',
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text('Be fit fitness',style: appText,),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(25, 10, 0, 5),
                                                    child: Image(
                                                      image: AssetImage
                                                        (
                                                        'images/smallocation.png',
                                                      ),
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('  Manjeri,Malappuram',style: shadowTxt2,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //next container
                              ],
                            ),
                          ),
                        ),
                        Container(/*2*/),
                        Container(/*3*/),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),

      ),
    );
  }
}
