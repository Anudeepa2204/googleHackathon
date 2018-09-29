import 'package:flutter/material.dart';

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
    return new Scaffold(
        appBar: new AppBar(
          title: Text(
            'Enter Grocery Item',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
        ),
        body: new SafeArea(
          child: new Column(children: [
            new Expanded(
                flex: 3,
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
              flex: 5,
              child: new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          onPressed: () {
            listitems.add(nameCtrl.text);
            nameCtrl.clear();
            setState(() {});
            listqtys.add(qtyCtrl.text);
            qtyCtrl.clear();
            setState(() {});
          },
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
}
