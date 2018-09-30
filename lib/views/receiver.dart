import 'package:flutter/material.dart';
import 'package:deliver_grocery/sliders/transitions.dart';
import 'package:deliver_grocery/views/homepage.dart';
import 'package:deliver_grocery/views/login.dart';

class Receiver extends StatefulWidget {
  //{@required this.onPressed}
//  final GestureTapCallback onPressed;
  @override
  State createState() => new ReceiverList();
}

class ReceiverList extends State<Receiver> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  List<String> listitems = [];
  List<String> listqtys = [];
  List<String> listStores = <String>[
    '',
    'Costco',
    'Walmart',
    'Wholefoods',
    'Safeway',
    'Target',
    'Walgreens'
  ];
  String listStore = '';
  final TextEditingController nameCtrl = new TextEditingController();
  final TextEditingController qtyCtrl = new TextEditingController();
  //final myController = TextEditingController();
  List items = [{}];
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

  void swap_mode(BuildContext ctx) {
    Navigator.push(ctx, SlideRightRoute(widget: Home()));
  }

  void add_to_list(String item, String quantity) {
    items.add({item: quantity});
    print(items.length);
    print(items[0]);
    print(items[1]);
//    print(items[2]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            'Purchase Items',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
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
        body: new SafeArea(
          child: new Column(children: [
            new Expanded(
                flex: 2,
                child: new Container(
                  child: new Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 15.0,
                    ),
                    child: new Column(children: <Widget>[
                      new InputDecorator(
                        decoration: const InputDecoration(
                          //icon: const Icon(Icons.color_lens),
                          labelText: 'Store',
                        ),
                        isEmpty: listStore == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: listStore,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                listStore = newValue;
                              });
                            },
                            items: listStores.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new TextField(
                        decoration: InputDecoration(hintText: "Item Name"),
                        controller: nameCtrl,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Colors.black),
                        onSubmitted: (text) {
                          listitems.add(text);
                          nameCtrl.clear();
                          setState(() {});
                        },
                      ),
                      new TextField(
                        decoration: InputDecoration(hintText: "Quantity"),
                        controller: qtyCtrl,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Colors.black),
                        onSubmitted: (text) {
                          listqtys.add(text);
                          qtyCtrl.clear();
                          setState(() {});
                        },
                      ),
                    ]),
                  ),
                )),
            new Expanded(
              flex: 2,
              child: new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        new Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        )
                      ])),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog with the
          // text the user has typed into our text field.
          onPressed: () => add_to_list(nameCtrl.text, qtyCtrl.text),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Text(
              "+",
              style: TextStyle(
                  color: Colors.black, fontSize: 30.0, fontFamily: 'Arial'),
            ),
          ),
        ));
  }
  void _logout(BuildContext context){
    Navigator.push(context,
        SlideLeft(widget: Login()));
  }

}
