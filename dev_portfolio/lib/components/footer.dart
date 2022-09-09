import 'package:dev_portfolio/utils/socialrow.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: const [
          SocialRow(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "desiprogrammer",
          ),
        ],
      ),
    );
  }
}
