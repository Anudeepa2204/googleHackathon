import 'package:flutter/material.dart';
import 'package:deliver_grocery/views/login.dart';


class Buyer extends StatefulWidget {
  var user = {};
  Buyer({Key key, @required this.user}) : super(key: key);

  @override
  MyAppState createState() => new MyAppState(user: user);
}

class MyAppState extends State<Buyer> {
  var user = {};
  MyAppState({@required this.user}) : super();
  bool _isChecked = false;
  String displayString = "";

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  void onPressed() {
    setState(() {
      displayString = "Receipt Submitted Successfully";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlue,
        title: new Text('Dropoff Items', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700)),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name:"),
                        Text("${user['name']}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Address:"),
                        Text("${user['address']}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Store:"),
                        Text("${user['store']}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Distance:"),
                        Text("${user['miles']}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Availability:"),
                        Text("${user['time']}")
                      ],
                    ),
                  ],
                ),
              ),

              CheckboxListTile(
                  title: new Text('Rice, 5lb'),
                  value: _isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home, size: 20.0,),
                  onChanged: (bool value) {
                    onChanged(value);
                  }),
              CheckboxListTile(
                  title: new Text('Bread,   2 pkts'),
                  value: _isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home, size: 20.0,),
                  onChanged: (bool value) {
                    onChanged(value);
                  }),
              CheckboxListTile(
                  title: new Text('Sugar,   2lb'),
                  value: _isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home, size: 20.0,),
                  onChanged: (bool value) {
                    onChanged(value);
                  }),
              CheckboxListTile(

                  title: new Text('Salt,   1 lb'),
                  value: _isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home, size: 20.0,),
                  onChanged: (bool value) {
                    onChanged(value);
                  }),

              IconButton(icon: new Icon(Icons.add_a_photo), onPressed: null),

              //new Image.asset("assets/camera.png", width:40.0, height:40.0),
              Text('Upload Receipt \n'),

              RaisedButton(
                  child: new Text("Submit"),
                  color: Colors.blue,
                  onPressed: onPressed),
              Text(
                displayString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
