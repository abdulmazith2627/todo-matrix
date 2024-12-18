import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTodo extends GetxController {
  final  todoDase=Hive.box('addTodo');

  var todoDo=<Map<String, String>>[].obs;
  var todoSch=<Map<String, String>>[].obs;
  var todoDele=<Map<String, String>>[].obs;
  var todoDel=<Map<String, String>>[].obs;


  addTodo(key,title,task){

    if(key=='do'){
      todoDo.add({
        'name':title,
        'task':task
      });
      todoDase.put('do',todoDo);
    }
    else if(key=='sc'){
      todoSch.add({
        'name':title,
        'task':task
      });
      todoDase.put('sc',todoSch);
    }else if(key=='dele'){
      todoDele.add({
        'name':title,
        'task':task
      });
      todoDase.put('dele',todoDele);
    }else if(key=='del'){

      todoDel.add({
        'name':title,
        'task':task
      });
      todoDase.put('del',todoDel);
    }

  }



  getdata(key) {

    if(key=='do'){
      var data = todoDase.get('do');
      if (data != null) {
        todoDo.value = List<Map<String, String>>.from(data.map((e) {
          return Map<String, String>.from(e as Map);
        }));
        print(todoDo);
      }
    }else if(key=='sc'){
      var data = todoDase.get('sc');
      if (data != null) {
        todoSch.value = List<Map<String, String>>.from(data.map((e) {
          return Map<String, String>.from(e as Map);
        }));
        print(todoSch);
      }
    }else if(key=='dele'){
      var data = todoDase.get('dele');
      if (data != null) {
        todoDele.value = List<Map<String, String>>.from(data.map((e) {
          return Map<String, String>.from(e as Map);
        }));
        print(todoDele);
      }
    }else if(key=='del'){
      var data = todoDase.get('del');
      if (data != null) {
        todoDel.value = List<Map<String, String>>.from(data.map((e) {
          return Map<String, String>.from(e as Map);
        }));
        print(todoDel);
      }
    }
    print(todoDo);



  }


  deleteTodo(index,key){

    if(key=='do'){
      todoDo.removeAt(index);
      todoDase.put('do', todoDo);
    }else if(key=='sc'){
      todoSch.removeAt(index);
      todoDase.put('sc', todoSch);
    }else if(key=='dele'){
      todoDele.removeAt(index);
      todoDase.put('dele', todoDele);
    }else if(key=='del'){
      todoDel.removeAt(index);
      todoDase.put('del', todoDel);
    }

  }



  updateTodo(index,title,task,key){

    if(key=='do'){
      todoDo[index]={
        'name':title,
        'task':task
      };
      todoDase.put('do',todoDo);
    }else if(key=='sc'){
      todoSch[index]={
        'name':title,
        'task':task
      };
      todoDase.put('sc',todoSch);
    }else if(key=='dele'){
      todoDele[index]={
        'name':title,
        'task':task
      };
      todoDase.put('dele',todoDele);
    }else if(key=='del'){
      todoDel[index]={
        'name':title,
        'task':task
      };
      todoDase.put('del',todoDel);
    }


  }


}

