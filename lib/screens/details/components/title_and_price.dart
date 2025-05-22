import 'package:flutter/material.dart';
import 'package:plantapp/constraint.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({super.key, required this.title, required this.country, required this.price});

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(
                  text: country,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$$price",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}