import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    if (text == 'Clear') {
      return SizedBox(
        height: 50,
        width: 100,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(
                  width: 1,
                  color: HexColor("#15274B"),
                ),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              // backgroundColor: HexColor("#EAEDF2"),
              color: HexColor("#15274B"),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 50,
        width: 100,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(197, 4, 11, 70)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(
                  width: 1,
                  color: HexColor("#EAEDF2"),
                ),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              // backgroundColor: HexColor("#EAEDF2"),
              color: HexColor("#EAEDF2"),
            ),
          ),
        ),
      );
    }
  }
}
