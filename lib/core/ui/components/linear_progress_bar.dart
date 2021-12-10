import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  final String textIndicator;
  final double percentageValue;

  const LinearProgressBar({Key? key, required this.textIndicator, required this.percentageValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border.fromBorderSide(BorderSide(width: 3.0, style: BorderStyle.solid, color: Color(0xFF4D0351))),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 266,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF22AB86)),
                value: percentageValue,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            textIndicator,
            style:
                TextStyle(color: Color(0xFF4D0351), fontSize: 18, fontFamily: 'Manrope', fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
