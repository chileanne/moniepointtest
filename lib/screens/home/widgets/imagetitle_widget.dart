
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/AsssetsUtils.dart';

class ImageTitleWidget extends StatelessWidget {
  final String imageUrl;
  const ImageTitleWidget({super.key, required this.imageUrl});

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
        Positioned(
            left: 0,
            right: 0,
            top: size.width * 0.34 ,
            //bottom:  size.width * 0.4 ,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              //  height: 30,
                decoration: BoxDecoration(
                  color: color6.withOpacity(0.60),
                  borderRadius: BorderRadius.circular(18.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Text("Gladokova st..,25",style: GoogleFonts.roboto(fontSize: 16.0,
                        fontWeight: FontWeight.w600),),

                    Spacer(),

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
            )

        )
      ],
    );
  }
}
