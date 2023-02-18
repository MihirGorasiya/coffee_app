import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/statecontroller.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.myIndex,
  }) : super(key: key);

  final Controller c = Get.find();
  final VoidCallback onPressed;
  final String buttonText;
  final int myIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Obx(
        () => OutlinedButton(
          style: ButtonStyle(
            backgroundColor: c.coffeeType.value == myIndex
                ? MaterialStateProperty.all(const Color(0xffD4A056))
                : MaterialStateProperty.all(Colors.transparent),
            // foregroundColor: MaterialStateProperty.all(Color(0xff212325)),
            foregroundColor: c.coffeeType.value == myIndex
                ? MaterialStateProperty.all(Colors.white)
                : MaterialStateProperty.all(
                    const Color.fromARGB(255, 160, 160, 160)),
            side: MaterialStateProperty.all(
              const BorderSide(
                width: 3,
                color: Color(0xffD4A056),
              ),
            ),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
