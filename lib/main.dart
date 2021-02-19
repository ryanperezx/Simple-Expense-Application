import 'package:flutter/material.dart';
import 'package:simpleexpenseapplication/appdrawer.dart';


void main() => runApp(Main());

class Main extends StatelessWidget {
  static const String routeName = 'main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(),
      drawer: AppDrawer(),
    );
  }
}