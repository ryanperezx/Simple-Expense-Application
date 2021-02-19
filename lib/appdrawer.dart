import 'package:flutter/material.dart';
import 'package:simpleexpenseapplication/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text("Replace with image"),
        decoration: BoxDecoration(color: Colors.transparent),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Text("Personal Finances",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
      ListTile(
        title: Text('Income'),
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.assets);
        },
      ),
      ListTile(
          title: Text('Expenses'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.expenses);
          }),
      ListTile(title: Text('Transfer'), onTap: () {}),
      Divider(),
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Text("Net Worth Builder",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
      ListTile(
        title: Text('Assets'),
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.assets);
        },
      ),
      ListTile(
          title: Text('Liabilities'),
          onTap: () =>
            Navigator.pushReplacementNamed(context, Routes.liabilities)
          ),
    ]));
  }
}
