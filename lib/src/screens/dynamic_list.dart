import 'package:basic_flutter/src/classes/routes.dart';
import 'package:flutter/material.dart';


class DynamicListData extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  DynamicListData({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text("List Form Data"),
          actions: <Widget>[
            if (data.length > 0)
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10),
                child: InkWell(
                  child: Text("Back To Menu",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  onTap: () {
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    // Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  },
                ),
              )
          ],
        ),
      ),
      body: data.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Text('${data[index]["name"]}'),
                  subtitle: Text('Age: ${data[index]["age"]}'),
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
