import 'package:flutter/material.dart';


class ImageListWidget extends StatelessWidget {
  final List<dynamic> images;

  ImageListWidget(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (ctx, idx){
        /*if (images.length > 0) {
          return Text("${images[idx]}");
        }*/
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo),
            color: const Color(0xFF00FF00)
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.network(images[idx]["url"]),
              ),
              Text(images[idx]["title"]),
            ],
          ),
          margin: const EdgeInsets.all(10.0),
          //color: const Color(0xFF00FF00),
          padding: EdgeInsets.all(20),
          //width: 100.0,
          //height: 100.0,
        );
        // return Image.network(images[idx]["url"]);
      },
    );
  }
}