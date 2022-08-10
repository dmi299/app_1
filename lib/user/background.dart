import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    required MainAxisAlignment mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This size provide us total height and width of our screen
    return SingleChildScrollView(
      // shaderCallback: (bounds) => const LinearGradient(
      //   colors: [Colors.white, Colors.black12],
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.center,
      // ).createShader(bounds),
      // blendMode: BlendMode.darken,

      // decoration: const BoxDecoration(
      //     color: Colors.white,
      //     image: DecorationImage(
      //         image: AssetImage('images/bg_2.jpg'),
      //         fit: BoxFit.cover,
      //         // opacity: 0.8,
      //         colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken))),
      // height: size.height,
      // width: double.infinity,

      // alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('images/bg_2.jpg'),
                fit: BoxFit.cover,
                opacity: 0.68,
                colorFilter:
                    ColorFilter.mode(Colors.black12, BlendMode.darken))),
        height: size.height,
        width: double.infinity,
        // Positioned(
        //   top: 25,
        //   left: 0,
        //   child: Image.asset(
        //     'images/main_top.png',
        //     width: size.width * 0.3,
        //     ),
        //   ),
        //   Positioned(
        //     bottom: 0,
        //     right: 0,
        //     child: Image.asset(
        //       'images/login_bottom.png',
        //       width: size.width * 0.5,
        //       ),
        //   ),
        child: child,
        
      ),
      
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex = 0;
//     void onTap(int index) {
//       selectedIndex = index;
//     }

//     return BottomNavigationBar(
//       onTap: onTap,
//       currentIndex: selectedIndex,
//       // backgroundColor: Colors.blue[700],
//       backgroundColor: Colors.orange[50],
//       selectedIconTheme: const IconThemeData(
//         // color: Colors.red,
//         opacity: 1.0,
//         size: 45,
//       ),
//       unselectedIconTheme:
//           const IconThemeData(color: Colors.black, opacity: 0.5, size: 25),
//       //fix page, not move
//       type: BottomNavigationBarType.fixed,

//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Trang chủ',
//           // backgroundColor: Colors.red,
//           // backgroundColor:  Color(0xff0047A1),
//         ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.event),
//         //   label: "Lịch khám",
//         //   // backgroundColor: Colors.blue,
//         // ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.calendar_month_outlined),
//           label: "Đặt hẹn",
//           // backgroundColor: Colors.blue,
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.medical_information), label: "Bệnh sử"),
//         BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "Bãi xe"),
//         BottomNavigationBarItem(icon: Icon(Icons.maps_ugc), label: "Sơ đồ"),
//       ],
//     );
//   }
// }
