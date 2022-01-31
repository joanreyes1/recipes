import 'package:flutter/material.dart';

import 'package:recipes/src/pages/alert_page.dart';
import 'package:recipes/src/pages/animated_container_page.dart';
import 'package:recipes/src/pages/avatar_page.dart';
import 'package:recipes/src/pages/card_page.dart';
import 'package:recipes/src/pages/home_page.dart';
import 'package:recipes/src/pages/input_page.dart';
import 'package:recipes/src/pages/list_page.dart';
import 'package:recipes/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'input': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListaPage(),
  };
}
