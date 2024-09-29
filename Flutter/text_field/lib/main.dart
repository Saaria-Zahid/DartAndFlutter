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
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
              padding: const EdgeInsets.all(10),
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
                          prefixIcon: const Icon(Icons.account_circle),
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
                          label: const Text('Name'),
                          hintFadeDuration: const Duration(seconds: 1),
                          hintText: "Saaria")),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      keyboardType: TextInputType.number,
                      controller: phone,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
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
                          label: const Text('Phone Number'),
                          hintFadeDuration: const Duration(seconds: 1),
                          hintText: "03...")),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffix: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade400),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Password'),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // String name = username.text.toString();
                          // String pass = password.text;
                          // String pnum = phone.text;
                          // print('My Name is $name');
                          // print('My Password is $pass');
                          // print('My Phone Number is $pnum');
                          // username.text = "";
                          // password.text = "";
                          // phone.text = "";

                          // final List<Map<String, String>> userinfo = [
                          //   {
                          //     "name": '${username.text}',
                          //     "password": '${password.text}',
                          //     "phone": '${phone.text}',
                          //   }
                          // ];

                          UserInfo userinfo = UserInfo(
                            name: username.text,
                            password: password.text,
                            phone: phone.text,
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home(userinfo: userinfo)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                        ),
                        child: const Text(
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

class Home extends StatefulWidget {
  final UserInfo userinfo;

  Home({Key? key, required this.userinfo}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Username: ${widget.userinfo.name}'),
    );
  }
}

class UserInfo{
  final String name;
  final String password;
  final String phone;


UserInfo({
  required this.name,
  required this.password,
  required this.phone,
});
}