import 'package:flutter/material.dart';
import 'package:plantapp/constraint.dart';
import 'package:plantapp/screens/details/components/image_and_icons.dart';
import 'package:plantapp/screens/details/components/title_and_price.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size),
          TitleAndPrice(title: "Vanilla", country: "Indonesia", price: 440),

          SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width / 2,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Buy Now",
                  style: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Description",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
