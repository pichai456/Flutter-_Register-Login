import 'package:flutter/material.dart';
import 'package:register_login/model/profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  // final profile = Profile(email: 'email', password: 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างบัญชีผู้ใช้"),
      ),
      body: Container(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'อีเมล', hintText: 'abcd@mail.com'),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? email) {
                        // profile.email = email;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'รหัสผ่าน'),
                        obscureText: true,
                        onSaved: (String? password) {
                          // profile.password = password;
                        }),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('ลงทะเบียน', style: TextStyle(fontSize: 20.0)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
