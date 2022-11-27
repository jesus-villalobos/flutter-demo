import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import '../components/ProfilePageWidget.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: const ProfilePageWidget(
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