import 'package:flutter/material.dart';

class CreatPage extends StatefulWidget {
  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  final textEditingController = TextEditingController();
  // 객체 생
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }// textField에 필수적으로 들어가야함
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
      child: Icon(Icons.add_a_photo),
      backgroundColor: Colors.lightBlueAccent,
      ),);
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: (){},
        )
      ],
    );

  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(8.0)),
        Text('업로드할 사진을 선택해주세요'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEditingController,
        )
      ],
    );
  }
}
