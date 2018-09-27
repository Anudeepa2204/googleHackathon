import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  //{@required this.onPressed}
//  final GestureTapCallback onPressed;
  void _pressed() {
    print("Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70.0,
                child: Image.asset('assets/logo.png'),
//              )
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                "Welcome to Super Grocery",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
//              )
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Please enter username'),
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Please enter password'),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: RawMaterialButton(
              onPressed: _pressed,
              fillColor: Colors.yellow,
              splashColor: Colors.green,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'IndieFlower'),
                ),
              ),
              shape: StadiumBorder(),
            ),
          ),
          InkWell(
            splashColor: Colors.white,
            onTap: _pressed,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Colors.white),
                  ),
                  new Text(
                    "Not a Member? Sign up!",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'IndieFlower',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
