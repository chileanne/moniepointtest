
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepointtest/core/constants/colors.dart';
import 'package:moniepointtest/core/utils/AsssetsUtils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepointtest/screens/home/widgets/fab_widget.dart';
import 'package:moniepointtest/screens/home/widgets/imagetitle_widget.dart';

import '../../core/theme/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final AppTextStyle _textStyle = AppTextStyle.instance;
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color5, color4],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
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
              FabWidget(icon:Icons.search,showCircle: false),
              FabWidget(icon: Icons.message,showCircle: false),
              FabWidget(icon:Icons.home,showCircle: true),
              FabWidget(icon: Icons.favorite,showCircle: false),
              FabWidget(icon:Icons.person,showCircle: false),

            ],
          ),
        ),
      ),
      //  appBar: AppBar(),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///top app bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text("Saint Petersburg",
                              style: _textStyle.appBarTile)
                            ],
                          ),
                        ),
                      ),

                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(AssetsUtils.getImageAssets("dtwo")),
                      ),
                    ],
                  ),
                ),

                Gap(18),

                /// text content
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Marina",style: _textStyle.titleSmall,),
                      Text("let's select your",style: _textStyle.titleMedium,),
                      Text("perfect place",style: _textStyle.titleMedium),
                    ],
                  ),
                ),


                Gap(28),

                ///circle and rectangle shapes
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [

                      Container(
                        width: 200,
                        height: 200,
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

                            Text("1234", style: GoogleFonts.roboto(
                                fontSize: 34.0, fontWeight: FontWeight.w800,color: color5)),

                            Text('offers',style: GoogleFonts.roboto(
                                fontSize: 16.0, fontWeight: FontWeight.w600,color: color5)),
                          ],
                        ),
                      ),

                      Gap(8.0),

                      Container(
                        width: 200,
                        height: 200,
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

                            Text("2212",style: GoogleFonts.roboto(
                                fontSize: 34.0, fontWeight: FontWeight.w800,color: color2)),

                            Text('offers',style: GoogleFonts.roboto(
                                fontSize: 16.0, fontWeight: FontWeight.w600,color: color2)),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),

                Gap(40),
                ///staggered grid view

            Container(
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
                      child: ImageTitleWidget(imageUrl: imageUrls[0]),
                    ),
                    ///index 1
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: ImageTitleWidget(imageUrl: imageUrls[1]),
                    ),

                    ///index 2
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: ImageTitleWidget(imageUrl: imageUrls[2]),
                    ),


                    ///index 3
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: ImageTitleWidget(imageUrl: imageUrls[3]),
                    ),

                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: ImageTitleWidget(imageUrl: imageUrls[4]),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: ImageTitleWidget(imageUrl: imageUrls[5]),
                    ),

                  ],
                ),
              ),
            )


              ],
            ),
          ),
        ),
      ),
    );
  }



}
