import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  //{@required this.onPressed}
//  final GestureTapCallback onPressed;
  @override
  State createState() => new LoginState();
}

class LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final loginController = new TextEditingController();
  void _pressed() {
    print("Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration(seconds: 10),
      color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 20.0),
            child: Container(
              color: Colors.lightBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  welcome(),
                  loginForm(),
                  membershipPassword()
                ],
              ),
            )));
  }

  Widget welcome() {
    return Column(
//        duration: const Duration(seconds: 3),
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 70.0,
              child: Image.asset('assets/logo.png'),
            )),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Text(
              "Welcome to Super Grocery",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  Widget loginForm() {
    return new Column(
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: TextField(
              controller: loginController,
              decoration: InputDecoration(hintText: 'Please enter password'),
            )),
        Center(
          child: RawMaterialButton(
            onPressed: _pressed,
            fillColor: Colors.yellow,
            splashColor: Colors.green,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
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

  Widget membershipPassword() {
    return new Column(
      children: <Widget>[
        Center(
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
          child: Center(
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
