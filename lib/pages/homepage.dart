import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/pages/tabs/delegate.dart';
import 'package:todo/pages/tabs/delete.dart';
import 'package:todo/pages/tabs/do.dart';
import 'package:todo/pages/tabs/schedule.dart';

import '../storage/addtodo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoDatas=Get.put(AddTodo());

  @override
  void initState() {
    super.initState();
    // Load all the data before the UI builds
    todoDatas.getdata('do');
    todoDatas.getdata('sc');
    todoDatas.getdata('dele');
    todoDatas.getdata('del');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Obx(() => Text("Do : ${todoDatas.todoDo.length}")),
                  Obx(() => Text("Schedule : ${todoDatas.todoSch.length}")),
                  Obx(() => Text("Delegate : ${todoDatas.todoDele.length}")),
                  Obx(() => Text("Delete : ${todoDatas.todoDel.length}")),
                ],
              ),


              SizedBox(
               height:40,
             ),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceAround,
               children: [
                 Text('Urget',style:TextStyle(color:Colors.grey,fontWeight:FontWeight.bold),),
                 Text('Not Urget',style:TextStyle(color:Colors.grey,fontWeight:FontWeight.bold),),
               ],
             ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                RotatedBox(
                  quarterTurns:3,
                    child: Text("Important")),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap:(){
                        Get.to(()=>DoPage());
                      },
                      child: Container(

                        height:250,
                        decoration:BoxDecoration(
                            color:Colors.greenAccent,
                            borderRadius:BorderRadius.circular(20),
                        ),
                        child: Center(
                          child:Text('Do',style:GoogleFonts.patrickHand(textStyle:const TextStyle(color:Colors.white,fontSize:35,fontWeight:FontWeight.bold)),)

                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap:(){
                        Get.to(()=>SchedulePage());
                      },
                      child: Container(
                        height:250,
                        decoration:BoxDecoration(
                            color:Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(20),
                      
                        ),
                        child: Center(
                          child:Text('Schedule',style:GoogleFonts.patrickHand(textStyle:const TextStyle(color:Colors.white,fontSize:35,fontWeight:FontWeight.bold)),),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),


              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  RotatedBox(
                      quarterTurns:3,
                      child: Text("Not Important")),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap:(){
                          Get.to(()=>DelegatePage());
                        },
                        child: Container(
                          height:250,
                          decoration:BoxDecoration(
                              color:Colors.blueGrey,
                            borderRadius:BorderRadius.circular(20),
                        
                          ),
                          child:Center(
                            child:Text('Delegate',style:GoogleFonts.patrickHand(textStyle:const TextStyle(color:Colors.white,fontSize:35,fontWeight:FontWeight.bold)),),
                          ),
                        ),
                      ),


                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap:(){
                          Get.to(()=>Delete());
                        },
                        child: Container(
                          height:250,
                          decoration:BoxDecoration(
                              color:Colors.red,
                            borderRadius:BorderRadius.circular(20),
                        
                          ),
                          child: Center(
                            child:Text('Delete',style:GoogleFonts.patrickHand(textStyle:const TextStyle(color:Colors.white,fontSize:35,fontWeight:FontWeight.bold)),),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
      
    );
  }
}
