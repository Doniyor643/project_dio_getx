import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/rename_user_viev.dart';



class RenameUser extends StatefulWidget {
  final String? title;
  final String? body;
  const RenameUser(this.title,this.body,{Key? key}) : super(key: key);

  @override
  State<RenameUser> createState() => _RenameUserState();
}

class _RenameUserState extends State<RenameUser> {

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rename User'),
        backgroundColor: Colors.pink,
      ),
      body: renameUser(widget.title,widget.body),
    );
  }
}