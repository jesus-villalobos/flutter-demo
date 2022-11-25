import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "./Feed.dart";
import "./Posts.dart";
import "./Profile.dart";
import "./Landing.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  bool firstLanding = true;
  List<Widget> data = [Feed(), const Posts(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('GlobeSisters Flutter Sample'),
      // ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60.0,
          backgroundColor: Colors.white,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bars),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              label: "Posts",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
            )
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return data[index];
            },
          );
        },
      )
    );
  }
}