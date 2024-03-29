import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/style.dart';

class CenterDetailScreen extends StatefulWidget {
  final uid;

  const CenterDetailScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<CenterDetailScreen> createState() => _CenterDetailScreenState();
}

class _CenterDetailScreenState extends State<CenterDetailScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("CenterDetails")
            .where("uid", isEqualTo: widget.uid)
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
                      Text(
                        centerDocument['centerName'],
                        style: titleBtn,
                      ),
                      Text(
                        centerDocument['catchingWord'],
                        style: smllTitleBtn,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 170,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: secondayColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'images/Trainerprofile.png',
                                            fit: BoxFit.cover,
                                            width: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            centerDocument['trainerName'],
                                            style: appText,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        centerDocument['qualification'],
                                        style: smllContnerTxt,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: secondayColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'images/goal.png',
                                            width: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            centerDocument['students'],
                                            style: appText,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Students now',
                                        style: smllContnerTxt,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: secondayColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/locationIcon.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        centerDocument['location'],
                                        style: appText,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                      SizedBox(
                        height: 20,
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
    );
  }
}
