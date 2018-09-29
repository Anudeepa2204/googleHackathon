import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  HomeWidget createState() => HomeWidget();
}

List userdetails = [
  {
    "name": "Rakhee Singh",
    "store": "Walmart",
    "photo": "/assets/images/rakhee.jpeg",
    "time": "09/30/2018 6PM - 9PM"
  },
  {
    "name": "Anudeepa Dinesh",
    "store": "Target",
    "photo": "/assets/images/anudeepa.jpeg",
    "time": "09/29/2018 2PM - 5PM"
  },
  {
    "name": "Radhika Srinivasan",
    "store": "Target",
    "photo": "/assets/images/radhika.jpeg",
    "time": "09/30/2018 10AM - 1PM"
  }
];

class HomeWidget extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Deliver Grocery'),
          leading: IconButton(
            tooltip: 'Menu',
            icon: const Icon(Icons.menu),
            onPressed: null,
            splashColor: Colors.grey,
          ),
        ),
        body: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          itemExtent: 20.0,
          itemBuilder: (BuildContext context, int index) {
            return new UserList(
              name: userdetails[index]["name"],
              store: userdetails[index]["store"],
              time: userdetails[index]["time"],
              photo: userdetails[index]["photo"],
            );
          },
          itemCount: userdetails.length,
        ));
  }
}

class UserList extends StatelessWidget {
  final String name;
  final String store;
  final String time;
  final String photo;

  const UserList(
      {Key key,
      String this.name,
      String this.store,
      String this.time,
      String this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Container(
      padding: EdgeInsets.only(top: 20.0),
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Card(
                  child: new Column(children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.event_seat),

                  title: Text(name, style: TextStyle(color: Colors.black, fontSize: 10.0, ),),
                  subtitle: Text(store),
                ),
              ])))
        ],
      ),
    ));
  }
}
