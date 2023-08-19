import 'package:flutter/material.dart';
import 'package:labapp/colors.dart';
import 'package:labapp/modules/labpage/component/body.dart';
import 'package:flutter/rendering.dart';

class labPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: bottom(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}

class bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            // Handle the button press
          },
          onLongPress: () {
            // Handle the long press
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            // Foreground color
            shape: RoundedRectangleBorder(
              // Button shape
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text('Book now'),
        ),

    );
  }
}


