import 'package:flutter/material.dart';
// import 'package:register_login/screen/login.dart';
// import 'package:register_login/screen/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text('Register & Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('สร้างบัญชีผู้ใช้'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    )),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.login_rounded),
                      label: Text('เข้าสู่ระบบ'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
