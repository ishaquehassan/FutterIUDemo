import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        children: <Widget>[
          inputField(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                return Card(
                    color: Colors.blue,
                    elevation: 10,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              items[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                            InkWell(
                              child: Icon(Icons.delete, color: Colors.white),
                              onTap: () {
                                setState(() {
                                  items.removeAt(index);
                                });
                              },
                            )
                          ],
                        )),
                    margin: EdgeInsets.all(10));
              },
            ),
          )
        ],
      ),
    );
  }

  inputField() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your item name here...")),
            ),
            RaisedButton(
              child: Text("ADD"),
              onPressed: () {
                setState(() {
                  items.add(controller.text);
                });
                controller.clear();
              },
              color: Colors.blue,
              textColor: Colors.white,
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
