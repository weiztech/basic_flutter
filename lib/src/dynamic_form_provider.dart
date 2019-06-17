import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'classes/users.dart';
import 'screens/add_user_form_provider.dart';
import 'screens/dynamic_list_provider.dart';

class DynamicFormProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Users>(
          builder: (BuildContext context) => Users()),
        ChangeNotifierProvider<CoreTitle>(
          builder: (BuildContext context) => CoreTitle())
      ],
      child: DynamicFormProviderState()
      );
  }
}

class DynamicFormProviderState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build dynamicform provider");
    final users = Provider.of<Users>(context);
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 35.0),
          onPressed: () {
            users
                .addData(data: {"name": "From provider ${users.datas.length}"});
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text("Dynamic Form Provider"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18, right: 20),
                child: InkWell(
                  child: Text("Save",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => DynamicListDataProvider(ctx: context)),
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
            itemCount: users.datas.length,
            itemBuilder: (context, idx) {
              //print("$idx ${usersForm[idx]}");
              return AddUserForm(id: idx);
            }));
  }
}
