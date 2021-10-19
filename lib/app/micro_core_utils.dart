import 'package:flutter/widgets.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? object);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();