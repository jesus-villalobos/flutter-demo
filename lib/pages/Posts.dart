import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";


class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => PostsState();
}

class PostsState extends State<Posts> {

  List<Map<String, String>> posts = [];

  final _formKey = GlobalKey<FormState>();

  String newPostTitle = "",
       newPostCaption = "";
  
  @override
  void initState() {
    super.initState();
  }

  foo() {
    return ListView(
      children: posts.map((Map<String, String> post) {

        var title = post["title"] ?? "",
          caption = post["caption"] ?? "",
         dateTime = post["dateTime"] ?? "";

        return Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container( 
                padding: const EdgeInsets.all(10.0),
                child: Align( 
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Align( 
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    caption,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Align( 
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    dateTime,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                )
              ),
            ]
          )
        );
      }).toList(),
    );
  }

  newPostInputForm() {

    return Container(
      // height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Create a New Post!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CupertinoFormSection.insetGrouped(
                  header: const Text("Post Title"),
                  children: [
                    CupertinoTextFormFieldRow(
                      minLines: 1,
                      maxLines: 5, 
                      placeholder: "Enter a title",
                      keyboardType: TextInputType.multiline,
                      // controller: textController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                      onSaved: (newValue) {
                        newPostTitle = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ]
                ),
                CupertinoFormSection.insetGrouped(
                  header: const Text("Post Caption"),
                  children: [
                    CupertinoTextFormFieldRow(
                      minLines: 1,
                      maxLines: 5, 
                      placeholder: "Caption your post",
                      keyboardType: TextInputType.multiline,
                      // controller: textController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                      onSaved: (newValue) {
                        newPostCaption = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      // onChanged: ,
                    ),
                  ]
                ),
                Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: CupertinoButton.filled(
                    child: const Text("Create Post"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _formKey.currentState!.reset();

                        setState(() {
                          DateTime now = DateTime.now();
                          posts.insert(0, {
                            "title": newPostTitle, 
                            "caption": newPostCaption, 
                            "dateTime": "${now.month.toString()}/${now.day.toString()}/${now.year.toString()}, ${now.hour.toString()}:${now.minute.toString().padLeft(2)}"
                          });
                        });
                      }
                    }, 
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Posts'),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SingleChildScrollView(
                child: newPostInputForm(),
              ),
              Expanded(
                child: foo(),
              ),
            ],
          )
        )
      )
    );
  }
}