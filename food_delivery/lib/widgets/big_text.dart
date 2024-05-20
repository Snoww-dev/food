import 'package:flutter/material.dart';

class BigTest extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigTest({Key? key, this.color = const  Color.fromARGB(255, 4, 1, 15),
            required this.text,
            this.size  = 20,
            this.overFlow = TextOverflow.ellipsis
            }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: 1,
        overflow: overFlow,
        style : TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
        )
    );
  }
}