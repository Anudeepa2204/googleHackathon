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
    "miles": "1.0 miles",
    "photo": "assets/images/rakhee.jpeg",
    "time": "09/30/2018 6PM - 9PM"
  },
  {
    "name": "Anudeepa Dinesh",
    "store": "Target",
    "miles": "1.9 miles",
    "photo": "assets/images/anudeepa.jpeg",
    "time": "09/29/2018 2PM - 5PM"
  },
  {
    "name": "Radhika Srinivasan",
    "store": "Target",
    "miles": "2.5 miles",
    "photo": "assets/images/radhika.jpeg",
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
          itemBuilder: (BuildContext context, int index) {
            return new UserList(
              name: userdetails[index]["name"],
              store: userdetails[index]["store"],
              miles: userdetails[index]["miles"],
              time: userdetails[index]["time"],
              photo: userdetails[index]["photo"],
            );
          },
          itemCount: userdetails.length,
        ));
  }
}

void _pressed() {
  print("Pressed");
}

class UserList extends StatelessWidget {
  final String name;
  final String store;
  final String time;
  final String photo;
  final String miles;

  const UserList(
      {Key key,
      String this.name,
      String this.store,
      String this.time,
      String this.photo,
      String this.miles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: InkWell(
          splashColor: Colors.lightGreen,
          onTap: _pressed,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                              child: Text(name,
                                  style: TextStyle(
//                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(store,
                                    style: TextStyle(
                                        fontSize: 15.0,
//                                        color: Colors.white,
                                        fontStyle: FontStyle.normal)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(miles,
                                    style: TextStyle(
//                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(time,
                                    style: TextStyle(
//                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
//                      image: DecorationImage(image:null ))
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photo),
//                      child: Image(
//                        image: AssetImage(photo),
//                        height: 60.0,
//                        width: 60.0,
//                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
