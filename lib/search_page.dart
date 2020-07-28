import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_instacloneapp/create_page.dart';
import 'package:flutter_basic_instacloneapp/detail_post_page.dart';




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
  return StreamBuilder(
    stream: Firestore.instance.collection('post').snapshots(),
    builder: (BuildContext context, AsyncSnapshot snapshot){
      if(!snapshot.hasData){
        return Center(child:  CircularProgressIndicator());
      }
      var items =  snapshot.data?.documents ??[];
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {return _buildListItem(context, items[index]);
          });
      },
  );
 }

  Widget _buildListItem(context, document) {
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailPostPage(document);
          }));
        },
        child: Image.network(
          document['photoUrl'],
          fit : BoxFit.cover),
      );
  }
}
