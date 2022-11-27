import "package:flutter/cupertino.dart";

import '../components/ProfilePageWidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: ProfilePageWidget(
        fullName: "Jesus Villalobos",
        userName: "jesus-villalobos",
        location: "Richmond, California",
        phoneNumber: "(111) 222-333",
        company: "UC Berkeley",
        image: NetworkImage("https://www.africanoverlandtours.com/wp-content/uploads/2014/04/animal_facts-e1396431549968.jpg"),
      ),
    );
  }
}