import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_model.dart';
import 'note_provider.dart';

class AddNotePage extends StatelessWidget {
  String? title;
  String? desc;
  bool isUpdate = false;

  AddNotePage({required this.isUpdate,this.title,this.desc});
  var titleController = TextEditingController();
  var descController = TextEditingController();
  String oprestionTitle = "Add Note";

  void addNote(String title, String desc,BuildContext context) async {
    context.read<NoteProvider>().addNote(NoteModel(title: title, desc: desc));
  }

  void UpdateNote(){

  }

  initControllers(){
    titleController.text = title!;
    descController.text = desc!;
  }
  @override
  Widget build(BuildContext context) {

     if(isUpdate){
       initControllers();
       oprestionTitle = 'Update Note';
     }

    return Scaffold(
      appBar: AppBar(
        title: Text(oprestionTitle),
      ),
      body: Container(
          height: 400,
          child: Column(children: [
            Text(oprestionTitle, style: TextStyle(fontSize: 21)),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21.0))),
            ),
            SizedBox(height: 21,),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  hintText: 'Enter Desc',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21.0))),
            ),
            ElevatedButton(
                child: Text(oprestionTitle),
                onPressed: () {
                  var title = titleController.text.toString();
                  var desc = descController.text.toString();

                  if(isUpdate){
                    UpdateNote();
                  } else {
                    addNote(title, desc, context);
                  }

                  Navigator.pop(context);
                }),
          ])),
    );
  }
}
