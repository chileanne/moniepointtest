


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepointtest/core/constants/colors.dart';
import 'package:moniepointtest/core/utils/AsssetsUtils.dart';
import 'package:moniepointtest/screens/search/widgets/bevelclipper.dart';

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


  var isScaling = 0.0;
  var isshow = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        isScaling =1.0;
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(()=>Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AssetsUtils.getImageAssets("map"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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


              ///top sear bar
              Positioned(
                left: 0,
                right: 0,
               // top: 10,
                child:   AnimatedScale(
                  scale: isScaling,
                  duration: Duration(milliseconds: 400),
                  child: Row(
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
              ),


              ///two floating icons in a column view at the left side of screen
              Positioned(
                 left: 0,
                 right: size.width*0.8,
                 // top: 100,
                 bottom: size.width*0.2,
                  child: AnimatedScale(
                    scale: isScaling,
                    duration: Duration(milliseconds: 400),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              isshow =!isshow;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: color7.withOpacity(0.4),
                              shape: BoxShape.circle
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.gradient,color: Colors.white,size: 16,),
                              )),
                        ),

                        Gap(6.0),


                        Container(
                            decoration: BoxDecoration(
                                color: color7.withOpacity(0.4),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.send_and_archive,color: Colors.white,size: 16,),
                            )),

                      ],
                    ),
                  )),


              ///floating icons at the ride side
              Positioned(
                  left: size.width*0.6,
                  right: 0,
                  // top: 100,
                  bottom: size.width*0.2,
                  child: AnimatedScale(
                    scale: isScaling,
                    duration: Duration(milliseconds: 400),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: color7.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12.0)
                              //shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.gradient,color: Colors.white,size: 16,),
                                Gap(4.0),
                                Text("List of variants",style:  GoogleFonts.inter(fontSize: 12.0, fontWeight: FontWeight.w400,color: color5),)
                              ],
                            ),
                          )),
                    ),
                  ),


              ),


              ///pop up menu
              AnimatedPositioned(
                left: 0,
                right: size.width*0.5,
                bottom: isshow?size.width*0.34:size.width*0.2,
                duration: const Duration(milliseconds: 600),
              //  opacity: isshow ? 1.0 : 0.0,
                curve: Curves.easeInOut,
                child: Visibility(
                  visible: isshow,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: color5,
                            borderRadius: BorderRadius.circular(12.0)
                          //shape: BoxShape.circle
                        ),
                        child: Column(
                          children: [
                            items(Icons.check_circle_outline_outlined, "Cosy areas",color3),
                            items(Icons.wallet_outlined, "Price",color4),
                            items(Icons.medical_information_outlined, "Infrastructure",color3),
                            items(Icons.ac_unit_outlined, "Withouth any layer",color3),
                          ],
                        )),
                  ),
                ),


              ),



              Positioned(
                  left: size.width*0.2,
                  right: size.width*0.54,
                  // top: 100,
                  bottom: size.width*0.8,
                  child: AnimatedScale(
                    scale: isScaling,
                    duration: Duration(milliseconds: 400),
                    child: chat("13,3mn p"),
                  )),


              Positioned(
                  left: size.width*0.4,
                  right: size.width*0.34,
                  top:size.width*0.4,
                 // bottom: size.width*0.1,
                  child: AnimatedScale(
                    scale: isScaling,
                    duration: Duration(milliseconds: 400),
                    child: chat("13,3mn p"),
                  )),


              Positioned(
                  left: size.width*0.2,
                  right: size.width*0.54,
                  top:size.width*0.6,
                  // bottom: size.width*0.1,
                  child: AnimatedScale(
                    scale: isScaling,
                    duration: Duration(milliseconds: 400),
                    child: chat("13,3mn p"),
                  )),





            ],
          )),
        ),
      ],
    ));
  }
  
  
  
  items(IconData d, String s, Color color){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
           Icon(d,color: color,),
          Gap(4.0),
          Text(s,
            style:  GoogleFonts.inter(fontSize: 14.0, fontWeight: FontWeight.w300,color: color),)
        ],
      ),
    );
  }


  chat(String s){
    return  Container(
    //  width: 220,
     // margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
     // padding: const EdgeInsets.all(12.0),
     // constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
      decoration: BoxDecoration(
        color:color4,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular( 16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          s,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  
}
