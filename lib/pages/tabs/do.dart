import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/pages/tabs/addtaskpage.dart';

import '../../storage/addtodo.dart';
import '../../widget/card.dart';

class DoPage extends StatefulWidget {
  const DoPage({super.key});

  @override
  State<DoPage> createState() => _DoPageState();
}

class _DoPageState extends State<DoPage> {
  final todo=Get.put(AddTodo());
  final  todoDase=Hive.box('addTodo');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor:Colors.white,
        title:Text('Do',),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.blue,
        foregroundColor:Colors.white,
          onPressed:(){
          Get.to(()=>AddTaskPage());
          },
        child:const Icon(Icons.add),),
      body: Obx(()=>todo.todoDo.length<=0?Center(child: Lottie.asset('assets/nodata.json')): ListView.builder(
          itemCount:todo.todoDo.length,
          shrinkWrap:true,
          itemBuilder:(context,index){
            return card(todo.todoDo[index]['name']!, todo.todoDo[index]['task']!,index,()=>todo.deleteTodo(index,'do'),'do');
          }
      ))
        
    );
  }
}
