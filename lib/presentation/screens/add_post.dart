import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (postController.text.isNotEmpty) {
                  setState(() {
                    loading = true;
                  });
                  databaseRef
                      .push()
                      .set({
                        'id': databaseRef.push().key,
                        'title': postController.text,
                        'time': DateTime.now().millisecondsSinceEpoch,
                      })
                      .then((value) => {
                            setState(() {
                              loading = false;
                            }),
                            Navigator.pop(context),
                          })
                      .catchError((error) => {
                            setState(() {
                              loading = false;
                            }),
                          });
                } else {}
              },
              child: Text('Post'),
            )
          ],
        ),
      ),
    );
  }
}
