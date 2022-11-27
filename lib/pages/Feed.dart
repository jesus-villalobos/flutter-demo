import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:faker/faker.dart";

import '../components/FeedCardWidget.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {

  Map<String, dynamic> firstNames = {"list": List.empty(growable: true), "generator": faker.person.firstName},
                        lastNames = {"list": List.empty(growable: true), "generator": faker.person.lastName},
                         captions = {"list": List.empty(growable: true), "generator": faker.lorem.sentence},
                           cities = {"list": List.empty(growable: true), "generator": faker.address.city},
                           states = {"list": List.empty(growable: true), "generator": faker.address.state},
                     phoneNumbers = {"list": List.empty(growable: true), "generator": faker.phoneNumber.us},
                        companies = {"list": List.empty(growable: true), "generator": faker.company.name};

  @override
  void initState() {
    super.initState();
    generateNewData();
  }

  generateNewData() {
    for (Map<String, dynamic> dataObject in [firstNames, lastNames, captions, cities, states, phoneNumbers, companies]) {
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
                          city = cities["list"][index],
                         state = states["list"][index];
        
        // final NetworkImage image = NetworkImage("https://source.unsplash.com/random/$index");
        const NetworkImage image = NetworkImage("https://www.africanoverlandtours.com/wp-content/uploads/2014/04/animal_facts-e1396431549968.jpg");
        precacheImage(image, context);

        return FeedCardWidget(
          fullName: "$firstName $lastName",
          userName: "${firstName.toLowerCase()}-${lastName.toLowerCase()}",
          location: "$city, $state",
          caption: captions["list"][index],
          phoneNumber: phoneNumbers["list"][index],
          company: companies["list"][index],
          image: image
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