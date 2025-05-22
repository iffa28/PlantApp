import 'package:flutter/material.dart';
import 'package:plantapp/constraint.dart';
import 'package:plantapp/screens/details/details_screen.dart';

class RecommendPlants extends StatelessWidget {
  const RecommendPlants({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendVanillaCard(
            image: "assets/images/vanilla.png",
            title: "Vanilla",
            country: "Indonesia",
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen()),
              );
            },
          ),

          RecommendVanillaCard(
            image: "assets/images/tulip.png",
            title: "Tulip",
            country: "Indonesia",
            price: 440,
            press: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen()),
              );
            },
          ),

          RecommendVanillaCard(
            image: "assets/images/sunflower.png",
            title: "Sunflower",
            country: "Indonesia",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecommendVanillaCard extends StatelessWidget {
  const RecommendVanillaCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  });

  final String image, title, country;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      // menutupi 40% dari total lebar
      width: size.width * 0.4,
      child: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.asset(image,
            fit: BoxFit.cover)),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "$country".toLowerCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text('\$$price', style: TextStyle(color: kPrimaryColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
