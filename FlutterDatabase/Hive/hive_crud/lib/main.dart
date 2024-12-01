import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("HiveCRUD");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? dateNow = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController descController   = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController= TextEditingController();

  DateTime? selectedDate = DateTime.now();
  var dateListDot;

  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "4:37 PM";

  Future<void> _getDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: dateNow!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickDate != null) {
      setState(() {
        dateNow = pickDate;
        // Format and update the text field with the selected date
        dateController.text = DateFormat('yyyy-MM-dd').format(dateNow!);
      });
    } else {
      print("Something went wrong");
    }
  }

  Future<void> _getTime(isStartTime) async {
    TimeOfDay? timepicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (timepicker != null) {
      final now = DateTime.now();
      final DateTime formattedTime = DateTime(
          now.year, now.month, now.day, timepicker.hour, timepicker.minute);
      if (isStartTime == true) {
        setState(() {
          startTime = DateFormat("hh:mm a").format(formattedTime);
          timeController.text = startTime;
          print(startTime);
        });
      } else if (isStartTime == false) {
        setState(() {
          endTime = DateFormat("hh:mm a").format(formattedTime);
          endTimeController.text = endTime;

          print(endTime);
        });
      }
    } else {
      print("Something went wrong");
    }
  }

  List showall = [];

// create data

  var HiveCRUD = Hive.box("HiveCRUD");

  createData(Map<String, dynamic> row) async {
    await HiveCRUD.add(row);
    readAll();
  }

  updateData(int? key, Map<String, dynamic> row) async {
    await HiveCRUD.put(key, row);

    readAll();
  }

  readAll() async {
    var data = HiveCRUD.keys.map(
      (e) {
        final items = HiveCRUD.get(e);
        return {"key": e, "title": items["title"], "desc": items["desc"],"name": items["name"], "email":items["email"],"date":items["date"], "dbtime_start": items["dbtime_start"],"dbtime_end": items["dbtime_end"]};
      },
    ).toList();

    setState(() {
      showall = data.reversed.toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomBottm(0);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: showall.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(children: [
              Text(showall[index]["title"].toString()),
              Text(showall[index]["email"].toString()),
              Text(showall[index]["name"].toString()),
            ],),
            subtitle: Column(children: [
              Text(showall[index]["desc"].toString()),
              Text(showall[index]["date"].toString()),
              Text(showall[index]["dbtime_start"].toString()),
              Text(showall[index]["dbtime_end"].toString()),
            ],),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      var updatevalue = showall[index]["key"];
                      CustomBottm(updatevalue);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      var deleteValue = showall[index]["key"];
                      HiveCRUD.delete(deleteValue);
                      readAll();
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
      
    );
  }


 Future CustomBottm(id) {
    double mediaHeigth = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
        isScrollControlled: true,
        scrollControlDisabledMaxHeightRatio: mediaHeigth,
        context: context,
        sheetAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        constraints: BoxConstraints(
          minHeight: mediaHeigth * 0.75,
        ),
        anchorPoint: const Offset(1, 1),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                20, 20, 20, MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: [
                  CustomTextField(
                    labelName: "Name",
                    hintText: "john ballach",
                    controller: nameController,
                    isClickAble: true,
                  ),
                  CustomTextField(
                    labelName: "Email",
                    hintText: "email@email.com",
                    controller: emailController,
                    isClickAble: true,
                  ),
                  CustomTextField(
                    labelName: "hello",
                    hintText: "lorem ipsum",
                    controller: descController,
                    isClickAble: true,
                  ),
                  CustomTextField(
                    labelName: "Task",
                    hintText: "Task ToDo",
                    controller: taskController,
                    isClickAble: true,
                  ),
                  CustomTextField(
                    labelName: "Date",
                    hintText: "Select Date",
                    isClickAble: false,
                    controller: dateController,
                    iconData: IconButton(
                        onPressed: () {
                          _getDate();
                        },
                        icon: const Icon(Icons.date_range)),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        labelName: "Start Time",
                        isClickAble: false,
                        hintText: startTime,
                        controller: timeController,
                        iconData: IconButton(
                            onPressed: () {
                              _getTime(true);
                            },
                            icon: const Icon(Icons.watch_later_outlined)),
                      )),
                      Expanded(
                          child: CustomTextField(
                        labelName: "End Time",
                        isClickAble: false,
                        hintText: endTime,
                        controller: endTimeController,
                        iconData: IconButton(
                            onPressed: () {
                              _getTime(false);
                            },
                            icon: const Icon(Icons.watch_later_outlined)),
                      )),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          var dbName = nameController.text.toString();
                          var dbEmail = emailController.text.toString();
                          var dbTitle = taskController.text.toString();
                          var dbDesc = descController.text.toString();
                          var dbDate_picked = dateController.text.toString();
                          var dbTime_start = timeController.text.toString();
                          var dbTime_end = endTimeController.text.toString();
                         
                         var data = {"title": dbTitle, "desc": dbDesc, "name": dbName, "email": dbEmail, "date":dbDate_picked, "dbtime_start": dbTime_start, "dbtime_end": dbTime_end};
                    if (id == 0) {
                      createData(data);
                    } else {
                      // update

                      updateData(id, data);
                    }

                          taskController.clear();
                          dateController.clear();
                          timeController.clear();
                          endTimeController.clear();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8.0),
                        ),
                        child: id == 0
                            ? Text(
                                'Add Task',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : Text(
                                'Update Task',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconButton? iconData;
  final TextEditingController? controller;
  final String labelName;
  final bool isClickAble;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.iconData,
    required this.isClickAble,
    required this.labelName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelName,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          TextField(
            controller: controller,
            canRequestFocus: isClickAble,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: iconData, // Show the icon if provided, otherwise null
            ),
          ),
        ],
      ),
    );
  }
}
