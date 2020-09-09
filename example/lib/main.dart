import 'package:flutter/material.dart';
import 'package:flutter_visualizers_example/Ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'permissions_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(' Example'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              splashColor: Colors.pinkAccent,
              color: Colors.black,
              child: new Text(
                "Play Song",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed:() async{
                var value = await PermissionsService().hasMicPermission();
                value? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaySong()),
                ):PermissionsService().requestMicPermission();

              },
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
          ],
        ),
      ) ,
    );
  }
}
