import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  var names = ['Saaria', 'Sudaes', 'Ali', 'Huzaifa'];
  var mycolors = [Colors.amber, Colors.blue, Colors.red, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
         return ListTile(
              leading: CircleAvatar(
                
                backgroundColor: mycolors[index],
                radius: 100,
                child: Text(index.toString()),
              ),
              title: Text(names[index]),
              subtitle: Text('Sub Title'),
              trailing: Icon(Icons.edit),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 100,
              thickness: 2,
            );
          },
          itemCount: names.length),
    );
  }
}
