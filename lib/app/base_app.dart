import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';

abstract class BaseApp {

  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if(baseRoutes.isNotEmpty) return routes.addAll(baseRoutes);

    if(microApps.isNotEmpty) {
      for(MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];

    if(navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}