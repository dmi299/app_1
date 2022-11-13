import 'package:flutter/material.dart';

class MainIconAvatarUser extends StatelessWidget {
  final String imgSrc;
  const MainIconAvatarUser({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //It will cover 40% of our total width
      height: size.height * 0.1,
      width: size.height * 0.1,
      margin: const EdgeInsets.only(
        // left: 10,
        right: 10,
        // top: ,
        // bottom: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        // color: Colors.lightBlue[600],
        image: DecorationImage(image: AssetImage(imgSrc), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(100),
      ),
      // child: Column(children: <Widget>[
      //   // const Spacer(),
      //   Image.asset(
      //     imgSrc,
      //     width: 100,
      //     height: 100,
      //   ),
      // ]),
    );
  }
}
