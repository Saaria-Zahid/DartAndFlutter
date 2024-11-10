import 'package:flutter/material.dart';
import 'package:sqflite_project_01/services/db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRec()));
                },
                child: Text("Create"),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[900]),
              )),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReadRec()));

                },
                child: Text("Read"),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[900]),
              )),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Update"),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[900]),
              )),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Delete"),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[900]),
              )),
        ],
      ),
    );
  }
}


class CreateRec extends StatefulWidget {
  const CreateRec({super.key});

  @override
  State<CreateRec> createState() => _CreateRecState();
}

class _CreateRecState extends State<CreateRec> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
          ),
          ElevatedButton(onPressed: ()async{
           String name = nameController.text.toString();
           await DBhelper.instance.insertRecord({DBhelper.ColumnName: name});
           setState(() {
           });
           Navigator.of(context).pop();
          }, child: Text("Submit"))
        ],
      )
      ,
    );
  }
}


class ReadRec extends StatefulWidget {
  const ReadRec({super.key});

  @override
  State<ReadRec> createState() => _ReadRecState();
}

class _ReadRecState extends State<ReadRec> {
  List<Map<String, dynamic>> dataList = [];

  void getData() async{
    var data = await DBhelper.instance.queryDatabase();
    setState(() {
      dataList = data;
    });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    
      ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index){
        return ListTile(
          title: Text(dataList[index]["name"]),
        );
      })
  
    ,);
  }
}