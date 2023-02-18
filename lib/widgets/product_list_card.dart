// ignore_for_file: prefer_const_constructors

import 'package:coffee_app/controller/statecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'w_rotatable_image.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({
    Key? key,
    required this.rotAngle,
    required this.imageURL,
    required this.coffeeName,
    required this.coffeePrice,
    required this.myIndex,
  }) : super(key: key);

  final int myIndex;
  final double rotAngle;
  final String imageURL;
  final String coffeeName;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 500,
        width: 280,
        decoration: BoxDecoration(
          color: const Color(0xff212325),
          borderRadius: BorderRadius.circular(50),
        ),

        // Main Contents
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RotatableImage(
              rotAngle: rotAngle,
              imageURL: imageURL,
            ),
            CoffeeNameWidget(coffeeName: coffeeName),
            PriceBannerWidget(coffeePrice: coffeePrice, myIndex: myIndex),
          ],
        ),
      ),
    );
  }
}

class CoffeeNameWidget extends StatelessWidget {
  const CoffeeNameWidget({
    Key? key,
    required this.coffeeName,
  }) : super(key: key);

  final String coffeeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        coffeeName,
        style: TextStyle(
          fontSize: 35,
          color: Color(0xffEADBCC),
        ),
      ),
    );
  }
}

class PriceBannerWidget extends StatelessWidget {
  PriceBannerWidget({
    Key? key,
    required this.coffeePrice,
    required this.myIndex,
  }) : super(key: key);

  final Controller c = Get.find();
  final int myIndex;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            '\$ $coffeePrice',
            style: TextStyle(
              fontSize: 35,
              color: Color(0xffD4A056),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            bool isExist = false;
            int index = -1;
            for (var i = 0; i < c.cartList.length; i++) {
              if (c.cartList[i]['index'] == myIndex) {
                isExist = true;
                index = i;
              }
            }
            if (isExist) {
              c.cartList[index]['qnt'] = c.cartList[index]['qnt']! + 1;
            } else {
              c.cartList.add({'index': myIndex, 'qnt': 1});
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffD4A056),
              borderRadius: BorderRadius.circular(45),
            ),
            width: 45,
            height: 45,
            child: const Icon(
              Icons.add_rounded,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
