// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'w_rotatable_image.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({
    Key? key,
    required this.rotAngle,
    required this.imageURL,
    required this.coffeeName,
    required this.coffeeDesc,
    required this.coffeePrice,
  }) : super(key: key);

  final double rotAngle;
  final String imageURL;
  final String coffeeName;
  final String coffeeDesc;
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
            CoffeeDescriptionWidget(coffeeDesc: coffeeDesc),
            Expanded(child: SizedBox()),
            PriceBannerWidget(coffeePrice: coffeePrice),
            SizedBox(height: 15),
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

class CoffeeDescriptionWidget extends StatelessWidget {
  const CoffeeDescriptionWidget({
    Key? key,
    required this.coffeeDesc,
  }) : super(key: key);

  final String coffeeDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        coffeeDesc,
        style: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 160, 160, 160),
        ),
      ),
    );
  }
}

class PriceBannerWidget extends StatelessWidget {
  const PriceBannerWidget({
    Key? key,
    required this.coffeePrice,
  }) : super(key: key);

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
