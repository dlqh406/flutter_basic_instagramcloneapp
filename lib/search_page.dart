import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_instacloneapp/create_page.dart';


class SearchPage extends StatefulWidget {
  final FirebaseUser user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBady(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
      },
        child: Icon(Icons.create),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

 Widget _buildBady() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,

        ),  itemCount: 5, itemBuilder: (context, index){
          return _bulidListItem(context,index);
    });
 }

  Widget _bulidListItem(BuildContext context, int index) {
    return Image.network('https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3',
        fit : BoxFit.cover);
  }
}
