# horizontal_int_picker

A new Flutter package which is used to select integers horizontally. 

#Screenshots

<img src="ss1.jpg" width="300em" /> <img src="sgif.gif" width="300em" />

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

### 🔩 Installation

Add to your [pubspec.yaml](https://github.com/shashankgupta3891/horizontal_int_picker/pubspec.yaml) :

```yaml
dependencies:
  horizontal_int_picker: <last_version>
```

### Usage 

[Example](https://github.com/shashankgupta3891/horizontal_int_picker/example)

### How to use

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:horizontal_int_picker/horizontal_int_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Horizontal Int Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedWeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.arrow_downward,
              size: 30,
              color: Colors.indigo,
            ),
        /// You can add this widget as a normal widget.
            HorizontalIntPicker(
              minValue: 60,
              maxValue: 120,
              initial: 90,
              selectedColor: Colors.blue,
              unitName: 'KG',
              itemSize: 90,
              onSelectedItemChanged: (val) {
                setState(() {
                  _selectedWeight = val;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Text(
          _selectedWeight.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

```

