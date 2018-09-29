import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:deliver_grocery/sliders/transitions.dart';
import 'package:deliver_grocery/views/homepage.dart';// Add import for validate package.

class Buyer extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<Buyer> {


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
        title: new Text('Receiver Items' ),

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child:
          new Column(
            children: <Widget>[

              new Row(
                children:<Widget>[


                  new Text(
                    ' Name:            PETER JONES \n Address:         1000 Riverwood Dr, Mountain View \n Availability:       Wed 1 pm - 10 pm\n Distance:         0.5 mi \n' ,

                    //textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold ),

        )

                  //new Checkbox(value: _isChecked, onChanged:(bool value){onChanged(value);}),
                ],

              ),

              new CheckboxListTile(
                  title: new Text('Rice, 5lb'),
                  value:_isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home),
                  onChanged: (bool value){onChanged(value);}),
              new CheckboxListTile(
                  title: new Text('Bread,   2 pkts'),
                  value:_isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home),
                  onChanged: (bool value){onChanged(value);}),
              new CheckboxListTile(
                  title: new Text('Sugar,   2lb'),
                  value:_isChecked,
                  activeColor: Colors.green,
                  secondary: const Icon(Icons.home),
                  onChanged: (bool value){onChanged(value);}),
              new CheckboxListTile(
                  title: new Text('Salt,   1 lb'),
                  value:_isChecked,
                  activeColor: Colors.green,

                  secondary: const Icon(Icons.home),
                  onChanged: (bool value){onChanged(value);}),

              new IconButton(
                  icon:new Icon(Icons.add_a_photo),
                  onPressed: null
              ),

              //new Image.asset("assets/camera.png", width:40.0, height:40.0),
              new Text('Click Receipt \n'),

              new RaisedButton(
                child:new Text("Submit"),
                color:Colors.blue,
                onPressed:onPressed

              ),
              new Text(displayString, style: new TextStyle(fontWeight: FontWeight.bold ),),




            ],
          ),
        ),
      ),

    );

  }
}
