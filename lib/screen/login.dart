import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:register_login/model/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          /* --------------------------------ถ้าเชื่อม firebase ไม่สำเร็จ------------------------------------------ */
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }

          /* --------------------------------ถ้าเชื่อม firebase สำเร็จ------------------------------------------ */
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("เข้าสู่ระบบ"),
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
                            methodEmail(),
                            SizedBox(
                              height: 20,
                            ),
                            methodpassword(),
                            SizedBox(
                              width: double.infinity,
                              child: methodSubmit(),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  ElevatedButton methodSubmit() {
    return ElevatedButton(
      child: Text('ลงชื่อเข้าใช้', style: TextStyle(fontSize: 20.0)),
      onPressed: () async {
        if (this._formKey.currentState!.validate()) {
          this._formKey.currentState!.save();
          Profile profile = Profile(email: _email.text, password: _password.text);
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: profile.email, password: profile.password)
                .then((value) {
              Fluttertoast.showToast(
                msg: "เข้าสู่ระบบ",
                gravity: ToastGravity.TOP,
              );
              this._formKey.currentState!.reset();
              Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
            });
          } on FirebaseAuthException catch (e) {
            Fluttertoast.showToast(
              msg: e.message.toString(),
              gravity: ToastGravity.CENTER,
            );
          }
        }
      },
    );
  }

  TextFormField methodEmail() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'อีเมล', hintText: 'abcd@mail.com', icon: Icon(Icons.email)),
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      validator: MultiValidator([
        RequiredValidator(errorText: 'กรุณากรอก อีเมล'),
        EmailValidator(errorText: 'รูปแบบอีเมลไม่ถูกต้อง'),
      ]),
    );
  }

  TextFormField methodpassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'รหัสผ่าน', icon: Icon(Icons.password)),
      obscureText: true,
      controller: _password,
      validator: RequiredValidator(errorText: "กรุณากรอก รหัสผ่าน"),
    );
  }
}
