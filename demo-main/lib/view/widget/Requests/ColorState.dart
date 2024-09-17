import 'package:flutter/material.dart';

class ColorState extends StatelessWidget {
  ColorState({this.state, this.image});

  String? state;
  String? image;
  @override
  Widget build(BuildContext context) {
    print("the state $state");
    return Container(
      height: double.infinity,
      color: state == "Rejection"
          ?  Color(0xffffdde5)
          : state == "Waiting"
              ? Color(0xfffdefc2)
              : Color(0xffcbf6cf),
      child: Image.asset(
        "${image}",
      ),
    );
  }
}
