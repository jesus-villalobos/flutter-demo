import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "dart:math";

import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  final imageAdditionStepSize = 10;
  var randomNumbers = List.generate(10, (_) => Random().nextInt(10000), growable: true);

  updateRandomNumbers() {
    var newNums = List.generate(10, (_) => Random().nextInt(10000));
    randomNumbers.addAll(newNums);
  }

  Widget createImageList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider();

        final idx = index ~/ 2;

        if (idx >= randomNumbers.length) {
          updateRandomNumbers();
        }

        return createImageCard(index);
      },
    );
  }

  Widget createImageCard(int index) {
    // other logic here
    return ListTile(
      title: Text(
        index.toString(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Feed'),
      ),
      child: createImageList(),
      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: const <Widget>[
      //       Center(
      //         child: Text('i can'),
      //       ),
      //     ]
      //   )
      // ),
    );
  }
}