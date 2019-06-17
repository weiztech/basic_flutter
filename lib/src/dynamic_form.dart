import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'screens/add_user_form.dart';

import 'screens/dynamic_list.dart';


class DynamicListForm extends StatefulWidget {
  @override
  DynamicListFormState createState() => DynamicListFormState();
}

class DynamicListFormState extends State<DynamicListForm> {
  List<Map<String, dynamic>> usersForm = [];
  List<AddUserForm> widgetsForm = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, size: 35.0),
            onPressed: () => addForm(),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              title: Text("Dynamic Form"),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18, right: 20),
                  child: InkWell(
                    child: Text("Save",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DynamicListData(data: usersForm)),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          /*
          ListView, render all data wherever its visible or not on screen
          dynamic using ListView must use map, for rendering correctly on data changes
          body: ListView(children: widgetsForm.map((form) => form).toList())
          */

          /*
          ListView.builder, only render data that its visible on screen
          */
          body: ListView.builder(
              key: Key(Uuid().v4()),
              itemCount: usersForm.length,
              itemBuilder: (context, idx) {
                //print("$idx ${usersForm[idx]}");
                return AddUserForm(
                  name: usersForm[idx]["name"],
                  age: usersForm[idx]["age"],
                  id: idx,
                  deleteForm: deleteForm,
                  editData: editData,
                );
              }));
  }

  void addForm() {
    setState(() {
      usersForm.add({"name": "random ${usersForm.length}", "age": "100"});
    });
    print(usersForm);
  }

  void deleteForm(int idx) {
    setState(() {
      print("Parent Delete index[$idx] $usersForm ${usersForm[idx]} ");
      usersForm.removeAt(idx);
      print("Parent After Delete $usersForm ");
    });
  }

  void editData(int idx, Map<dynamic, dynamic> data) {
    print("Parent Edit index[$idx] $usersForm ");
    usersForm[idx] = data;
    print("just update data(usersForm) without calling setstate or rebuildUI");
  }

  void addWidgetForm() {
    setState(() {
      widgetsForm.add(AddUserForm());
    });
    print(widgetsForm);
  }
}
