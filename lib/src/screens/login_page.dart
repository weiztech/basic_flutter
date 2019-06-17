import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState(title);
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final String title;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  Map<String, dynamic> data = {};

  LoginPageState(this.title);

  @override
  Widget build(BuildContext context) {
    // media query for check size to make adaptive
    print(
        "${MediaQuery.of(context).size.width} X ${MediaQuery.of(context).size.height}");
    final horizontal = MediaQuery.of(context).size.width / 20;
    final vertical = MediaQuery.of(context).size.width / 20;
    print("$vertical X $horizontal");
    return Container(
        width: MediaQuery.of(context).size.width * 0.87,
        height: MediaQuery.of(context).size.height * 0.80,
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Form(
          onChanged: () {
            // print("onChanged");
            // formKey.currentState.initState();
          },
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Text(title),
              emailField(context),
              passwordField(context),
              Container(
                margin: EdgeInsets.all(20),
                /*decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    border: Border.all(color: Colors.black, width: 8.0)),*/
              ),
              buttonSubmit(context)
            ],
          )),
        ));
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      initialValue: "random@test.com",
      keyboardType: TextInputType.emailAddress,
      focusNode: emailFocus,
      // textInputAction: TextInputAction.next,
      onFieldSubmitted: (String value) {
        // method triggered after press enter on keyboard
        print("onFieldSubmitted: $value");
        emailFocus.unfocus();
        FocusScope.of(context).autofocus(passwordFocus);
        //submitForm(context);
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'you@example.com',
        labelText: 'Email',
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
        print("Save $value");
        data["email"] = value;
      },
      validator: (String value) {
        print("validate email");
        if (value.isEmpty) {
          return "Email not be empty";
        }
        return !value.contains('@') ? 'Email is not valid.' : null;
      },
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      textInputAction: TextInputAction.next,
      focusNode: passwordFocus,
      onFieldSubmitted: (String value) {
        // method triggered after press enter on keyboard
        print("onFieldSubmitted: $value");
        passwordFocus.unfocus();
        //submitForm(context);
      },
      // obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'your password',
        labelText: 'Password',
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
        print("Save $value");
        data["password"] = value;
      },
      validator: (String value) {
        print("validate password");
        if (value.isEmpty) {
          return "Password not be empty";
        }
        else if (value.length < 5 ) {
          return "Password minimal 5 char";
        }
        return value.contains('@') ? 'Do not use the @ char.' : null;
      },
    );
  }

  Widget buttonSubmit(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(left: 130, right: 130),
      onPressed: () {
        // Manually call validate
        print("Onpressed: ${formKey.currentState.validate()}");
        submitForm(context);
        // formKey.currentState.reset();
      },
      textColor: Colors.white,
      color: Colors.blueAccent,
      child: const Text('Submit'),
    );
  }

  void submitForm(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      // do post api/save request after save is called
      print("our data: $data}");
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text("Success!, $data")));
    }
  }
}
