import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:deliver_grocery/sliders/transitions.dart';
import 'package:deliver_grocery/views/homepage.dart'; // Add import for validate package.

class Login extends StatefulWidget {
  @override
  State createState() => new LoginState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class LoginState extends State<Login> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  void _pressed() {
    print("Pressed");
  }

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
//      Validate.isEmail(value);
    } catch (e) {
      return 'Invalid Email';
    }
    if (value.toString() != "admin") {
      return 'Invalid Email';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.toString() != "Admin") {
      return 'Invalid Password';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
      Navigator.push(
        context,
        SlideRightRoute(widget: Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlue,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[welcome(), loginForm(), membershipPassword()],
          ),
        ));
  }

  Widget welcome() {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              child: Image.asset('assets/logo.png'),
            )),
        Text(
          "BasketDrop",
          style: TextStyle(fontSize: 30.0),
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              "Welcome to BasketDrop",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  Widget loginForm() {
    return Column(
      children: <Widget>[
        Form(
            key: this._formKey,
            child: new Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: TextFormField(
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Please enter email',
                        hintText: "you@example.com"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Please enter password'),
                  ))
            ])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: RawMaterialButton(
            onPressed: this.submit,
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
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
