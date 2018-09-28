import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  //{@required this.onPressed}
//  final GestureTapCallback onPressed;
  final loginController = new TextEditingController();
  void _pressed() {
    print("Pressed");
  }

  void _loginValidation(String value) {
    print("Login pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[welcome(), loginForm(), membershipPassword()],
      ),
    );
  }

  Widget loginForm() {
    return new Column(
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: TextFormField(
              controller: loginController,
              validator: (String arg) {
                if (arg.length < 3) {
                  return 'Username must be more than 2 charater';
                } else
                  return null;
              },
              decoration: InputDecoration(hintText: 'Please enter username'),
            )),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: TextField(
              controller: loginController,
              decoration: InputDecoration(hintText: 'Please enter password'),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
      ],
    );
  }

  Widget welcome() {
    return new Column(
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
      ],
    );
  }

  Widget membershipPassword() {
    return new Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            child: new FlatButton(
              splashColor: Colors.grey,
              onPressed: _pressed,
              child: new Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.white),
              ),
            )),
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
    );
  }
}
