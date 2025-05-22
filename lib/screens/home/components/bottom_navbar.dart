import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/constraint.dart';
import 'package:plantapp/screens/profile/components/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding * 2,
      right: kDefaultPadding * 2,
      bottom: kDefaultPadding),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/home.svg")),
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/love.svg")),
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
          }, icon: SvgPicture.asset("assets/icons/profile.svg")), 
        ],
      ),
    
    );
  }
}