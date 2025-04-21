
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepointtest/core/constants/colors.dart';
import 'package:moniepointtest/core/controller/appcontroller.dart';
import 'package:moniepointtest/core/utils/AsssetsUtils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepointtest/screens/home/widgets/countingtextanimation.dart';
import 'package:moniepointtest/screens/home/widgets/fab_widget.dart';
import 'package:moniepointtest/screens/home/widgets/imagetitle_widget.dart';

import '../../core/theme/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppController controller =Get.find();
 final AppTextStyle _textStyle = AppTextStyle.instance;
 final ScrollController _scrollController = ScrollController();
 bool _isFabButtonVisible = false;
 bool _isTextOneVisible = false;


 double _lastOffset = 0;

 ///app bar
 var _isappBarLocationVisible = 0.0;
 var _isappBarCircleAvatar =0.0;


 ///shape (circle and rectnagle)
 var _isShapeVisible = 0.0;

 ///staggered grid view
 bool _isStaggeredGridviewVisible =false;
 bool _showBottom = false;

 final List<String> imageUrls = [
   "rs1", // Full-width image
   'rs2',
   'rs3',
   'rs3',
   'rs4',
   'rs5',
   'rs6'
 ];


 @override
 void initState() {
   super.initState();
   //appbarAnim();
   _scrollController.addListener(_onScroll);
 }




 void _onScroll() {
   double currentOffset = _scrollController.offset;

   print(currentOffset);


   if(_isappBarLocationVisible == 0.0){
     setState(() {
       _isappBarLocationVisible = _isappBarLocationVisible+160.0;
       _isappBarCircleAvatar = _isappBarCircleAvatar + 1.0;
     });
   }







   ///shape animation
   if (currentOffset >= 1.8 && _isShapeVisible == 0.0) {
     // scrolling down
     setState(() {
       _isShapeVisible = 1.0;
     });
   }else if  (currentOffset <= 0.2 &&  _isShapeVisible==1.0){
     // scrolling up
     setState(() => _isShapeVisible = 0.0);
   }


   ///Intro text animation
   if (currentOffset >= 1.2 && !_isTextOneVisible) {
     // scrolling down
     setState(() => _isTextOneVisible = true);

   }else if  (currentOffset <= 0.2 && _isTextOneVisible){
     // scrolling up
     setState(() => _isTextOneVisible = false);
   }


   if (_scrollController.offset > 1.4 && !_showBottom) {
     setState(() => _showBottom = true);
   } else if (_scrollController.offset <= 1.4 && _showBottom) {
     setState(() => _showBottom = false);
   }


   ///staggered grid view animation
   if (currentOffset >= 1.8 && !_isStaggeredGridviewVisible) {
     // scrolling down
     setState(() => _isStaggeredGridviewVisible = true);
   }else if  (currentOffset <= 0.2 && _isStaggeredGridviewVisible){
     // scrolling up
     setState(() => _isStaggeredGridviewVisible = false);
   }


   ///Fab button
   if (currentOffset > _lastOffset && _isFabButtonVisible) {
     // scrolling down
     setState(() => _isFabButtonVisible = false);
   } else if (currentOffset < _lastOffset && !_isFabButtonVisible) {
     // scrolling up
     setState(() => _isFabButtonVisible = true);
   }
   _lastOffset = currentOffset;
 }


  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color5, color4],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      floatingActionButton: AnimatedSlide(
        offset: _isFabButtonVisible ? Offset.zero : const Offset(1.5, 0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Align(
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
      ),
      //  appBar: AppBar(),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///top app bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        width:_isappBarLocationVisible,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        duration: Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: _isappBarLocationVisible==160 ? 1.0 : 0.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text("Saint Petersburg",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: _textStyle.appBarTile)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                     AnimatedScale(
                         scale: _isappBarCircleAvatar,
                         duration: Duration(milliseconds: 400),
                     child:  CircleAvatar(
                       radius: 24,
                       backgroundImage: AssetImage(AssetsUtils.getImageAssets("dtwo")),
                     ),)
                    ],
                  ),
                ),

                Gap(18),

                /// text content
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: AnimatedOpacity(
                //     duration: const Duration(milliseconds: 500),
                //     opacity: _isTextOneVisible ? 1.0 : 0.0,
                //     curve: Curves.easeIn,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("Hi, Marina",style: _textStyle.titleSmall,),
                //         Text("let's select your",style: _textStyle.titleMedium,),
                //         Text("perfect place",style: _textStyle.titleMedium),
                //       ],
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _isTextOneVisible ? 1.0 : 0.0,
                          curve: Curves.easeIn,
                          child: Text("Hi, Marina",style: _textStyle.titleSmall,)),
                      
                      
                      AnimatedOpacity(
                        opacity: _isTextOneVisible ? 1.0 : 0.0,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 1200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("let's select your",style: _textStyle.titleMedium,),
                            Text("perfect place",style: _textStyle.titleMedium),
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),


                Gap(28),

                ///circle and rectangle shapes
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AnimatedScale(
                    // offset: _isShapeVisible ? Offset.zero : const Offset(2.0, 10.5),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeInOut,
                    scale: _isShapeVisible,
                    child: Row(
                      children: [

                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            color: color4,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            children: [
                              Gap(30),
                              Text('BUY',
                                style: GoogleFonts.roboto(
                                fontSize: 18.0, fontWeight: FontWeight.w600,color: color5),),

                              Gap(30),

                              CountingTextAnimation(
                                  targetNumber: 1234,
                                  style:  GoogleFonts.roboto(
                                      fontSize: 34.0, fontWeight: FontWeight.w800,color: color5), ),

                              // Text("1234", style: GoogleFonts.roboto(
                              //     fontSize: 34.0, fontWeight: FontWeight.w800,color: color5)),

                              Text('offers',style: GoogleFonts.roboto(
                                  fontSize: 16.0, fontWeight: FontWeight.w600,color: color5)),
                            ],
                          ),
                        ),

                        Gap(8.0),

                        Container(
                          width: 180,
                          height: 180,
                          decoration:BoxDecoration(
                            color: color5,
                            borderRadius: BorderRadius.circular(18.0)
                          ),
                          child: Column(
                            children: [
                              Gap(30),
                              Text('RENT',style: GoogleFonts.roboto(
                                  fontSize: 18.0, fontWeight: FontWeight.w600,color: color2)),

                              Gap(30),

                              CountingTextAnimation(
                                targetNumber: 2212,
                                style:  GoogleFonts.roboto(
                                    fontSize: 34.0, fontWeight: FontWeight.w800,color: color2), ),

                              // Text("2212",style: GoogleFonts.roboto(
                              //     fontSize: 34.0, fontWeight: FontWeight.w800,color: color2)),

                              Text('offers',style: GoogleFonts.roboto(
                                  fontSize: 16.0, fontWeight: FontWeight.w600,color: color2)),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),

                Gap(40),
                ///staggered grid view

            AnimatedSlide(
              offset: _showBottom ? Offset(0, 0) : Offset(0, 1),
              duration: Duration(milliseconds: 800),
              child: Container(
                decoration: BoxDecoration(
                  color: color5,
                  borderRadius: BorderRadius.circular(18.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                    children:  [
                      ///index 0
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: ImageTitleWidget(imageUrl: imageUrls[0],visible: _isStaggeredGridviewVisible,crossAxiscount: 4),
                      ),
                      ///index 1
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: ImageTitleWidget(imageUrl: imageUrls[1],visible: _isStaggeredGridviewVisible, crossAxiscount: 2,),
                      ),

                      ///index 2
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: ImageTitleWidget(imageUrl: imageUrls[2],visible: _isStaggeredGridviewVisible, crossAxiscount: 2,),
                      ),


                      ///index 3
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: ImageTitleWidget(imageUrl: imageUrls[3],visible: _isStaggeredGridviewVisible, crossAxiscount: 2,),
                      ),

                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: ImageTitleWidget(imageUrl: imageUrls[4],visible: _isStaggeredGridviewVisible, crossAxiscount: 2,),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: ImageTitleWidget(imageUrl: imageUrls[5],visible: _isStaggeredGridviewVisible, crossAxiscount: 2,),
                      ),

                    ],
                  ),
                ),
              ),
            )


              ],
            ),
          ),
        ),
      ),
    ));
  }



}
