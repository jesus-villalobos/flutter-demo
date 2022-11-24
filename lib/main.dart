import "package:flutter/cupertino.dart";
import 'pages/Home.dart';

void main() => runApp(const GlobeSistersDemoApp());

class GlobeSistersDemoApp extends StatelessWidget {
  const GlobeSistersDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(), 
      title: "GlobeSisters Demo Application",
      theme: CupertinoThemeData(brightness: Brightness.light),
    );
  }
}
