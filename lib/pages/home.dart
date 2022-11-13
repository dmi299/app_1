import 'package:app_1/pages/apointment.dart';
import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/medical_history.dart';
import 'package:app_1/pages/parking.dart';
import 'package:app_1/test.dart';
import 'package:app_1/user/login.dart';
import 'package:app_1/user/register.dart';

import 'package:flutter/material.dart';
import 'package:app_1/pages/map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// This is the type used by the popup menu below.
enum Menu { itemOne, itemTwo }

class Home extends StatefulWidget {
  bool isUser = false;
  var patient;
  Home({Key? key, required this.isUser, required this.patient})
      : super(key: key);

  @override
  State<Home> createState() =>
      _HomeState(isUser: isUser, patient: patient);
}

class _HomeState extends State<Home> {
  bool isUser = false;
  var patient;
  _HomeState({Key? key, required this.isUser, required this.patient});
  Widget page = const Body();
  int _selectedIndex = 0;

  void onTap(int index) async {
    print('isUser: ${isUser}; patient: ${patient}');
    if ((isUser == false || patient == "") && index > 0 && index < 4) {
      final snackBar = SnackBar(
        content: const Text('Đăng nhập để xem các mục này'),
        action: SnackBarAction(
          label: 'Thoát',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(
        () {
          _selectedIndex = index;
          if (index == 0) {
            page = const Body();
          } else if (index == 1) {
            page = const Apoitment();
          } else if (index == 2) {
            page = MedicalHistory(
              patient: patient,
            );
          } else if (index == 3) {
            page = const Parking();
          } else if (index == 4) {
            page = const Map();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: page,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[700],
        child: const Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
      ),

      //bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _selectedIndex,
        // backgroundColor: Colors.blue[700],
        backgroundColor: Colors.orange[50],
        selectedIconTheme: const IconThemeData(
          // color: Colors.red,
          opacity: 1.0,
          size: 45,
        ),
        unselectedIconTheme:
            const IconThemeData(color: Colors.black, opacity: 0.5, size: 25),
        //fix page, not move
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
            // backgroundColor: Colors.red,
            // backgroundColor:  Color(0xff0047A1),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.event),
          //   label: "Lịch khám",
          //   // backgroundColor: Colors.blue,
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Đặt hẹn",
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_information), label: "Bệnh sử"),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "Bãi xe"),
          BottomNavigationBarItem(icon: Icon(Icons.maps_ugc), label: "Sơ đồ"),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.blue[900],
      // backgroundColor: Colors.white,
      backgroundColor: Colors.orange[50],
      title: Image.asset('images/logo-taimuihongsg.png'),
      toolbarHeight: 80,
      // centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () => {},
        icon: const Icon(
          Icons.menu,
          color: Colors.blue,
          // size: 50,
        ),
      ),
      actions: <Widget>[
        // This button presents popup menu items.
        PopupMenuButton<Menu>(
            icon: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            // Callback that sets the selected popup menu item.
            onSelected: (Menu item) {
              switch (item) {
                case Menu.itemOne:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const GraphQLWidgetScreen()),
                  );
                  break;
                case Menu.itemTwo:
                  Navigator.of(context).push(
                    MaterialPageRoute<GraphQLWidgetScreen>(
                      builder: (BuildContext context) => UserRegister(),
                    ),
                  );
                  break;
              }
              setState(() {});
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  const PopupMenuItem(
                    value: Menu.itemOne,
                    child: Text("Đăng nhập"),
                  ),
                  const PopupMenuItem(
                    value: Menu.itemTwo,
                    child: Text("Đăng kí"),
                  ),
                ]),
      ],
    );
  }
}
