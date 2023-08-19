import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:labapp/colors.dart';

import '../lab_page_controller.dart';

class Header extends StatelessWidget {

  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    LabController controller = Get.find();
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      // It will cover 20% of our total height
      height: size.height * 0.24,
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: 36 + kDefaultPadding,
          ),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
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
            height: 140,
            width: 140,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(controller.labData.value.image.toString()),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
