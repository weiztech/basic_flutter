import 'package:flutter/material.dart';

import '../list.dart';
import '../login.dart';
import '../menu.dart';
import '../provider_counter.dart';
import '../dynamic_form_provider.dart';
import '../dynamic_form.dart';

const mainRoute = "/";
const loginRoute = "/login";
const imagesRoute = "/list_images";
const counterProviderRoute = "/counter_provider";
const dynamicListRoute = "/dynamic_form";
const dynamicListProviderRoute = "/dynamic_form_provider";

final dynamicFormWithProvider = DynamicFormProvider();
final dynamicFormBasic = DynamicListForm();

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => Menu(),
          settings: settings
        );
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login());
      case imagesRoute:
        return MaterialPageRoute(builder: (_) => ListImages());
      case dynamicListRoute:
        return MaterialPageRoute(
          builder: (_) => dynamicFormBasic,
          settings: settings
        );
      case counterProviderRoute:
        return MaterialPageRoute(builder: (_) => MainCounter());
      case dynamicListProviderRoute:
        return MaterialPageRoute(
          builder: (_) => dynamicFormWithProvider,
          settings: settings
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: AppBar(
                      title: Text("Page Not Found"),
                    ),
                  ),
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
