import 'package:flutter/material.dart';
import 'package:to_do_app/add_%20new_todo_screen.dart';
import 'package:to_do_app/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            Todo todo = todoList[index];
            return ListTile(
              onLongPress: () {
                todoList.removeAt(index);
                setState(() {

                });
              },
              title: Text(todo.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.description),
                  Text('Create date: ${todo.createData}'),
                ],
              ),
              trailing: Text(todo.status),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         Todo? todo=await Navigator.push(context, MaterialPageRoute(builder: (context)=> todoScreen()));
         if(todo!= null){
           todoList.add(todo);
           setState(() {

           });
         }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


