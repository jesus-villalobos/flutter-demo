import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "dart:math";

class ProfilePageWidget extends StatelessWidget {
  
  final String fullName, userName, location, phoneNumber, company;
  final NetworkImage image;

  const ProfilePageWidget({
    super.key, 
    required this.fullName, 
    required this.userName,
    required this.location, 
    required this.phoneNumber, 
    required this.company, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child:
    
    Column(
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
                image: DecorationImage(
                  image: image,
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
                child: Text(
                  fullName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container( 
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  Random().nextInt(100).toString(),
                  style: const TextStyle(
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
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.at,
                          size: 12,
                          semanticLabel: "Username",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
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
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.phone,
                          size: 12,
                          semanticLabel: "Phone number",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: const TextStyle(
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
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.location_solid,
                          size: 12,
                          semanticLabel: "City, State",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
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
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(
                          CupertinoIcons.group,
                          size: 12,
                          semanticLabel: "Company",
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        company,
                        style: const TextStyle(
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
    )
  ));}
}