
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moniepointtest/core/controller/appcontroller.dart';
import 'package:moniepointtest/screens/home/home.dart';
import 'package:moniepointtest/screens/home/widgets/fab_widget.dart';
import 'package:moniepointtest/screens/search/search.dart';

import 'core/constants/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 final AppController controller = Get.put(AppController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx( ()=> controller.oncurrentScreen.value==0? HomeScreen():SearchScreen()) ,
    );
  }
}
