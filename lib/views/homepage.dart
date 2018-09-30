import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:deliver_grocery/views/buyerpage.dart';
import 'package:deliver_grocery/sliders/transitions.dart';
import 'package:deliver_grocery/views/receiver.dart';
import 'package:deliver_grocery/views/login.dart';

class Home extends StatefulWidget {
  @override
  HomeWidget createState() => HomeWidget();
}

List userdetails = [
  {
    "index": "0",
    "name": "Rakhee Singh",
    "store": "Walmart",
    "miles": "1.0 miles",
    "photo": "assets/images/rakhee.jpeg",
    "time": "09/30/2018 6PM - 9PM",
    "address": "754 The Alameda"
  },
  {
    "index": "1",
    "name": "Anudeepa Dinesh",
    "store": "Target",
    "miles": "1.9 miles",
    "photo": "assets/images/anudeepa.jpeg",
    "time": "09/29/2018 2PM - 5PM",
    "address": "20 Descanso Drive, San Jose"
  },
  {
    "index": "2",
    "name": "Radhika Srinivasan",
    "store": "Target",
    "miles": "2.5 miles",
    "photo": "assets/images/radhika.jpeg",
    "time": "09/30/2018 10AM - 1PM",
    "address": "1000 Riverwood Dr, Mountain View"
  }
];

class HomeWidget extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Basket Drop', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/user.jpg'),
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'admin@gmail.com',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.lightBlue,
                        icon: Icon(
                          Icons.settings,
                          size: 30.0,
                        ),
                        onPressed: _pressed,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.lightBlue,
                        icon: Icon(
                          Icons.swap_horiz,
                          size: 30.0,
                        ),
                        onPressed: () => swap_mode(context),
                      ),
                      Text(
                        "Switch Mode",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.lightBlue,
                        icon: Icon(
                          Icons.history,
                          size: 30.0,
                        ),
                        onPressed: _pressed,
                      ),
                      Text(
                        "History",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        splashColor: Colors.lightBlue,
                        icon: Icon(
                          Icons.exit_to_app,
                          size: 30.0,
                        ),
                        onPressed: () =>  _logout(context),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            return new UserList(
              index: userdetails[index]["index"],
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

void swap_mode(BuildContext ctx) {
  Navigator.push(ctx, SlideRightRoute(widget: Receiver()));
}

void _logout(BuildContext context){
  Navigator.push(context,
      SlideLeft(widget: Login()));
}


void _pressed() {
  print("pressed");
}

void select_user(String index, BuildContext context) {
  print(userdetails[int.parse(index)]);
//  userdetails
  Navigator.push(context,
      SlideRightRoute(widget: Buyer(user: userdetails[int.parse(index)])));
}

class UserList extends StatelessWidget {
  final String name;
  final String index;
  final String store;
  final String time;
  final String photo;
  final String miles;

  const UserList(
      {Key key,
      String this.index,
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
          splashColor: Colors.lightBlue,
          onTap: () => select_user(this.index, context),
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
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: Text(name,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(store,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(miles,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(time,
                                    style: TextStyle(
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
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photo),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
