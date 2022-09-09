import 'package:dev_portfolio/utils/animated_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedIconButton(
          iconData: FontAwesomeIcons.facebook,
          onTap: () {},
        ),
        const SizedBox(
          width: 8.0,
        ),
        AnimatedIconButton(
          iconData: FontAwesomeIcons.instagram,
          onTap: () {},
        ),
        const SizedBox(
          width: 8.0,
        ),
        AnimatedIconButton(
          iconData: FontAwesomeIcons.twitter,
          onTap: () {},
        ),
      ],
    );
  }
}
