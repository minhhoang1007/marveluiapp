import 'package:flutter/material.dart';
import 'package:marvel_uiapp/ui/home.dart';

class TwoScreen extends StatefulWidget {
  TwoScreen({Key key}) : super(key: key);

  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text("Two Screen"),
        actions: <Widget>[],
      ),
      body: Center(
        child: Text("Two Screen"),
      ),
    );
  }
}
