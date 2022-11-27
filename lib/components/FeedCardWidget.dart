import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import 'ProfilePageWidget.dart';

class FeedCardWidget extends StatelessWidget {
  
  final String fullName, userName, location, caption, phoneNumber, company;
  final NetworkImage image;

  const FeedCardWidget({
    super.key, 
    required this.fullName, 
    required this.userName,
    required this.location, 
    required this.caption, 
    required this.phoneNumber, 
    required this.company, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container( 
            padding: const EdgeInsets.all(10.0),
            child: Align( 
              alignment: Alignment.bottomLeft,
              child: Text(
                fullName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Align( 
              alignment: Alignment.bottomLeft,
              child: Text(
                caption,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            )
          ),
        ]
      ),
      onPressed: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(fullName),
                ),
                child: ProfilePageWidget(
                  fullName: fullName,
                  userName: userName,
                  location: location,
                  phoneNumber: phoneNumber,
                  company: company,
                  image: image,
                ),
              );
            }
          )
        );
      },
    );
  }
}