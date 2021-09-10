
import 'package:flutter/material.dart';

enum BeatyStyle {
  Simple,
}

class BeautyCell extends StatelessWidget {
  BeautyCell({
    required this.title,
    this.subTitle = "",
    this.onTap,
    this.subTitleClick,
    this.height = 45,
  });
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  final VoidCallback? subTitleClick;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 8),
      width: double.infinity,
      height: this.height,
      child: Column(children: [
        Row(
          children: [
            Container(
              child: Text(this.title),
            ),
            Spacer(),
            GestureDetector(
              onTap: this.subTitleClick,
              child: Container(
                child: Text(this.subTitle),
              ),
            )
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ]),
    );
  }
}
