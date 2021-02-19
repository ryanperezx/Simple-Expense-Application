import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleexpenseapplication/pages/assets.dart';
import 'package:simpleexpenseapplication/pages/expenses.dart';
import 'package:simpleexpenseapplication/pages/income.dart';
import 'package:simpleexpenseapplication/pages/liabilities.dart';
import 'package:simpleexpenseapplication/routes.dart';
import "credentials.dart" as global;
import 'main.dart';
import 'signup.dart';
import 'forgotPassword.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent)); //transparent statusbar
    return MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.white,
        ),
        title: 'Login Page',
        home: new Login(title: 'Login Page'),
        routes: <String, WidgetBuilder>{
          Routes.mainHolder: (BuildContext context) => new Main(),
          Routes.assets: (BuildContext context) => new Assets(),
          Routes.expenses: (BuildContext context) => new Expenses(),
          Routes.income: (BuildContext context) => new Income(),
          Routes.liabilities: (BuildContext context) => new Liabilities(),
        });
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  Widget signUp = Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topRight,
      child: new Builder(builder: (BuildContext context) {
        return TextButton(
          child: Text("Sign Up"),
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new SignUp()));
          },
        );
      }));

  Widget titleSection = Container(
    padding: const EdgeInsets.fromLTRB(10, 70, 0, 0),
    // the 10 for left padding is there to accommodate the un-removable padding of textbutton from left to right
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*1*/
        Text(
          "Hello.",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
        ),
        /*2*/
        Text("Please login to continue.",
            textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
        new Padding(padding: const EdgeInsets.only(bottom: 50)),
      ],
    ),
  );
  Widget textBoxes = Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Column(children: [
        new TextFormField(
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //inside padding
            labelText: "Enter Username",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Username cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 15)),
        new TextFormField(
          /* ADD FORGOT PASSWORD AND KEEP ME LOGIN*/
          obscureText: true,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //inside padding
            labelText: "Enter Password",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Password cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.visiblePassword,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 10)),
      ]));

  Widget loginBtn = Container(
      alignment: Alignment.center,
      child: new Builder(builder: (BuildContext context) {
        return SizedBox(
            width: 200.0,
            height: 40.0,
            child: OutlinedButton(
              child: Text("Login"),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.mainHolder);
              },
            ));
      }));

  Widget rememberAndForget = Container(
      padding: const EdgeInsets.only(right: 15), //kinda hacky
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: StatefulBuilder(
                builder: (context, _setState) => CheckboxListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text("Remember Me",
                      style:
                          new TextStyle(color: Colors.black45, fontSize: 14)),
                  value: global.remember,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool value) {
                    _setState(() {
                      global.remember = value;
                    });
                  },
                ),
              ),
            ),
            Flexible(child: new Builder(builder: (BuildContext context) {
              return TextButton(
                child: Text("Forgot Password?",
                    style: new TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    )),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ForgotPassword()));
                },
              );
            }))
          ]));

  //main function
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent)); //transparent statusbar
    return MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.white,
        ),
        title: 'Login Page',
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.all(20), //padding for all widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                signUp,
                titleSection,
                textBoxes,
                rememberAndForget,
                loginBtn,
              ],
            ),
          ),
        ),
        routes: <String, WidgetBuilder>{
          Routes.mainHolder: (BuildContext context) => new Main(),
          Routes.assets: (BuildContext context) => new Assets(),
          Routes.expenses: (BuildContext context) => new Expenses(),
          Routes.income: (BuildContext context) => new Income(),
          Routes.liabilities: (BuildContext context) => new Liabilities(),
        });
  }
}
