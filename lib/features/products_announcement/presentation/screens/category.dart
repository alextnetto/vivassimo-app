import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String? text;
  final String? path;
  final Widget? screen;

  const CategoryItem({Key? key, required this.text, this.path, this.screen}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  get text => widget.text;
  get path => widget.path;
  get screen => widget.screen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 45),
        height: 130,
        width: 376,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB4D8D8),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 29, top: 37, bottom: 36, right: 57.07),
              width: 135,
              height: 57,
              child: Text(
                '$text',
                style: TextStyle(color: Color(0xFF4D0351), fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              child: Image.asset(
                path,
                width: 130,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
