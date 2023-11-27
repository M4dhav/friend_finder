import 'package:flutter/material.dart';
import '../constants.dart';

class MyFriend extends StatelessWidget {
  MyFriend({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(20.0),
      // color: Colors.grey,
      width: 400.0,
      height: 80.0,
      padding: EdgeInsetsDirectional.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(200.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //profile image
          ImageIcon(
            AssetImage('images/pooh.png'),
            // size: 10.0,
          ),
          Text(
            title,
            style: kFriendTextStyle,
          ),
          SizedBox(width: 5.0),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
