import 'package:digitaledge/core/cache_helper.dart';
import 'package:digitaledge/core/constants_manager.dart';
import 'package:digitaledge/global.dart';
import 'package:flutter/material.dart';

import 'core/app.dart';

void main() async {
  await Global.init();
  

  runApp(MyApp());
}
