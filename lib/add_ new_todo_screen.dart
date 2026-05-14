import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({super.key});

  @override
  State<todoScreen> createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  final TextEditingController _tittleController= TextEditingController();
  final TextEditingController _descriptionController= TextEditingController();
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO ADD'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _tittleController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.text_fields_outlined),
                  hintText: 'Tittle',
                  labelText: 'Tittle'


                ),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return "Inter a valid tittle";
                  }else{
                    return null;
                  }
                }
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description'
                ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Inter a valid description";
                    }

                    return null;

                  }
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                if(_formkey.currentState!.validate() == false){
                  return;
                }
               Todo todo= Todo(id: 1, title: _tittleController.text.trim(), description: _descriptionController.text, status: 'panding', createData: DateTime.now());
               Navigator.pop(context, todo);
              }, child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
