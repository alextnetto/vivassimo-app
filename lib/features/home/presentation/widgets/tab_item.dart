import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int selectedIndex;
  final String iconPath;
  final String title;
  final bool setBorderBottom;

  const TabItemWidget(
      {Key? key,
      required this.onTap,
      required this.selectedIndex,
      required this.iconPath,
      required this.title,
      this.setBorderBottom = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: setBorderBottom ? Border(bottom: BorderSide(color: Color(0xff22AB86), width: 3)) : null),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                iconPath,
                // width: selectedIndex == 2 ? 30 : null,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff4D0351),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
