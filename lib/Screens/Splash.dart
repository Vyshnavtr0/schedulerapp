import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:schedulerapp/Screens/Home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

nextScreen(context) async {
  await Future.delayed(Duration(seconds: 2));
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    nextScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        "SchedulerApp",
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      )),
    );
  }
}
