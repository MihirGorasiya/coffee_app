// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_app/controller/statecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_outline_btn.dart';
import '../widgets/heading_text.dart';
import '../widgets/product_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller c = Get.find();
  double rotAngle = 0;
  ScrollController sController = ScrollController();
  List<String> coffeeType = [
    'our Spacial',
    'Strong',
    'light',
    'without Milk',
    'with Milk',
    'Hot',
    'Cold',
  ];

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xffEADBCC),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/0.png',
                      height: MediaQuery.of(context).size.width * 0.30,
                      width: MediaQuery.of(context).size.width * 0.30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaddedText(
                          text: "Today's Popular",
                          horizontal: 20,
                          textStyle:
                              TextStyle(fontSize: 20, color: Color(0xffD4A056)),
                        ),
                        PaddedText(
                          text: 'Flat white',
                          horizontal: 25,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        //TODO: change index
                        PriceBannerWidget(coffeePrice: '50', myIndex: 0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HeadingText(text: 'Our Specials'),
            // Card view
            SizedBox(
              height: 470,
              width: double.infinity,
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
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  controller: sController,
                  scrollDirection: Axis.horizontal,
                  itemCount: c.specialProducts.length,
                  itemBuilder: (context, index) {
                    return ProductListCard(
                      myIndex: index,
                      rotAngle: rotAngle,
                      imageURL: c.specialProducts[index]['image'],
                      coffeeName: c.specialProducts[index]['name'],
                      coffeePrice: c.specialProducts[index]['price'],
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            //   height: 40,
            //   width: double.infinity,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: coffeeType.length,
            //     itemBuilder: (context, index) {
            //       return CustomOutlineButton(
            //         onPressed: () {
            //           c.coffeeType.value == index
            //               ? c.coffeeType.value = -1
            //               : c.coffeeType.value = index;
            //         },
            //         buttonText: coffeeType[index],
            //         myIndex: index,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PaddedText extends StatelessWidget {
  const PaddedText({
    Key? key,
    this.horizontal,
    this.verticle,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final double? horizontal;
  final double? verticle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(
          horizontal: horizontal == null ? 0 : horizontal!,
          vertical: verticle == null ? 0 : verticle!),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
