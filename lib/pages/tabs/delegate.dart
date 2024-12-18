import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/storage/addtodo.dart';

import '../../widget/card.dart';
import 'addtaskpage.dart';

class DelegatePage extends StatefulWidget {
  const DelegatePage({super.key});

  @override
  State<DelegatePage> createState() => _DelegatePageState();
}

class _DelegatePageState extends State<DelegatePage> {
  final todo=Get.put(AddTodo());
  final  todoDase=Hive.box('addTodo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        appBar:AppBar(
          backgroundColor:Colors.white,
          title:Text('Delegate',),
        ),
        floatingActionButton:FloatingActionButton(
          backgroundColor:Colors.blue,
          foregroundColor:Colors.white,
          onPressed:(){

            Get.to(
                    ()=>AddTaskPage(),
                arguments:{
                  'id':'dele'
                }
            );
          },
          child:const Icon(Icons.add),),
        body: Obx(()=> todo.todoDele.length<=0?Center(child: Lottie.asset('assets/nodata.json')):ListView.builder(
            itemCount:todo.todoDele.length,
            shrinkWrap:true,
            itemBuilder:(context,index){
              return card(todo.todoDele[index]['name']!, todo.todoDele[index]['task']!,index,()=>todo.deleteTodo(index,'dele'),'dele');
            }
        ))

    );
  }
}
