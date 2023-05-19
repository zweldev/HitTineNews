import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/app/note_model.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController titleCon = TextEditingController();
  TextEditingController contentCon = TextEditingController();

  Stream<List<NoteModel>> notes =
      FirebaseFirestore.instance.collection('notes').snapshots().map((event) {
    return event.docs.map(
      (e) {
        print('befor to fromJSON ${NoteModel.fromJSON(e.data()).toJSON()}');
        return NoteModel.fromJSON(e.data());
      },
    ).toList();
  });

  String convert(String text) {
    return sha1.convert(utf8.encode(text)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: StreamBuilder<List<NoteModel>>(
        stream: notes,
        builder: (context, snapshot) {
          print('snapshot data ${snapshot.data}');
          if (snapshot.hasError) {
            return Center(
              child: Text('No Data'),
            );
          } else if (snapshot.hasData) {
            List<NoteModel>? note = snapshot.data;
            return ListView.builder(
              itemCount: note!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showNoteDialog(
                      note: note[index],
                      context: context,
                      onSubmit: () async {
                        var noteModel = note[index].copyWith(
                            title: titleCon.text,
                            content: contentCon.text,
                            createdTime: DateTime.now().toString());

                        print(
                            'update note ${noteModel.toJSON()} && update doc id ${FirebaseFirestore.instance.collection('notes').doc(convert(note[index].title)).id}');

                        await FirebaseFirestore.instance
                            .collection('notes')
                            .doc(convert(note[index].title))
                            .update(noteModel.toJSON());

                        print(
                            ' 2 update note ${noteModel.toJSON()} && update doc id ${FirebaseFirestore.instance.collection('notes').doc(convert(note[index].title)).id}');
                      },
                    );
                  },
                  onLongPress: () async {
                    print(
                        'doc id ${FirebaseFirestore.instance.collection('notes').doc(FirebaseFirestore.instance.collection('notes').doc(convert(note[index].title)).id).id}');

                    await FirebaseFirestore.instance
                        .collection('notes')
                        .doc(FirebaseFirestore.instance
                            .collection('notes')
                            .doc(convert(note[index].title))
                            .id)
                        .delete();
                  },
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Center(
                        child: Text(
                      note[index].title[0].toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                  title: Text(note[index].title),
                  subtitle: Text(note[index].content),
                  trailing: Text(note[index].createdTime.toString()),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNoteDialog(
              context: context,
              onSubmit: () async {
                var newNote = NoteModel(
                    id: Random.secure().nextInt(999).toString(),
                    title: titleCon.text,
                    content: contentCon.text,
                    createdTime: DateTime.now().toString());
                print('note to submit ${newNote.toJSON()}');
                await FirebaseFirestore.instance
                    .collection('notes')
                    .doc(convert(titleCon.text))
                    .set(newNote.toJSON());
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showNoteDialog(
      {NoteModel? note,
      required BuildContext context,
      required VoidCallback onSubmit}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextForm(controller: titleCon),
            SizedBox(height: 30),
            CustomTextForm(
              controller: contentCon,
              maxLine: 3,
            )
          ],
        ),
        actions: [ElevatedButton(onPressed: onSubmit, child: Text('Submit'))],
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.controller, this.maxLine});

  final TextEditingController controller;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
