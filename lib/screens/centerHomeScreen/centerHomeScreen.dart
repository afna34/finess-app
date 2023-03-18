import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:flutter/material.dart';

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
                        SizedBox(height: 30,),
                        Row(children: [
                          Column(children: [
                            Container(
                              width: 170,
                              decoration: BoxDecoration(
                                color: secondayColor,
                                borderRadius:
                                BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:Column(children: [
                                  Text(centerDocument['trainerName'],style: appText,),
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
                                child:Column(children: [
                                  Text(centerDocument['students'],style: appText,),
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
                                  Icon(Icons.location_on,color: Colors.white,),
                                  SizedBox(height: 10,),
                                  Text(centerDocument['location'],style: appText,)
                                ],),
                              ),
                            ),
                          ],),
                        ],),
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
