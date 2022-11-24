import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
// import "../components/AppFooter.dart";

import "./Feed.dart";
import "./Posts.dart";
import "./Profile.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {

  List<Widget> data = [const Feed(), const Posts(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Uncomment to change the background color
      // backgroundColor: Color.fromARGB(255, 255, 212, 254),
      navigationBar: const CupertinoNavigationBar(
        middle: Text('GlobeSisters Flutter Sample'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.blueGrey,
            activeColor: Colors.white,
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