import 'package:app_1/pages/home.dart';
import 'package:app_1/user/login.dart';
import 'package:app_1/user/register.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// const bool ENABLE_WEBSOCKETS = false;

class GraphQLWidgetScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GraphQLWidgetScreen() : super();

  @override
  Widget build(BuildContext context) {
    final httpLink = HttpLink('https://enthms-graphql.safiwis.com/v1/graphql',
        defaultHeaders: {
          'X-Hasura-Admin-Secret': 'Admin@hmssecret123',
        });
    final authLink = AuthLink(
      // ignore: undefined_identifier
      getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',

      // 'Bearer mmMAHGD13s5FVrfVrL09cuq88W64E5sz4gXNeC477ZOfl6s44VMhfs5q2vaZfKXB',
    );

    var link = authLink.concat(httpLink);

    // if (ENABLE_WEBSOCKETS) {
    //   final websocketLink =
    //       WebSocketLink('ws://classic-pig-88.hasura.app/v1/graphql');

    //   link = Link.split(
    //     (request) => request.isSubscription,
    //     websocketLink,
    //     link,
    //   );
    // }

    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );

    // return GraphQLProvider(
    //   client: client,
    //   child: const CacheProvider(
    //     child: MyHomePage(),
    //   ),
    // );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
        routes: {
          '/register': ((context) => UserRegister()),
          '/login': ((context) => const UserLogin()),
          '/home': (context) => const Home()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phoneController = TextEditingController();
   TextEditingController passWordController = TextEditingController();
//  int nRepositories = 50;

//   void changeQuery(String number) {
//     setState(() {
//       nRepositories = int.parse(number);
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title!),
          ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // TextField(
            //   controller: phoneController,
            //   decoration: const InputDecoration(
            //       // labelText: 'Number of repositories (default 50)',
            //       ),
            //   keyboardType: TextInputType.text,
            //   // onSubmitted: changeQuery,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     print('completed');

            //     if(phoneController.text == ){
            //     showDialog(
            //         builder: (context) {
            //           return AlertDialog(
            //             content: SingleChildScrollView(
            //                 // ignore: prefer_const_literals_to_create_immutables
            //                 child: ListBody(children: <Widget>[
            //               Text(phoneController.text)
            //               // Text(result.data!['patients'][index]
            //               //     ['password']),
            //               // Text(phonenumberController.text),
            //               // Text(passwordController.text),
            //             ])),
            //           );
            //         },
            //         context: context);}
            //   },
            //   child: const Text('Đăng nhập ngay'),
            // ),
            Query(
              options: QueryOptions(
                document: gql(r'''
  query MyQuery {
  patient_users{
    fullname
    phone_number
    password
    
    
  }
}
'''),

                // variables: {
                //   'nRepositories': nRepositories,
                // },
                //pollInterval: 10,
              ),
              builder: withGenericHandling(
                (QueryResult result, {refetch, fetchMore}) {
                  if (result.data == null && !result.hasException) {
                    return const Text(
                      'Loading has completed, but both data and errors are null. '
                      'This should never be the case – please open an issue',
                    );
                  } else {
                    print('completed');
                  }

                  // result.data can be either a [List<dynamic>] or a [Map<String, dynamic>]
                  // final repositories = (result.data!['patient_users']['repositories']
                  //     as List<dynamic>);
                  List? repositories = result.data?['patient_users'];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: repositories!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListBody(
                          children: [
                            Form(
                              child: TextField(
                                controller: phoneController,
                              
                                decoration: const InputDecoration(
                                    // labelText: 'Number of repositories (default 50)',
                                    ),
                                keyboardType: TextInputType.text,
                                // onSubmitted: changeQuery,
                              ),
                            ),
                            TextField(
                              controller: passWordController,
                              decoration: const InputDecoration(
                                  // labelText: 'Number of repositories (default 50)',
                                  ),
                              keyboardType: TextInputType.text,
                              // onSubmitted: changeQuery,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (phoneController.text ==
                                    result.data!['patient_users'][index]
                                        ['phone_number'] && passWordController.text ==result.data!['patient_users'][index]['password']) {
                                  showDialog(
                                      builder: (context) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              child:
                                                  ListBody(children: <Widget>[
                                            Text(result.data!['patient_users']
                                                [index]['phone_number']),
                                            Text(result.data!['patient_users']
                                                [index]['fullname']),
                                            // Text(phonenumberController.text),
                                            // Text(passwordController.text),
                                          ])
                                          ),
                                        );
                                      },
                                      context: context);
                                } else {
                                  final snackBar = SnackBar(
                                    content: const Text('Tài khoản của bạn chưa đúng'),
                                    action: SnackBarAction(
                                      label: 'Thoát',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: const Text('Đăng nhập ngay'),
                            ),

                            // Text(result.data!['patient_users'][index]
                            //     ['fullname']),
                            // Text(result.data!['patient_users'][index]
                            //     ['patient_id']),
                            Text(result.data!['patient_users'][index]
                                ['phone_number']),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

QueryBuilder withGenericHandling(QueryBuilder builder) {
  return (result, {fetchMore, refetch}) {
    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return builder(result, fetchMore: fetchMore, refetch: refetch);
  };
}

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // final resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Mutation(
                options: MutationOptions(
                  document: gql(r'''
                      query MyQuery($phone_number: String!, $password: String! ) {
          patient_users(where: {phone_number: {_eq: $phone_number}, password: {_eq:  $password}}) {

            phone_number
            password
            id
          }
        }

                  '''),
                  // update: (GraphQLDataProxy cache, QueryResult? result) {
                  //   return cache;
                  // },
                  onCompleted: (dynamic resultdata) {
                    Navigator.pop(context);
                  },
                ),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(15)),
                        const Padding(padding: EdgeInsets.all(15)),
                        TextField(
                          decoration:
                              const InputDecoration(helperText: "Enter phone"),
                          controller: phoneController,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              helperText: "Enter mật khẩu"),
                          controller: passwordController,
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () => runMutation({
                            'phone_number': phoneController.text,
                            'password': passwordController.text,
                          }),
                          // onPressed: () {
                          //   runMutation({
                          //     'fullname': "Mi",
                          //     'phone_number': "0876",
                          //     'password': "trr",
                          //     'resetpassword': "trr",
                          //   });
                          // },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// QueryBuilder withGenericHandling(QueryBuilder builder) {
//   return (result, {fetchMore, refetch}) {
//     if (result.hasException) {
//       return Text(result.exception.toString());
//     }

//     if (result.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (result.data == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return builder(result, fetchMore: fetchMore, refetch: refetch);
//   };
// }
