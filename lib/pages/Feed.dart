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

  var randomNumbers = List.generate(10, (_) => Random().nextInt(10000), growable: true);
  var randomFirstNames = List.generate(10, (_) => faker.person.firstName(), growable: true);
  var randomLastNames = List.generate(10, (_) => faker.person.lastName(), growable: true);
  var randomCaptions = List.generate(10, (_) => faker.lorem.sentence(), growable: true);

  updateRandomParts() {
    randomNumbers.addAll(List.generate(10, (_) => Random().nextInt(10000)));
    randomFirstNames.addAll(List.generate(10, (_) => faker.person.firstName(), growable: true));
    randomLastNames.addAll(List.generate(10, (_) => faker.person.lastName(), growable: true));
    randomCaptions.addAll(List.generate(10, (_) => faker.lorem.sentence(), growable: true));
  }

  Widget createImageList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider(
            height: 20.0, 
            thickness: 3.0, 
            color: Colors.white,
          );
        }

        final idx = index ~/ 2;

        if (idx >= randomNumbers.length) {
          updateRandomParts();
        }

        return createImageCard(idx);
      },
    );
  }

  Widget createImageCard(int index) {

    final String firstName = randomFirstNames[index];
    final String lastName = randomLastNames[index];
    final String caption = randomCaptions[index];

    final String fullName = "${firstName} ${lastName}";
    final String userName = "${firstName.toLowerCase()}-${lastName.toLowerCase()}";
    final String email = "${userName}@sampleapp.com";

    return CupertinoButton(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://source.unsplash.com/random/$index"),
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