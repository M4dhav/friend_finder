import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_sharp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Friend List and Friend Requests buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Friend List',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size(155, 48),
                    backgroundColor: Color(0xFF313131),
                    foregroundColor: Color(0xFFEEEEEE),
                  ),
                ),
                SizedBox(width: 15.0),
                TextButton(
                  child: Text(
                    'Friend Requests',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size(155, 48),
                    backgroundColor: Color(0xFFEEEEEE),
                    foregroundColor: Color(0xFF313131),
                  ),
                ),
              ],
            ),
            //Friend List
            Container(
              margin: EdgeInsetsDirectional.all(20.0),
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
                    AssetImage('images/profile.png'),
                    // size: 10.0,
                  ),
                  Text(
                    'Rahul Singh at Quench',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.all(20.0),
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
                    AssetImage('images/profile.png'),
                    // size: 10.0,
                  ),
                  Text(
                    'Meenakshi at M Block',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
