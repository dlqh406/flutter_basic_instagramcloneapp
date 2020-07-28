import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final FirebaseUser user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Clone",
          style:TextStyle(color: Colors.black,
             fontWeight: FontWeight.bold),),
      ),
      body:_buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("인스타에 오신걸 환영합니다", style: TextStyle(fontSize: 24.0)),
              Padding(padding: EdgeInsets.all(8.0)),
              Text("사진과 동영상을 보려면 팔로우 하세요"),
              Padding(padding: EdgeInsets.all(16.0)),
              SizedBox(
                width: 260.0,
                child: Card(
                  elevation: 4.0 ,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10.0)),
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.photoUrl),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(user.displayName),
                      Padding(padding: EdgeInsets.all(8.0)),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3', fit: BoxFit.cover)
                        ),
                            Padding(padding: EdgeInsets.all(2.0)),
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3',fit: BoxFit.cover)
                            ),
                            Padding(padding: EdgeInsets.all(2.0)),
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3',fit: BoxFit.cover)
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text('FaceBook 친구'),
                      Padding(padding: EdgeInsets.all(8.0)),
                      RaisedButton(
                        child: Text('follow'),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        onPressed: (){},
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),),
    );
  }
}
