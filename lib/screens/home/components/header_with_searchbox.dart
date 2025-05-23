import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/constraint.dart';


class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
    height: size.height * 0.2,
    child: Stack(
      children: <Widget> [
        Container(
          padding: EdgeInsets.only(left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: 36 + kDefaultPadding),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            )
          ),
          child: Row(
            children: [
              Text('Hi Ulshop!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,             
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/logo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ] ,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none, 
                    //suffixIcon: SvgPicture.asset("assets/icons/search.svg")
                    )
                  ),
              ),
              SvgPicture.asset("assets/icons/search.svg")
            ],
          ),
          ),
        ),
        
      ],
    
    ),
    );
  }
}