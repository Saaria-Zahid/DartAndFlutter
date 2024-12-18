import 'package:counter_app/counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CounterProvider(), child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home()
    );
  }
}


// This Method Will Reload Complete Class

// class Home extends StatelessWidget {

//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print("Builder Called!!");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Counter Using Provider"),
//       ),
//       body: Center(child: 
//       Text('${Provider.of<CounterProvider>(context,).getData()}')
//       ,),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Provider.of<CounterProvider>(context, listen: false).Increment();
//       }, child: Icon(Icons.add),),
//     );
//   }
// }


// This Method Only Update Data
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print("Builder Called!!");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Counter Using Provider"),
//       ),
//       body: Center(child: 
//       Consumer<CounterProvider>(builder:(ctx, _, __){
//         print("Counter Called!!");
//         return Text('${Provider.of<CounterProvider>(ctx,).getData()}');

//       }, )
//       ,),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Provider.of<CounterProvider>(context, listen: false).Increment();
//       }, child: Icon(Icons.add),),
//     );
//   }
// }


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("Builder Called!!");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Using Provider"),
      ),
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Consumer<CounterProvider>(builder:(ctx, _, __){
            print("Counter Called!!");
            return Text('${ctx.watch<CounterProvider>().getData()}');
          
          }, ),
          ElevatedButton(onPressed: (){
            context.read<CounterProvider>().Restart();
          }, child: Text("Restart"))
        ],
      )
      ,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CounterProvider>().Increment();
      }, child: Icon(Icons.add),),
    );
  }
}