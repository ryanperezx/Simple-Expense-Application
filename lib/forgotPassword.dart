import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPassword createState() => new _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
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
              minimumSize: Size(0, 0)),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }));

  Widget titleSection = Container(
    padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
    // the 10 for left padding is there to accommodate the un-removable padding of textbutton from left to right
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*1*/
        Text(
          "Forgot your password?",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
        ),
        /*2*/
        Text("We're here to help.",
            textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
        new Padding(padding: const EdgeInsets.only(bottom: 30)),
      ],
    ),
  );

  Widget field = Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Column(children: [
        new TextFormField(
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.email_outlined),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //inside padding
            labelText: "Enter Email address",
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
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 15)),
        new Builder(builder: (BuildContext context) {
          return SizedBox(
              width: 200.0,
              height: 40.0,
              child: OutlinedButton(
                child: Text("Request reset password"),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                onPressed: () {},
              ));
        })
      ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20), //padding
          child: Column(
            children: [arrowBack, titleSection, field],
          ),
        ),
      ),
    );
  }
}
