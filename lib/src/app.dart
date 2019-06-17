import 'package:flutter/material.dart';


class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}


class MainAppState extends State<MainApp> {
  int go = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Text("Yes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => go+=1);
            print(go);
          },
          tooltip: 'Button Here',
          child: Icon(Icons.add_a_photo),
        ),
        appBar: AppBar(
          title: Text("Hello Counter $go"),
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.playlist_play),
                  tooltip: 'Air it',
                  onPressed: () => null,
                ),
              ]),
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
        body: Center(
          child: Text("Yukanx"),
        ),
      ),
    );
  }
}


/*/// The Main Basic Flutter App Stateless Widget(setstate not allowed).
/// 
/// Widget for main page
/// 
class MainApp extends StatelessWidget {
  int go = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Text("Yes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            go+=1;
            print(go);
          },
          tooltip: 'Button Here',
          child: Icon(Icons.add_a_photo),
        ),
        appBar: AppBar(
          title: Text("Hello App Bar"),
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.playlist_play),
                  tooltip: 'Air it',
                  onPressed: () => null,
                ),
              ]),
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
        body: Center(
          child: Text("Yukanx"),
        ),
      ),
    );
  }
}
*/