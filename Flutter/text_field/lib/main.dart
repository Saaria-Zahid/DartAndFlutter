import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                      keyboardType: TextInputType.name,
                      // obscureText: true,
                      // obscuringCharacter: "*",
                      controller: username,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          // suffix: IconButton(
                          //     onPressed: () {},
                          //     icon: Icon(Icons.remove_red_eye)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green.shade400),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: Text('Name'),
                          hintFadeDuration: Duration(seconds: 1),
                          hintText: "Saaria")),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      keyboardType: TextInputType.number,
                      controller: phone,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          // suffix: IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green.shade400),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: Text('Phone Number'),
                          hintFadeDuration: Duration(seconds: 1),
                          hintText: "03...")),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffix: IconButton(
                            onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade400),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text('Password'),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          String name = username.text.toString();
                          String pass = password.text;
                          String pnum = phone.text;
                          print('My Name is ${name}');
                          print('My Password is ${pass}');
                          print('My Phone Number is ${pnum}');
                          username.text = "";
                          password.text = "";
                          phone.text = "";
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
