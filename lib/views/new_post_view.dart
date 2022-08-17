import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dio_getx/services/dio_service.dart';

import '../controllers/home_controller.dart';

DioService dioService = DioService();

TextEditingController titleController = TextEditingController();
TextEditingController bodyController = TextEditingController();

final controller = Get.put(HomeController());

Widget getBody(){
  return ListView(
    padding: const EdgeInsets.all(30),
    children: [
      const SizedBox(height: 30,),
      TextField(
        controller: titleController,
        decoration: const InputDecoration(
            hintText: "title"
        ),
      ),
      const SizedBox(height: 30,),
      TextField(
        controller: bodyController,
        decoration: const InputDecoration(
            hintText: "body"
        ),
      ),
      const SizedBox(height: 40,),
      Container(
        height: 40,
        width: double.infinity,
        color: Colors.purpleAccent,
        child: ElevatedButton(
          onPressed: (){
            controller.createNewUser(titleController.text,bodyController.text);
          },
          child: const Center(child: Text("Done"),),
        ),
      )
    ],
  );
}