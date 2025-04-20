


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moniepointtest/core/constants/colors.dart';

import '../../core/controller/appcontroller.dart';
import '../../core/theme/app_text_style.dart';
import '../home/widgets/fab_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AppController controller =Get.find();
  final AppTextStyle _textStyle = AppTextStyle.instance;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(()=>Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 240,
          decoration: BoxDecoration(
              color: color1.withOpacity(0.8),
              borderRadius: BorderRadius.circular(22.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FabWidget(icon:Icons.search,showCircle: controller.oncurrentScreen.value==1?true:false,ontap:(){
                controller.oncurrentScreen.value=1;
              }),
              FabWidget(icon: Icons.message,showCircle: false,ontap:(){}),
              FabWidget(icon:Icons.home,showCircle: controller.oncurrentScreen.value==0?true:false,ontap:(){
                controller.oncurrentScreen.value=0;
              }),
              FabWidget(icon: Icons.favorite,showCircle: false,ontap:(){}),
              FabWidget(icon:Icons.person,showCircle: false,ontap:(){}),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [


          Positioned(
            left: 0,
            right: 0,
           // top: 10,
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                      color: color5,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(

                      children: [
                        Icon(Icons.search),
                        Gap(4.0),
                        Text("Saint Petersburg",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _textStyle.appBarTile)
                      ],
                    ),
                  ),
                ),

                Gap(10.0),

                Container(
                  decoration: BoxDecoration(
                      color: color5,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.settings),
                  ),
                )
              ],
            ),
          ),
          
          
          Positioned(
             left: 0,
             right: size.width*0.8,
             // top: 100,
             bottom: size.width*0.2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color7.withOpacity(0.4),
                      shape: BoxShape.circle
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.gradient,color: Colors.white,),
                      )),

                  Gap(6.0),


                  Container(
                      decoration: BoxDecoration(
                          color: color7.withOpacity(0.4),
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.send_and_archive,color: Colors.white,),
                      )),

                ],
              )),



        ],
      )),
    ));
  }
}
