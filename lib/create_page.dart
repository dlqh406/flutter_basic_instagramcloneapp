import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatPage extends StatefulWidget {
  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  final textEditingController = TextEditingController();
  File _image;

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
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0)),
         _image == null ? Text('업로드할 사진을 선택해주세요') : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Future _getImage() async {
    File Image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = Image;
    });
  }
}
