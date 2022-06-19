import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/pages/unadsplash.dart';
import 'package:unad_app/services/asignaturaservice.dart';
import 'package:unad_app/services/proxyservice.dart';

void main() {
  runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider(
           create: (_) => AsignaturaService(),
         )
       ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  UNADSplash()
      )  
     )
  );
}