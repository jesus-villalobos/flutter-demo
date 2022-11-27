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
        image: NetworkImage("https://media-exp1.licdn.com/dms/image/C5603AQGtpTGXvoSomA/profile-displayphoto-shrink_800_800/0/1630608547049?e=2147483647&v=beta&t=p_DKxbSrPfdZBOSMtiExXQzSYu9PX3_btia0UgqCi6k"),
      ),
    );
  }
}