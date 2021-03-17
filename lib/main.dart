import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheap Fast Good Projects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cheap Fast Good Projects'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _cheapSwitch = false;
  bool _fastSwitch = false;
  bool _goodSwitch = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var scaffold = Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
    return scaffold;
  }

  Widget buildBody() {
    return Transform.scale(
      scale: MediaQuery.of(context).size.height * 0.005,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cfgSwitch(
              _cheapSwitch,
              'CHEAP',
              Colors.blue,
              (value) {
                setState(() {
                  _cheapSwitch = value;
                  if (_goodSwitch && _fastSwitch) {
                    _goodSwitch = false;
                  }
                });
              },
            ),
            cfgSwitch(
              _fastSwitch,
              'FAST',
              Colors.red,
              (value) {
                setState(() {
                  _fastSwitch = value;
                  if (_cheapSwitch && _goodSwitch) {
                    _cheapSwitch = false;
                  }
                });
              },
            ),
            cfgSwitch(
              _goodSwitch,
              'GOOD',
              Colors.green,
              (value) {
                setState(() {
                  _goodSwitch = value;
                  if (_fastSwitch && _cheapSwitch) {
                    _fastSwitch = false;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Row cfgSwitch(
    bool value,
    String label,
    Color switchActiveColor,
    Function(bool) onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Spacer(),
              Switch(
                key: Key("Switch_$label"),
                activeColor: switchActiveColor,
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            label,
          ),
        ),
      ],
    );
  }
}
