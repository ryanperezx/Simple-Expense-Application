import 'package:flutter/material.dart';

void main() => runApp(SignUp());

bool agree = false;

class SignUp extends StatelessWidget {
  Widget arrowBack = Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topLeft,
      child: new Builder(builder: (BuildContext context) {
        return TextButton(
          child: Text("<",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42)),
          style: TextButton.styleFrom(
              primary: Colors.black,
              padding: EdgeInsets.zero,
              minimumSize: Size(0,0)
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }));

  Widget titleSection = Container(
    padding: const EdgeInsets.fromLTRB(10,100,0,0), // the 10 for left padding is there to accommodate the un-removable padding of textbutton from left to right
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*1*/
        Text(
          "Welcome.",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
        ),
        /*2*/
        Text("Create your account.",
            textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
        new Padding(padding: const EdgeInsets.only(bottom: 20)),
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
            labelText: "Enter Username",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            //fillColor: Colors.green
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
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.email_outlined),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            labelText: "Enter Email address",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Email cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 15)),
        new TextFormField(
          obscureText: true,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
        new Padding(padding: const EdgeInsets.only(top: 15)),
        new TextFormField(
          obscureText: true,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            labelText: "Confirm Password",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Password cannot be empty";
            } else if (val.length == 5) {
              return "";
            } else {
              return "";
            }
          },
          keyboardType: TextInputType.visiblePassword,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 15))
      ]));

  Widget termsAndCondition = Container(
      child: StatefulBuilder(
    builder: (context, _setState) => CheckboxListTile(
      contentPadding: EdgeInsets.only(left: 20),
      title: Text(
          "By signing up, you accept the Term of service and Privacy Policy",
          style: new TextStyle(color: Colors.black45, fontSize: 14)),
      value: agree,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool value) {
        _setState(() {
          agree = value;
        });
      },
    ),
  ));

  Widget confirmBtn = Container(
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
              onPressed: () {},
            ));
      }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20), //padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              arrowBack,
              titleSection,
              textBoxes,
              termsAndCondition,
              confirmBtn
            ],
          ),
        ),
      ),
    );
  }
}
