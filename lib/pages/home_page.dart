// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rotAngle = 0;
  ScrollController sController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xffD4A056),
        elevation: 0,
        title: Center(child: Text('Coffee hub')),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(CupertinoIcons.bag_fill),
          ),
        ],
      ),
      body: Column(
        children: [
          // ListView(),
          SizedBox(height: 15),

          // Card view
          Container(
            height: 540,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: NotificationListener(
              onNotification: (n) {
                if (n is ScrollUpdateNotification) {
                  rotAngle = (sController.position.pixels /
                          (sController.position.maxScrollExtent / 3)) *
                      360;
                  setState(() {});
                }
                return false;
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                controller: sController,
                scrollDirection: Axis.horizontal,
                children: [
                  ProductListCard(
                    rotAngle: rotAngle,
                    imageURL: 'assets/0.png',
                    coffeeName: 'Espresso Cappuccino',
                    coffeeDesc: 'Dark Roast',
                    coffeePrice: '60',
                  ),
                  ProductListCard(
                    rotAngle: rotAngle,
                    imageURL: 'assets/1.png',
                    coffeeName: 'Flat White',
                    coffeeDesc: 'tingy milky',
                    coffeePrice: '45',
                  ),
                  ProductListCard(
                    rotAngle: rotAngle,
                    imageURL: 'assets/2.png',
                    coffeeName: 'Long Black',
                    coffeeDesc: 'hot refreshment',
                    coffeePrice: '50',
                  ),
                  ProductListCard(
                    rotAngle: rotAngle,
                    imageURL: 'assets/3.png',
                    coffeeName: 'Latte',
                    coffeeDesc: 'strong fun',
                    coffeePrice: '70',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
