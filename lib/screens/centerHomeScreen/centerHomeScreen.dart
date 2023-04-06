import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerHomeScreen/centerProfileEditing/center_profile_editing.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CenterHomeScreen extends StatefulWidget {
  const CenterHomeScreen({Key? key}) : super(key: key);

  @override
  State<CenterHomeScreen> createState() => _CenterHomeScreenState();
}

class _CenterHomeScreenState extends State<CenterHomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CenterProfileEditing()));
            }, icon: Icon(Icons.settings_outlined,size: 30,)),
          )
        ],
      ),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("CenterDetails")
              .where("uid", isEqualTo: auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((centerDocument) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            child: Image.network(
                              centerDocument['imageUrl'],
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        Text(centerDocument['centerName'],style: titleBtn,),
                        Text(centerDocument['catchingWord'],style: smllTitleBtn,),
                        SizedBox(height: 25,),
                        Row(children: [
                          Column(
                            children: [
                            Container(
                              width: 170,
                              height: 115,
                              decoration: BoxDecoration(
                                color: secondayColor,
                                borderRadius:
                                BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:Column(
                                  children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Image.asset('images/Trainerprofile.png',fit: BoxFit.cover,width: 30,),
                                      SizedBox(width: 10,),
                                      Text(centerDocument['trainerName'],style: appText,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text(centerDocument['qualification'],style: smllContnerTxt,)
                                ],),
                              ),
                            ),
                          ],),
                          SizedBox(width: 30,),
                          Column(children: [
                            Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: secondayColor,
                                borderRadius:
                                BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:Column(
                                  children: [
                                  Row(
                                    children: [
                                      Image.asset('images/goal.png',width: 30,),
                                      SizedBox(width: 10,),
                                      Text(centerDocument['students'],style: appText,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text('Students now',style: smllContnerTxt,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: secondayColor,
                                borderRadius:
                                BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:Column(children: [
                                  Image.asset('images/locationIcon.png',width: 35,),
                                  SizedBox(height: 10,),
                                  Text(centerDocument['location'],style: appText,)
                                ],),
                              ),
                            ),
                          ],),
                        ],),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daily plans',
                                style: titleBtn,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: secondayColor,
                                        borderRadius: BorderRadius.circular(20)),
                                    width: 110,
                                    height: 142,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('images/dumple.png',width: 50,),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(13, 40, 0, 0),
                                          child: Column(
                                            children: [
                                              Text('Workout',style:appText,),
                                              Text('2 Hour',style: shadowTxt2,)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),Container(
                                    decoration: BoxDecoration(
                                        color: secondayColor,
                                        borderRadius: BorderRadius.circular(20)),
                                    width: 110,
                                    height: 142,
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('images/running.png',width: 50,),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(27, 27, 0, 0),
                                          child: Column(
                                            children: [
                                              Text('Running',style:appText,),
                                              Text('12 Km',style: shadowTxt2,)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),Container(
                                    decoration: BoxDecoration(
                                        color: secondayColor,
                                        borderRadius: BorderRadius.circular(20)),
                                    width: 110,
                                    height: 142,
                                    padding: EdgeInsets.all(1),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('images/water-bottle.png',width: 50,),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(27, 33, 0, 0),
                                          child: Column(
                                            children: [
                                              Text('Water',style:appText,),
                                              Text('2.7  litre',style: shadowTxt2,)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //                     Container(
                                  //                     decoration: BoxDecoration(
                                  // color: secondayColor,
                                  // borderRadius: BorderRadius.circular(20)),
                                  // width: 110,
                                  // height: 142,
                                  // padding: EdgeInsets.all(0),
                                  // child: Column(
                                  // crossAxisAlignment:
                                  // CrossAxisAlignment.start,
                                  // children: [
                                  // Image.asset('images/sleep.png',width: 50,),
                                  //                 Container(
                                  //                   padding: EdgeInsets.fromLTRB(27, 38, 0, 0),
                                  //                   child: Column(
                                  //                     children: [
                                  //                       Text('Sleep',style:appText,),
                                  //                       Text('7 Hour',style: shadowTxt2,)
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  // ],
                                  // ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fee Details',
                                style: titleBtn,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                centerDocument['feeDetails'],
                                style: smllTitleBtn,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            print('kjg');
                            final Uri _phoneNumber =
                            Uri.parse('tel:${centerDocument["contact"]}');
                            if (await canLaunchUrl(_phoneNumber)) {
                              launchUrl(_phoneNumber);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              color: secondayColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                                child: Text(
                                  'Contact us',
                                  style: btnText,
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
