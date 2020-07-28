import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:  _buildBady(),
    );
  }

  Widget _buildAppBar() {
  return AppBar(
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.exit_to_app),
        onPressed: (){
      FirebaseAuth.instance.signOut();
      _googleSignIn.signOut();
        },
      )
    ],
  );
  }

  Widget _buildBady() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                  width: 75.0,
                  height: 75.0,
                    child:  CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                Container(
                  width: 75.0,
                  height: 75.0,
                  alignment: Alignment.bottomRight,
                  child:Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                    SizedBox(
                      width: 26.5,
                      height: 26.5,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.lightBlue,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                  )
                )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              Text(widget.user.displayName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
            ],
          ),
          Text('0\n게시물',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
          Text('0\n팔로워',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
          Text('0\n팔로잉',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
