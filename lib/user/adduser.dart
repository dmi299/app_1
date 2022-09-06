import 'package:app_1/pages/apointment.dart';
import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/medical_history.dart';
import 'package:app_1/pages/parking.dart';
import 'package:app_1/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// This is the type used by the popup menu below.
// class MyHomePage extends StatefulWidget {
//   final String showdialog;
//   const MyHomePage({
//     Key? key,
//     this.title,
//     required this.showdialog
//   }) : super(key: key);

//   final String? title;

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController phoneController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();
//   // int nRepositories = 50;

//   // void changeQuery(String number) {
//   //   setState(() {
//   //     nRepositories = int.parse(number);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('hihi'),
//       ),
//       body: Query(
//           options: QueryOptions(
//             document: gql(r'''
//                    query MyQuery($phone_number: String!, $password: String! ) {
//   patient_users(where: {phone_number: {_eq: $phone_number}, password: {_eq:  $password}}) {

//     phone_number
//     password
//     id
//   }
// }

//                 '''),
//           ),
//           builder: (QueryResult result,
//               {VoidCallback? refetch, FetchMore? fetchMore}) {
//             // List? repositories = result.data?['patient_users'];
//             // if (repositories == null) {
//             //   return const Center(child: CircularProgressIndicator());
//             // } else if (result.isLoading) {
//             //   return const Center(
//             //     child: CircularProgressIndicator(),
//             //   );
//             // }

//             return ListView.builder(
//               // itemCount: repositories.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Center(
//                     child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       controller: phoneController,
//                       decoration: const InputDecoration(
//                           icon: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.black,
//                             ),
//                           ),
//                           // labelText: 'Họ và tên',
//                           hintText: 'phone',
//                           border: InputBorder.none),
//                     ),
//                     TextFormField(
//                       controller: passwordController,
//                       decoration: const InputDecoration(
//                           icon: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.black,
//                             ),
//                           ),
//                           // labelText: 'Họ và tên',
//                           hintText: 'password',
//                           border: InputBorder.none),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // if (result.data != null ||
//                         //     result.data!['patient_users'][index]
//                         //                 ['phone_number'] ==
//                         //             phoneController.text &&
//                         //         result.data!['patient_users'][index]
//                         //                 ['password'] ==
//                         //             passwordController.text) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const adduser(),
//                           ),
//                         );
//                         // } else {
//                         // showDialog(
//                         //     builder: (context) {
//                         //       return AlertDialog(
//                         //         content: SingleChildScrollView(
//                         //             // ignore: prefer_const_literals_to_create_immutables
//                         //             child: ListBody(children: <Widget>[
//                         //           // Text(result.data!['patient_users'][index]
//                         //           //     ['phone_number']),
//                         //           // Text(result.data!['patient_users'][index]
//                         //           //     ['password']),
//                         //           Text(phoneController.text),
//                         //            Text(passwordController.text),

//                         //         ])),
//                         //       );
//                         //     },
//                         //     context: context);
//                       },
//                       //},
//                       child: const Text('here'),
//                     ),
//                   ],
//                 ));
//               },
//             );
//           }),
//     );
//   }
// }

enum Menu { itemOne, itemTwo }

class adduser extends StatefulWidget {
  const adduser({
    Key? key,
  }) : super(key: key);

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  int _selectedIndex = 0;
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List pages = [
    const Body(),
    const Apoitment(),
    const MedicalHistory(),
    const Parking(),
    const Map()
  ];
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: pages[_selectedIndex],

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

      // actions: <Widget>[
      //   IconButton(
      //     onPressed: () => {
      //       // Navigator.pushNamed(context, '/location');
      //     },
      //     icon: const Icon(Icons.person),
      //     color: Colors.blue,
      //     // iconSize: 35.0,
      //     // label: const Text('Đăng xuất'),
      //   ),
      // ],
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
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => const AccountInfo(
                  //             showdialog: '',
                  //           )),
                  // );
                  showDialog(
                      builder: (context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                              // ignore: prefer_const_literals_to_create_immutables
                              child: ListBody(children: <Widget>[
                            // Text(result.data!['patient_users'][index]
                            //     ['phone_number']),
                            // Text(result.data!['patient_users'][index]
                            //     ['password']),
                            Text(phoneController.text),

                            Text(passwordController.text),
                          ])),
                        );
                      },
                      context: context);
                  break;
                case Menu.itemTwo:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const GraphQLWidgetScreen()),
                  );
                  break;
              }
              setState(() {});
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  const PopupMenuItem(
                    value: Menu.itemOne,
                    child: Text(
                      'Thông tin tài khoản',
                    ),
                  ),
                  const PopupMenuItem(
                    value: Menu.itemTwo,
                    child: Text("Đăng xuất"),
                  ),
                ]),
      ],
    );
  }
}

class AccountInfo extends StatelessWidget {
  Future<dynamic> showDialogLogin ;
  
  AccountInfo({Key? key, required this.showDialogLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second screen')),
      body: Center(
        
        child: ElevatedButton(
          
          child: const Text(
            'here',
            
            ),
          
          onPressed:
          () {
            
            showDialog(
                context: context,
                builder: (context) { 
                  return const AlertDialog(
                    content: SingleChildScrollView(
                          
                    ),
                  );
                });
          },
        ),

        // child: Text(
        //   showdialog,
        //   style: TextStyle(fontSize: 24),
        // ),
      ),
    );
  }
}
