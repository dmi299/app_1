import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/loading.dart';
import 'package:app_1/test.dart';
import 'package:app_1/user/adduser.dart';
import 'package:app_1/user/login.dart';
import 'package:app_1/user/register.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/home.dart';
// import 'test.dart' show GraphQLWidgetScreen;
//import
// import 'package:hasura_connect/hasura_connect.dart';
// String url = 'https://enthms-graphql.safiwis.com/v1/graphql';
// HasuraConnect hasuraConnect = HasuraConnect(url);

// import 'package:graphql_flutter/graphql_flutter.dart';
void main() => runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false, //remove debug mode on appbar
      // initialRoute: '/loading',
      routes: {
        '/': (context) =>  const GraphQLWidgetScreen(),
        '/home': (context) => const Home(),
        '/body': (context) => const Body(),
      },
    ));

// const bool ENABLE_WEBSOCKETS = false;

// class GraphQLWidgetScreen extends StatelessWidget {
//   const GraphQLWidgetScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final HttpLink httpLink =
//         HttpLink('https://enthms-graphql.safiwis.com/v1/graphql');

//     final authLink = AuthLink(
//       // ignore: undefined_identifier
//       getToken: () async => 'Bearer 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',
//     );

//     var link = authLink.concat(httpLink);

//     if (ENABLE_WEBSOCKETS) {
//       final websocketLink = WebSocketLink('ws://localhost:8080/ws/graphql');

//       link = Link.split(
//         (request) => request.isSubscription,
//         websocketLink,
//         link,
//       );
//     }

//     final ValueNotifier<GraphQLClient> client = ValueNotifier(
//       GraphQLClient(
//         link: httpLink,
//         cache: GraphQLCache(),
//       ),
//     );
//     return GraphQLProvider(
//       client: client,
//       child: const CacheProvider(
//         child: MaterialApp(),
//       ),
//     );
//   }
// }



















































// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Home.Dat'),
//           centerTitle: true,
//           backgroundColor: Colors.blue,
          
//         ),
//         body: const Center(
//           child: Icon(
//             Icons.home,
//             color: Colors.lightBlue,
//             size: 50.0
//           ),
//           // child: Image(
//           // image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png'),
//           // ),
//           // child: Text('Hello Mi',
//           // style: TextStyle(
//           //   fontSize: 20.0,
//           //   fontWeight: FontWeight.bold,
//           //   letterSpacing: 2.0,
//           //   color: Colors.grey,
          
//           // ),
//           // )
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           backgroundColor: Colors.blue[600],
//           child: const Text('click'),
//         ),
//       );
//   }
// }






// //tạo 1 stateless widget với tên MyApp, có thể chọn bất cứ tên nào cho widget
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override //là 1 decorator đuọc cung cấp bởi material package.
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
