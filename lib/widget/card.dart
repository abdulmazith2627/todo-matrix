

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/tabs/addtaskpage.dart';

Widget card(String title,String todo,index,Function delete,code){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width:double.infinity,

      decoration:BoxDecoration(
        color:Colors.white,
        border:Border.all(color:Colors.grey,width:1),
        borderRadius:BorderRadius.circular(10),
      ),
      
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:Colors.blue,
                    foregroundColor:Colors.white,
                    child:Text((index+1).toString()),),
                  SizedBox(width:10,),
                  Text(title==''?'Title':title,style:TextStyle(fontSize:20,color:Colors.black),),
                  Expanded(child:Container()),
                  PopupMenuButton(
                      itemBuilder:(context)=>[
                    PopupMenuItem(
                      child:Text("Delete",style:Theme.of(context).textTheme.labelSmall,),
                      onTap:(){
                        delete();
                      },
                    ),

                    PopupMenuItem(
                      child:Text("Update",style:Theme.of(context).textTheme.labelSmall,),
                      onTap:(){
                        Get.to(
                                ()=>AddTaskPage(),
                          arguments:{
                                  'ispass':true,
                                  'title':title,
                                  'todo':todo,
                                  'index':index,
                                   'code':code
                          }
                        );
                      },
                    ),

                  ])
                ],
              ),
            SizedBox(height:20,),
            Text(todo==''?'task':todo,style:TextStyle(fontSize:15,color:Colors.black),maxLines:5,),
            SizedBox(height:20,),

          ],
        ),
      ),
    ),
  );
}