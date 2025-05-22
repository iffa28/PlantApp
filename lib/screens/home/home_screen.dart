import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constraint.dart';
import 'package:plantapp/screens/home/components/body.dart';
import 'package:plantapp/screens/home/components/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: 
      BottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: (){}, 
        icon: SvgPicture.asset("assets/icons/menu.svg",
        color: Colors.white), ),

    );
  }
}

