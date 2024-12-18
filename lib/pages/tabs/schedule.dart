import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../storage/addtodo.dart';
import '../../widget/card.dart';
import 'addtaskpage.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final todo=Get.put(AddTodo());
  final  todoDase=Hive.box('addTodo');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        appBar:AppBar(
          backgroundColor:Colors.white,
          title:Text('Schedule',),
        ),
        floatingActionButton:FloatingActionButton(
          backgroundColor:Colors.blue,
          foregroundColor:Colors.white,
          onPressed:(){
            Get.to(()=>AddTaskPage(),
                arguments:{
                      'id':'sc'
                    }
            );
          },
          child:const Icon(Icons.add),),
        body: Obx(()=>todo.todoSch.length<=0?Center(child: Lottie.asset('assets/nodata.json')): ListView.builder(
            itemCount:todo.todoSch.length,
            shrinkWrap:true,
            itemBuilder:(context,index){
              return card(todo.todoSch[index]['name']!, todo.todoSch[index]['task']!,index,()=>todo.deleteTodo(index,'sc'),'sc');
            }
        ))

    );
  }
}
