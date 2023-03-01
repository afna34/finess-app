import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/style.dart';
import 'package:fitness_app/screens/UserLogin.dart';
import 'package:fitness_app/screens/centerLogin.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
            width: 150,
            fit: BoxFit.fill,
            image: AssetImage('images/welcome.png')),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Welcome to',
            style: welcomeTextBig,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'All in one fitness App',
            style: welcomeTextSmall,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UserLogin()));
          },
          child: Container(

            margin: const EdgeInsets.only(top: 20.0),
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: blackTxt,
              borderRadius: BorderRadius.circular(25),
            ),

            child: Center(
                child: Text(
              'USER',
              style: btnText,
            )),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CenterLogin()));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20.0),
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: blackTxt,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Text(
              'CENTER',
              style: btnText,
            )),
          ),
        )
      ]),
    );
  }
}
