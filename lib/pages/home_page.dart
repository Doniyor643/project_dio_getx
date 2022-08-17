import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dio_getx/controllers/home_controller.dart';
import 'package:project_dio_getx/views/home_view.dart';
import 'new_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 final controller = Get.put(HomeController());
  @override
  void initState() {
    controller.getResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX & Dio"),
        ),
        body: Obx(() => Stack(
          children: [
            controller.isLoading()
                ?
            const Center(
              child: CircularProgressIndicator(),
            )
                :
            ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context,index){
                  return viewOfBody(controller,controller.items[index]);
                })
          ],
        ),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateUser()));
          },
          child: const Icon(Icons.add),
        ));
  }
}