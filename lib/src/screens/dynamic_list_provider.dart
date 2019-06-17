import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../classes/users.dart';

import '../classes/routes.dart' show mainRoute ;


class DynamicListDataProvider extends StatelessWidget {
  final BuildContext ctx;

  DynamicListDataProvider({Key key, this.ctx}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(ctx);
    print("DynamicListData ${users.datas}");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text("List Form Data"),
          actions: <Widget>[
            if (users.datas.length > 0)
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10),
                child: InkWell(
                  child: Text("Back To Menux",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  onTap: () {
                    print(mainRoute);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    /*
                    if your using generatedRoute, make sure to add params settings
                    if not below code, will trigger error due to route.settings.name == null

                    Navigator.popUntil(context, ModalRoute.withName(mainRoute));
                    Navigator.of(context).popUntil((route) => route.settings.name == mainRoute );
                    */
                  },
                ),
              )
          ],
        ),
      ),
      body: users.datas.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: users.datas.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Text('${users.datas[index]["name"]}'),
                  subtitle: Text('Age: ${users.datas[index]["age"]}'),
                ));
              },
            )
          : Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Please Add Data First'),
              ),
            ),
    );
  }
}
