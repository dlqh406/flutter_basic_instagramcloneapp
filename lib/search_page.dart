import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBady(),
      floatingActionButton: FloatingActionButton(onPressed: null,
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
