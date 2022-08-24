# list_timeline

Plugin to create a simple tracking widget for iOS and Android, Windows, and Web
<br><br>
<img src="https://raw.githubusercontent.com/griajobag/list_timeline/main/timeline.png"/> 

## Usage

To use this plugin, add ```list_timeline``` as
a [dependency in your pubspec.yaml](https://flutter.io/platform-plugins/).

### Example

```dart
import 'package:example/data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_timeline/custom_list_tracking.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Timeline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataModel> listExample = [];

  @override
  void initState() {
    listExample.add(DataModel(
        title: "Approved",
        desc: "This task was approved by your manager",
        dateTime: DateTime(2022, 08, 10)));

    listExample.add(DataModel(
        title: "Warning",
        desc: "This task was got yellow notice by your manager",
        dateTime: DateTime(2022, 08, 12)));

    listExample.add(DataModel(
        title: "Rejected",
        desc: "This task was rejected by your manager",
        dateTime: DateTime(2022, 08, 23)));
    super.initState();
  }

  String _dateFormat(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Timeline Usage"),
      ),
      //This below codes are the simple example how to use the package
      // if you wanna custom widget, just find the following attribute :
      // 1. customLeftWidget: (e)=>Container(),
      // 2. customTitleWidget: (e) => Container(),
      // 3. customDescWidget: (e) => Container(),
      
      body: Container(
          margin: const EdgeInsets.all(10),
          child: CustomListTracking<DataModel>(
            listItem: listExample,
            valueTextOfTitle: (e) => e.title!,
            valueTextOfDesc: (e) => e.desc!,
            colorCircleTimeline: (e) =>
            e.title == "Warning" ? Colors.yellow : e.title == "Rejected"
                ? Colors.red
                : Colors.blue,
            showLeftWidget: true,
            valueOfLeftSource: (e) => _dateFormat(e.dateTime!),
          )),
    );
  }
}
```