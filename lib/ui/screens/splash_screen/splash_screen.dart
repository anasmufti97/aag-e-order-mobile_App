import 'dart:async';

import 'package:aag_e_order_app/ui/screens/authentications_screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool isChecked = true;

  AnimationController? animController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 0, end: 3).animate(animController!)
      ..addListener(() {
        setState(() {});
      });
    animController?.repeat(max: 1);
    animController?.forward();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    if (isChecked) {
      setState(() {
        isChecked = false;
      });
      Timer(const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/logo.png")),
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
            child: Center(
                child: LinearProgressIndicator(
              value: animation!.value,
            )),
          ),
        ],
      ),
    );
  }
}
