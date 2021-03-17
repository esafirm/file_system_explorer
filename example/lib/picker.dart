import 'package:file_system_explorer/file_system_explorer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Color(0xff3c3f41),
          accentColor: Color(0xff0d293e),
          iconTheme: IconThemeData(
            color: Color(0xffbbbbbb),
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Color(0xffbbbbbb)),
          )),
      home: new PickerPage(),
    );
  }
}

class PickerPage extends StatefulWidget {
  PickerPage({Key key}) : super(key: key);

  @override
  _PickerPageState createState() => new _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(path ?? "-"),
            ElevatedButton(
              onPressed: () async {
                path = await showPicker(context,
                    topInfo: Text("Choose a file to show"), searchFor: FlutterFileType.Folder);
                setState(() {});
              },
              child: Text("Select a file"),
            ),
          ],
        ),
      ),
    );
  }
}
