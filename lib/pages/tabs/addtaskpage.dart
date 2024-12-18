import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/storage/addtodo.dart';
import 'package:todo/widget/formtext.dart';
import 'package:todo/widget/snackbar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _title=TextEditingController();
  TextEditingController _task=TextEditingController();
  final todo=Get.put(AddTodo());
  var isPass=Get.arguments?['ispass']??false;
  var title=Get.arguments?['title']??'';
  var todoget=Get.arguments?['todo']??'';
  var index=Get.arguments?['index']??'';
  var id=Get.arguments?['id']??'';
  var codeUpade=Get.arguments?['code']??'';

  void updateData(){
    if(isPass==true){
      _title.text=title;
      _task.text=todoget;
    }
  }

@override
  void initState() {
  updateData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
             FormText(
                 controller:_title,
                 hintext:'Enter here title',
                 maxLines:1
             ),
           SizedBox(height:20,),
            FormText(
                controller:_task,
                hintext:'Enter here title',
                maxLines:6
            ),
            SizedBox(height:35,),
            ElevatedButton(
               style:ElevatedButton.styleFrom(
                backgroundColor:Colors.blue,
                 foregroundColor:Colors.white,
                 fixedSize:Size(350,50)
               ),
                onPressed:isPass==false?(){
                 if(_title.text.isEmpty||_task.text.isEmpty){
                   snackBar('Error',"fill the textBox??", context);
                 }else{
                    if(id=='sc'){
                      todo.addTodo('sc',_title.text, _task.text);
                      print(id);
                    }
                    else if(id=='dele'){
                      todo.addTodo('dele',_title.text, _task.text);
                      print(id);
                    }
                    else if(id=='del'){
                      todo.addTodo('del',_title.text, _task.text);
                      print(id);
                    }

                    else{
                      todo.addTodo('do',_title.text, _task.text);
                      print('d');
                      print(id);
                    }
                     print("Done");
                     Get.back();
                     _title.clear();
                     _task.clear();


                 }
                }:(){
                 if(codeUpade=='sc'){
                   todo.updateTodo(index,_title.text,_task.text,'sc');
                 }
                 else if(codeUpade=='dele'){
                   todo.updateTodo(index,_title.text,_task.text,'dele');
                 }
                 else if(codeUpade=='del'){
                   todo.updateTodo(index,_title.text,_task.text,'del');
                 }
                 else{
                   todo.updateTodo(index,_title.text,_task.text,'do');
                   print('d');
                 }
                  Get.back();
                },
                child:isPass==false? const Text("Done"):const Text("UpDate")
            )
          ],
        ),
      ),
    );
  }
}
