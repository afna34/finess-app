import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/screens/welcomeScreen/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Fitness App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen());
  }
  }