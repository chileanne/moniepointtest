
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/AsssetsUtils.dart';

class ImageTitleWidget extends StatelessWidget {
  final String imageUrl;
  final bool visible;
  final int crossAxiscount;
  const ImageTitleWidget({super.key, required this.imageUrl, required this.visible, required this.crossAxiscount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.asset(
              AssetsUtils.getImageAssets(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        AnimatedPositioned(
          left: 0,
          right: visible ? 0 : size.width,
          top: size.width * 0.34,
          duration: Duration(milliseconds: 900),
          curve: Curves.easeIn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: color6.withOpacity(0.60),
                borderRadius: BorderRadius.circular(18.0),
              ),
             // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
              //  mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 // const Spacer(),
                  Flexible(
                    flex: crossAxiscount >=4?6:4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        width:  crossAxiscount >=4?400:200,
                        alignment: Alignment.center,
                        padding:  EdgeInsets.only(left:  crossAxiscount >=4? 16.0:4.0),
                        child: Text(
                          "Gladokova st..,25",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),


                 // const Spacer(),
                  Flexible(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: color4,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Icon(Icons.arrow_forward_ios, size: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

        /*  AnimatedPositioned(
            left: 0,
            right: visible? 0 :size.width,
            top: size.width * 0.34 ,
           // bottom:  size.width * 0.4 ,

            duration: Duration(milliseconds: 800),
            curve: Curves.easeIn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
            // width: visible? 200.0 : 30.0,
                decoration: BoxDecoration(
                  color: color6.withOpacity(0.60),
                  borderRadius: BorderRadius.circular(18.0)
                ),
              // duration: Duration(milliseconds: 500),
              //   curve: Curves.easeIn,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   //   Gap(size.width * 0.4),
                      Text("Gladokova st..,25",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontSize: 16.0,
                          fontWeight: FontWeight.w600),),


                      Container(
                        decoration: const BoxDecoration(
                          color: color4,
                          shape: BoxShape.circle,
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Icon(Icons.arrow_forward_ios,size: 10,),
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
            )

        )*/
      ],
    );
  }
}
