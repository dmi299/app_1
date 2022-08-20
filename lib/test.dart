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
        home: UserRegister(),
        routes: {
          '/register': ((context) => UserRegister()),
          '/login': ((context) => const UserLogin())
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
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nRepositories = 50;

  void changeQuery(String number) {
    setState(() {
      nRepositories = int.parse(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hihi'),
      ),
      // body: Container(
      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   mainAxisSize: MainAxisSize.max,
      //   children: <Widget>[
      // TextField(
      //   decoration: const InputDecoration(
      //     labelText: 'Number of repositories (default 50)',
      //   ),
      //   keyboardType: TextInputType.number,
      //   onSubmitted: changeQuery,
      // ),

      body: Query(
          options: QueryOptions(
            document: gql(r'''
                    query MyQuery{
                    patient_users {
                    fullname
                    phone_number
                    
                    }
                  }
                '''),
            // variables: {
            //   'nRepositories': nRepositories,
            // },
            // pollInterval: const Duration(seconds: 2000)
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            // if (result.data == null && !result.hasException) {
            //   return const Text(
            //     'Loading has completed, but both data and errors are null. '
            //     'This should never be the case – please open an issue',
            //   );
            // }

            // if (result.hasException) {
            //   return Text(result.exception.toString());
            // }

            List? repositories = result.data?['patient_users'];
            if (repositories == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // final repositories =
            //     (result.data![' patient_users'] as List<dynamic>);

            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(result.data!['patient_users'][index]['fullname']),
                  subtitle: Text(
                      result.data!['patient_users'][index]['phone_number']),
                  // Text(
                  //     result.data!['patient_users'][index]['password']),
                  // Text(result.data!['patient_users'][index]
                  //     ['resetpassword']),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddUser()
                  // return const AddUser();
                  ));
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
      //     ],
      //   ),
      // ),
    );
  }
}

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Mutation(
              options: MutationOptions(
                document: gql(r'''
                    mutation MyMutation ($fullname: String!, $phone_number: String!, $password: String!, $resetpassword: String!) {
                      insert_patient_users(objects: {fullname: $fullname,phone_number: $phone_number, password: $password, resetpassword:$resetpassword}) {
                        
                    affected_rows
                  }
                }
'''
                    .replaceAll('\n', '')),
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
                      TextField(
                        decoration:
                            const InputDecoration(helperText: "Enter name"),
                        controller: fullnameController,
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      TextField(
                        decoration:
                            const InputDecoration(helperText: "Enter phone"),
                        controller: phoneController,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(helperText: "Enter mật khẩu"),
                        controller: passwordController,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(helperText: "Nhập lại mk"),
                        controller: resetPasswordController,
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () => runMutation({
                          'fullname': fullnameController.text,
                          'phone_number': phoneController.text,
                          'password': passwordController.text,
                          'resetpassword': resetPasswordController.text,
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
                          "Add User",
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
    } else if (result.data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return builder(result, fetchMore: fetchMore, refetch: refetch);
  };
}
