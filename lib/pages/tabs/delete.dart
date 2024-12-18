import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../storage/addtodo.dart';
import '../../widget/card.dart';
import 'addtaskpage.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  final todo=Get.put(AddTodo());
  final  todoDase=Hive.box('addTodo');


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:Colors.white,
        appBar:AppBar(
          backgroundColor:Colors.white,
          title:Text('Delete',),
        ),
        floatingActionButton:FloatingActionButton(
          backgroundColor:Colors.blue,
          foregroundColor:Colors.white,
          onPressed:(){
            Get.to(()=>AddTaskPage(),
                arguments:{
                  'id':'del'
                }
            );
          },
          child:const Icon(Icons.add),),
        body: Obx(()=> todo.todoDel.length<=0?Center(child: Lottie.asset('assets/nodata.json')):ListView.builder(
            itemCount:todo.todoDel.length,
            shrinkWrap:true,
            itemBuilder:(context,index){
              return card(todo.todoDel[index]['name']!, todo.todoDel[index]['task']!,index,()=>todo.deleteTodo(index,'del'),'del');
            }
        ))

    );
  }
}
