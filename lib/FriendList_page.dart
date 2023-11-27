import 'package:flutter/material.dart';
import 'package:friendfinder/constants.dart';
import '../components/TopButton.dart';
import '../components/Friend.dart';

enum Selection {
  friendList,
  friendRequest,
}

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  late Selection optionSelected;
  @override
  void initState() {
    optionSelected = Selection.friendList;
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
                TopButtons(
                  title: 'Friend List',
                  onPress: () {
                    setState(() {
                      optionSelected = Selection.friendList;
                    });
                  },
                  bcolor: optionSelected == Selection.friendList
                      ? kActiveBtnBackColor
                      : kInactiveBtnBackColor,
                  fcolor: optionSelected == Selection.friendList
                      ? kActiveBtnForeColor
                      : kInactiveBtnForeColor,
                ),
                SizedBox(width: 15.0),
                TopButtons(
                  title: 'Friend Requests',
                  onPress: () {
                    setState(() {
                      optionSelected = Selection.friendRequest;
                    });
                  },
                  bcolor: optionSelected == Selection.friendRequest
                      ? kActiveBtnBackColor
                      : kInactiveBtnBackColor,
                  fcolor: optionSelected == Selection.friendRequest
                      ? kActiveBtnForeColor
                      : kInactiveBtnForeColor,
                ),
              ],
            ),

            //Friend List
            MyFriend(title: 'Rahul Singh at Quench'),
            MyFriend(title: 'Meenakshi at M Block'),
            MyFriend(title: 'Sneha at Law Library'),
            MyFriend(title: 'Vidushi at Gym'),
            MyFriend(title: 'Rdx at Hostel C9'),
            MyFriend(title: 'Ritesh at LRC'),
          ],
        ),
      ),
    );
  }
}
