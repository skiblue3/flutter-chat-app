import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Start Chating'),
          actions: [
            DropdownButton(
              underline: Container(),
              items: [
                DropdownMenuItem(
                  child: Row(children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ]),
                  value: 'logout',
                )
              ],
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  _auth.signOut();
                }
              },
            )
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Text(
            "You have successfully logined",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
