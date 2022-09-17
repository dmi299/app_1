import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //It will cover 20% of our total height
      // height: size.height * 0.28,
      // color: Colors.black,
      // child: Stack(
      //   children: <Widget>[
      //     Container(
      //       height: size.height * 0.28 - 27,
      //       decoration: const BoxDecoration(
      //           // color: Color(0xff0047A1),
      //           // color: Colors.blue,
      //           borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(36),
      //             bottomRight: Radius.circular(36),
      //           )),
      //     ),

      child: Expanded(
        // bottom: 0,
        // left: 0,
        // right: 0,
        child: CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              // margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_01.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //2st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_02.jpg'), 
                  fit: BoxFit.cover
                )
                
              ),
            ),
            //3st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_03.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //4st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_04.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //5st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_05.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            )
          ],
          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(microseconds: 400),
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}