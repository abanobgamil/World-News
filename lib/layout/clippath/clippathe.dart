import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {

    double width = size.width ;
    double height = size.height ;

    final path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(
        width * 0.5,
        height - 100,
        width,
        height
    );
    path.lineTo(width,0);
    path.close();
    // path.moveTo(width*0.0008333,height*0.1485714);
    // path.lineTo(width*0.2075000,height*0.1457143);
    // path.lineTo(width*0.2991667,height*0.0657143);
    // path.lineTo(width*0.7533333,height*0.0642857);

    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false ;
  }
  
  
}