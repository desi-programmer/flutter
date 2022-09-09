import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.center,
          child: const Text(
            "My Skills",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        //
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.7) / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Programming Langauges",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "Dart",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Javascript",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "C",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        //
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.7) / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Frameworks",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "Flutter",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "React Native",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Django",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        //
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.7) / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Other Tools",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "Flutter",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "React Native",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Django",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
      ],
    );
  }
}
