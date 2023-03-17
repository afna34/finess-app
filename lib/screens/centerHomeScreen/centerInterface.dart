import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/centerSettings.dart';
import 'package:flutter/material.dart';

class centerInterface extends StatefulWidget {
  const centerInterface({Key? key}) : super(key: key);

  @override
  State<centerInterface> createState() => _centerInterfaceState();
}

class _centerInterfaceState extends State<centerInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
          child:
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CenterSettings()));
                },
                child: Container(
                  margin: EdgeInsets.all(18),
                  padding: EdgeInsets.fromLTRB(300, 12, 0, 0),
                  child:
                  Image(
                      width: 40,
                      image: AssetImage(
                        'images/editProfile.png',
                      ),
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
              Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image(
                      width: 75,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'images/beFitLogo.png',
                      )
                      ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'BE FIT',
                      style: titleBtn,
                    ),
                    Text(
                        'A guid to your goal',
                      style: smllTitleBtn,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(

                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 30, 15, 10),
                          decoration: BoxDecoration(
                            color: secondayColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 150,
                            width: 190,
                            child:
                            Container(
                              child:
                              Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Image(
                                            image: AssetImage
                                            (
                                            'images/Trainerprofile.png',
                                          ),
                                            height: 28,
                                            width: 28,
                                          )
                                        ),
                                        Container(
                                          child: Text('\t\t\tRahul',style: appText,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text('\nCirtified trainer,'
                                        '2 year experience',style: smllContnerTxt,),
                                  ),
                                ],
                              ),
                            ),

                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(

                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: secondayColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: SizedBox(
                                  height: 100,
                                  width: 140,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(20, 0, 5, 30),
                                            child: Image(
                                              image: AssetImage
                                                (
                                                'images/goal.png',
                                              ),
                                              height: 25,
                                              width: 25,
                                            )
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding:EdgeInsets.fromLTRB(25, 0, 5, 20)),
                                              Text('100',style: submitBtn,),
                                              Text('Students now',style: smllContnerTxt,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: secondayColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  height: 100,
                                  width: 140,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                          child: Image(
                                            image: AssetImage
                                              (
                                              'images/locationIcon.png',
                                            ),
                                            height: 25,
                                            width: 25,
                                          )
                                  ),
                                      Container(
                                        child:
                                        Text('\nCalicut,Kerala',style: smllContnerTxt,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(

                        children: [
                          Container(
                            child: Text('Equipments',style: titleBtn,textAlign: TextAlign.right,),

                          ),
                          Container(

                            child: SizedBox(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      child: Image(
                                        image: AssetImage
                                          (
                                          'images/equpmt1.png',
                                        ),

                                      )
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      child: Image(
                                        image: AssetImage
                                          (
                                          'images/equpmt2.png',
                                        ),

                                      )
                                  ),
                                ],
                              ),
                              height: 160,
                              width: double.maxFinite,
                            ),
                            //equipment pics
                            /*pics*/),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text('Fee Details',style: titleBtn,),
                          ),
                          Container(
                            child: Text('Daily Workouts You Can Do Anywhere. Work Out From Home,\n The Gym, Or Anywhere.'
                                ' Get Stronger. Move Better.',style: smllTitleBtn,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: secondayColor,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: Center(
                          child: Text(
                            'Join Now',
                            style: btnText,
                          )),
                    ),
                  ],
                  ),

              ),
            ],
          ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
