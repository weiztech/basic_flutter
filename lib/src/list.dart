import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' show get;

import 'widgets/images.dart';

class ListImages extends StatefulWidget {
  @override
  ListImagesState createState() => ListImagesState();
}

class ListImagesState extends State<ListImages> {
  int go = 0;
  List<dynamic> images = [];

  void getImages() async {
    var resp = await get("https://jsonplaceholder.typicode.com/photos");
    var body = jsonDecode(resp.body);
    setState(() {
      images = body;
    });
    print("getImages");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    // getImages();
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Text("Yes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getImages();
            setState(() {
              go++;
            });
            print("$go, ${images.length}");
          },
          tooltip: 'Button Here',
          child: Icon(Icons.add_a_photo),
        ),
        appBar: AppBar(
          title: Text(
            "Hello ${ go == 0 ? "" : go } ${images.length == 0 ? "" : images.length}"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_play),
              tooltip: 'Air it',
              onPressed: () => null,
            ),
            IconButton(
              icon: Icon(Icons.playlist_add),
              tooltip: 'Restitch it',
              onPressed: () => null,
            ),
            IconButton(
              icon: Icon(Icons.playlist_add_check),
              tooltip: 'Repair it',
              onPressed: () => null,
            ),
          ],
        ),
        body: ImageListWidget(images.length > 19 ? images.sublist(0, 19) : images),
      );
  }
}
