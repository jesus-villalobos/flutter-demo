import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "dart:math";

import "package:faker/faker.dart";

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {

  Map<String, dynamic> firstNames = {"list": List.empty(growable: true), "generator": faker.person.firstName},
                        lastNames = {"list": List.empty(growable: true), "generator": faker.person.lastName},
                         captions = {"list": List.empty(growable: true), "generator": faker.lorem.sentence};

  @override
  void initState() {
    super.initState();
    generateNewData();
  }

  generateNewData() {
    for (Map<String, dynamic> dataObject in [firstNames, lastNames, captions]) {
      dataObject["list"].addAll(List.generate(10, (_) => dataObject["generator"]()));
    }
  }

  Widget createImageList() {
        
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider(height: 20.0, thickness: 8.0, color: Colors.white,);

        if (index ~/ 2 >= firstNames.length) generateNewData();

        final String firstName = firstNames["list"][index],
                      lastName = lastNames["list"][index],
                       caption = captions["list"][index];
        
        final NetworkImage image = NetworkImage("https://source.unsplash.com/random/$index");
        precacheImage(image, context);

        return createImageCard(
          "$firstName $lastName",
          "${firstName.toLowerCase()}-${lastName.toLowerCase()}",
          "${firstName.toLowerCase()}-${lastName.toLowerCase()}@sampleapp.com",
          caption,
          image
        );
      },
    );
  }

  Widget createImageCard(String fullName, String userName, String email, String caption, NetworkImage image) {

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
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Card is clicked.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.pop(context, 'ok');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Feed'),
      ),
      child: SafeArea(
        child: Scaffold(
          body: createImageList(),
        )
      )
    );
  }
}