import 'package:flutter/material.dart';
import 'package:flutter_basic_instacloneapp/login_page.dart';
import 'package:flutter_basic_instacloneapp/tab_page.dart';


//root: 뿌려주는 페이지니깐 stateless로
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

