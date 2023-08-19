import 'package:flutter/material.dart';
import 'package:labapp/colors.dart';
import '../labpage/component/available_tests.dart';

class ClassifiedTests extends StatelessWidget {
  const ClassifiedTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.grey,
          color: Colors.grey[150],
          child: Container(
            // height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'blood Tests',
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        AvailableTests item = availabetests[index];
                        return AvailableTests(
                          name: item.name,
                          category: item.category,
                          picture: item.picture,
                          price: item.price,
                          description: item.description,
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                      itemCount: availabetests.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
