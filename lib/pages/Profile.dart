import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

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

  buildProfilePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://www.africanoverlandtours.com/wp-content/uploads/2014/04/animal_facts-e1396431549968.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ]
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Container( 
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Jesus Villalobos",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container( 
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "20",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.at,
                          size: 12,
                          semanticLabel: "Username",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "jesus-villalobos",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.phone,
                          size: 12,
                          semanticLabel: "Phone number",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "(555) 777-8888",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.location_solid,
                          size: 12,
                          semanticLabel: "City, State",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Richmond, California",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.group,
                          size: 12,
                          semanticLabel: "Company",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "UC Berkeley",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: buildProfilePage()
        )
      ),
    );
  }
}