import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../classes/users.dart';

// Implement Form using Stateless widget (recomended way)

class AddUserForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController textName = TextEditingController();
  final TextEditingController textAge = TextEditingController();
  final int id;

  AddUserForm({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    final users = Provider.of<Users>(context);
    textName.text = users.datas[id]["name"];
    textAge.text = users.datas[id]["age"];
    //print("$size, ${size/1.31}");
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Form(
        onChanged: () {
          print("changed ${textName.text} ${textAge.text}");
          users.changeData(id, {"name": textName.text, "age": textAge.text}, notify: false);
        },
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*ListTile(
              title: Text('1625 Main Street', style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(Icons.person_add, color: Colors.blue[500])
            ),*/
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: Colors.lightBlueAccent[700],
                border: Border.all(
                  color: Colors.blue[50],
                  width: 1.0,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.blue[50],
                      size: 25,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 15),
                    width: size / 1.4,
                    child: Text('NEW USER',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[50])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: GestureDetector(
                      // hero tag should always unique for multiple FloatingActionButton
                      // heroTag: "remove-${data["id"]}",
                      // mini: true,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue[50],
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.delete_forever,
                          size: 25.0,
                          color: Colors.red[400],
                        ),
                      ),
                      //splashColor: Colors.transparent,
                      //backgroundColor: Colors.blueGrey[50],
                      onTap: () {
                        print("Child delete action $id");
                        users.removeData(id);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, bottom: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: textName,
                      onEditingComplete: () {
                        print("complete edit");
                      },
                      //initialValue: data["name"],
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'username',
                        labelText: 'Name *',
                      ),
                      onSaved: (String value) => print("Hello, $value"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textAge,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        hintText: 'user age',
                        labelText: 'Age *',
                      ),
                      onSaved: (String value) => print("Age, $value"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Age is required";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
