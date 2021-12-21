import 'package:flutter/material.dart';

class GridViewItem extends StatefulWidget {
  final String title;
  final Color color;

  const GridViewItem(this.title, this.color, {Key? key}) : super(key: key);
  @override
  _GridViewItemState createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [widget.color.withOpacity(0.7), widget.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
