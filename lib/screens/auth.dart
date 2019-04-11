import 'package:flutter/material.dart';
import 'package:ict_staff_info_demo/services/user_service.dart';

class Authentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AuthenState();
  }
}

class AuthenState extends State<Authentication> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var displayResult = "";
  @override
  Widget build(BuildContext context) {
    Color maincolor = HexColor("#146C6D");
    Color accentcolor = HexColor("#439292");
    Color bgcolor = HexColor("#E8F1F2");

    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
//                  border: new Border.all(
//                      color: Colors.white,
//                      width: 1.0,
//                      style: BorderStyle.solid),
//                  color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("images/site-logo-ict.png"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: usernameController,
                        style: TextStyle(fontSize: 14, height: 1.2),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Username", border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Password", border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                        color: accentcolor,
                        onPressed: () {
                          setState(() {
                            if(_formKey.currentState.validate()){
                              this.displayResult = postToLogin();
                            }
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the user has typed in using our
                                  // TextEditingController
                                  content: Text(postToLogin()),
                                );
                              },
                            );
                          });
                        },
                        child: Text('LOGIN'),
                        textColor: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                ),
            ),
          ],
        ),
      ),
    );

  }
  String postToLogin() {
    String Username = usernameController.text;
    String Password = passwordController.text;
    return "User:"+Username+"\nPassword:"+Password;
  }
}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
