import 'package:flutter/material.dart';
import '../view/home.dart';
import '../controllers/controller.dart';
import '../models/model.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final ProductController productController = ProductController();

  // @override
  // void initState() {
  //   super.initState();
  //   getAdmin();
  // }

  // Future<void> getAdmin() async {
  //   var fetchedUsers = await productController.getAdmin();
  //   users = fetchedUsers;
  // }

  bool checkLogin() {
    if (username.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill completely!')));

      return false;
    }
    return true;
  }

  void login() async {
    if (checkLogin()) {
      if (await productController.login(username.text, password.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login successfully!')));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductListView()),
        );
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Incorrect username or password!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADMIN LOGIN',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: username,
              decoration: InputDecoration(
                  labelText: "Username:", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  labelText: "Password:", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.blue),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
