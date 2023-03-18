import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../constants/style.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                'images/userImage.png',
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("UserDetails")
                .where("uid", isEqualTo: auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                );
              } else {
                return Column(
                  children: snapshot.data!.docs.map((userDocument) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Hi",
                                        style: titleBtn,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        userDocument['userName'],
                                        style: titleBtn,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Chekout top fitness centers\n',
                                    style: shadowTxt,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("CenterDetails")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              );
                            } else {
                              return Column(
                                children:
                                    snapshot.data!.docs.map((centerDocument) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: secondayColor,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              ClipRect(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                child: Image.network(
                                                  centerDocument['imageUrl'],
                                                  fit: BoxFit.cover,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    centerDocument[
                                                        'centerName'],
                                                    style: appText,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        centerDocument[
                                                            'location'],
                                                        style: shadowTxt2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
