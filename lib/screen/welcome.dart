import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ยินดีต้อนรับ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth.currentUser!.email as String),
            ElevatedButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                });
              },
              child: Text("ออกจากระบบ"),
            )
          ],
        ),
      ),
    );
  }
}
