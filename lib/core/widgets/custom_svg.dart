import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SVGIcon extends StatelessWidget {
  final String iconName;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? boxFit;


  const SVGIcon(
      {super.key, this.color, required this.iconName, this.height, this.width, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width:width??  20,
      height: height?? 20,

       // color: color ??AppColors.blueLiteColor,
       fit:boxFit?? BoxFit.fill,
      iconName,
    );
  }
}
class CustomSVGImage extends StatelessWidget {
  final String iconName;
  


  const CustomSVGImage(
      {super.key,required this.iconName,});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      
       fit: BoxFit.fill,
      iconName,
    );
  }
}


class BackGroundImages extends StatelessWidget {
  final String image;


  final BoxFit? boxFit;


  const BackGroundImages(
      {super.key,  required this.image,this.boxFit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: MediaQuery.of(context).size.width,


      fit:boxFit?? BoxFit.contain,
      image,
    );
  }
}