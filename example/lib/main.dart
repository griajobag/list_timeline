import 'package:example/data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_timeline/custom_list_tracking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  
  String _dateFormat(DateTime date){
    return DateFormat("dd/MM/yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Timeline Usage"),
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: CustomListTracking<DataModel>(
            listItem: listExample,
            valueTextOfTitle: (e) => e.title!,
            valueTextOfDesc: (e) => e.desc!,
            colorCircleTimeline:(e)=> e.title=="Warning"?Colors.yellow: e.title=="Rejected"?Colors.red:Colors.blue   ,
            showLeftWidget: true,
            customLeftWidget: (e)=>Column(
              children: [
                Text(_dateFormat(e.dateTime!)),
                Text(e.title!)
              ],
            ),
            valueOfLeftSource: (e) => _dateFormat(e.dateTime!),
          )),
    );
  }
}
