import 'package:app_1/pages/home.dart';
import 'package:app_1/user/adduser.dart';
import 'package:app_1/user/login.dart';
import 'package:app_1/user/register.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// const bool ENABLE_WEBSOCKETS = false;
class GraphQLWidgetScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GraphQLWidgetScreen() : super();
  get textToSend => null;
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
    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const UserLogin(),
        routes: {
          // '/': ((context) => const UserLogin()),
          '/home': (((context) => Home(isUser: false,patient: "",))),
          '/register': ((context) => UserRegister()),
          // '/adduser': (context) =>   adduser()
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

  String text = "No Value Entered";

  get showdialog => showdialog;
//  int nRepositories = 50;
  void _setText() {
    setState(() {
      text = phoneController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title!),
          ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Query(
          options: QueryOptions(
            document: gql(r'''
                    query MyQuery{
  patient_users{
    phone_number
    fullname
    password
    birthday
    patient_id
  }
}
'''),

            // variables: {
            //   'phone_number': phoneController.text,
            // },

            // pollInterval: 10,
          ),
          builder: withGenericHandling(
            (QueryResult result, {refetch, fetchMore}) {
              // if (result.data == null && !result.hasException) {
              //   return const Text(
              //     'Loading has completed, but both data and errors are null. '
              //     'This should never be the case – please open an issue',
              //   );
              // } else {
              //   print('completed');
              // }

              // result.data can be either a [List<dynamic>] or a [Map<String, dynamic>]
              // final repositories = (result.data!['patient_users']['repositories']
              //     as List<dynamic>);

              List? repositories = result.data?['patient_users'];

              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      // color: Colors.grey[600]?.withOpacity(0.5),
                      color: Colors.grey[50],

                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Số điện thoại',
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: repositories!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            //     Container(
                            //   margin: const EdgeInsets.symmetric(vertical: 10),
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 10),
                            //   width: size.width * 0.8,
                            //   decoration: BoxDecoration(
                            //     // color: Colors.grey[600]?.withOpacity(0.5),
                            //     color: Colors.grey[50],

                            //     borderRadius: BorderRadius.circular(29),
                            //   ),
                            //   child: TextField(
                            //     controller: phoneController,
                            //     decoration: const InputDecoration(
                            //         icon: Icon(
                            //           Icons.person,
                            //           color: Colors.black,
                            //         ),
                            //         hintText: 'Số điện thoại',
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            // TextFormField(
                            //   controller: phoneController,
                            //   decoration: const InputDecoration(
                            //       // labelText: 'Number of repositories (default 50)',
                            //       ),
                            //   keyboardType: TextInputType.text,

                            //   // onSubmitted: changeQuery,
                            // ),
                            // TextFormField(
                            //   controller: passWordController,
                            //   decoration: const InputDecoration(
                            //       // labelText: 'Number of repositories (default 50)',
                            //       ),
                            //   keyboardType: TextInputType.text,
                            // ),

                            ElevatedButton(
                              onPressed: () {
                                // _sendData(result, index, context);
                                _setText();
                                if (phoneController.text ==
                                        result.data!['patient_users'][index]
                                            ['phone_number'] &&
                                    passWordController.text ==
                                        result.data!['patient_users'][index]
                                            ['password']) {
                                  // showDialog(
                                  //     builder: (context) {
                                  //       return AlertDialog(
                                  //         content: SingleChildScrollView(
                                  //             // ignore: prefer_const_literals_to_create_immutables
                                  //             child: ListBody(children: <Widget>[
                                  //           Text(result.data!['patient_users']
                                  //               [index]['phone_number']),
                                  //           Text(result.data!['patient_users']
                                  //               [index]['fullname']),
                                  //         ])),
                                  //       );
                                  //     },
                                  //     context: context);
                                  dialog(result, index, context);
                                } else {
                                  final snackBar = SnackBar(
                                    content: const Text(
                                        'Tài khoản của bạn chưa đúng'),
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

                            //call data

                            Text(result.data!['patient_users'][index]
                                ['phone_number']),
                            Text(result.data!['patient_users'][index]
                                ['password']),
                            Text(result.data!['patient_users'][index]
                                ['fullname']),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialog(
      QueryResult<Object?> result, int index, BuildContext context) {
    return showDialog(
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
                // ignore: prefer_const_literals_to_create_immutables
                child: ListBody(children: <Widget>[
              Text(result.data!['patient_users'][index]['phone_number']),
              Text(result.data!['patient_users'][index]['password']),
              // Text(result.data!['patient_users'][index]['birthday']),
              Text(result.data!['patient_users'][index]['fullname']),
            ])),
          );
        },
        context: context) as dynamic;
  }

  // void _sendData(BuildContext context, QueryResult<Object?> result, int index) {
  //   // String textToSend = phoneController.text;
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => AccountInfo(
  //             showDialogLogin: dialog(result, index, context),
  //           ),
  //         ));
  //   });
  // }
  void _sendData(result, index, BuildContext context) {
    // String textToSend = phoneController.text;
    dynamic showdialog = dialog(result, index, context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountInfo(
            showDialogLogin: showdialog,
          ),
        ));
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
