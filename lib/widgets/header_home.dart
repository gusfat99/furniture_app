import 'package:flutter/material.dart';

import '../theme.dart';

class HeaderHome extends StatelessWidget {
  final EdgeInsets margin;

  const HeaderHome({super.key, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(children: [
        logo(),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icon_cart.png',
              width: 30.0,
            ))
      ]),
    );
  }

  Widget logo() {
    return Row(
      children: [
        Image.asset(
          'assets/logo_dark.png',
          width: 53,
        ),
        SizedBox(
          width: 8.65,
        ),
        Text(
          'Space',
          style: blackTextStyle.copyWith(fontSize: 19.5, fontWeight: bold),
        )
      ],
    );
  }
}
