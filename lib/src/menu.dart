import 'package:flutter/material.dart';

import 'classes/routes.dart' show loginRoute, imagesRoute, dynamicListRoute,
  dynamicListProviderRoute, counterProviderRoute;

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Center(child: Text("Main Menu")),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: GridView.count(
            padding: const EdgeInsets.all(2.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                      width: 200,
                      padding: EdgeInsets.all(32.0),
                      child: Center(child: Text('Login'))),
                  onTap: () => Navigator.pushNamed(context, loginRoute),
                ),
              ),
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('Dynamic Form'))
                  ),
                  onTap: () => Navigator.pushNamed(context, dynamicListRoute),
                ),
              ),
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('List View'))
                  ),
                  onTap: () => Navigator.pushNamed(context, imagesRoute),
                ),
              ),
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('Counter using Provider'))
                  ),
                  onTap: () => Navigator.pushNamed(context, counterProviderRoute),
                ),
              ),
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('Dynamic Form using Provider'))
                  ),
                  onTap: () => Navigator.pushNamed(context, dynamicListProviderRoute),
                ),
              ),
              Card(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('Wrong url'))
                  ),
                  onTap: () => Navigator.pushNamed(context, "/wrong url"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
