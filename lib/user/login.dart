import 'package:app_1/pages/home.dart';
import 'package:app_1/user/adduser.dart';
import 'package:app_1/user/background.dart';
import 'package:app_1/user/register.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../test.dart';
class UserLogin extends StatefulWidget {
  const UserLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // automatically resizes on keyboard input
      resizeToAvoidBottomInset: false,
      body: Background(
        mainAxisAlignment: MainAxisAlignment.center,
        child: Query(
            options: QueryOptions(
              document: gql(r'''
                    query MyQuery ($id: uuid!){
  patients(where: {id: {_eq: $id}}) {
    id
    phone_number,
  }
}
                '''),
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              // List? repositories = result.data?['patient_users'];
              // if (repositories != null) {
              //   return const Center(child: CircularProgressIndicator());
              // } else if (result.isLoading) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              return ListView.builder(
                  // itemCount: repositories.length,
                  itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    //logo
                    Image.asset(
                      'images/logo-taimuihongsg.png',
                      width: 300,
                      height: size.height * 0.3,
                    ),

                    //textfield -> phone number
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
                        controller: phonenumberController,
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

                    //textfield -> password
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        // color: Colors.grey[600]?.withOpacity(0.5),
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon:
                                Icon(Icons.visibility, color: Colors.black),
                            hintText: 'Mật khẩu',
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 25),

                    //login button
                    SizedBox(
                      width: size.width * 0.8,
                      // height: size.height * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            
                              showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: ListBody(children: <Widget>[
                                        Text(result.data!['patients'][index]
                                            ['phone_number']),
                                        // Text(result.data!['patients'][index]
                                        //     ['password']),
                                        // Text(phonenumberController.text),
                                        // Text(passwordController.text),
                                      ])),
                                    );
                                  },
                                  context: context);
                           
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const adduser();
                              }));
                            },
                          
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Bạn đã có tài khoản chưa ?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<GraphQLWidgetScreen>(
                                builder: (BuildContext context) =>
                                     UserRegister(),
                              ),
                            );
                          },
                          child: const Text(
                            "Đăng kí",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "HOẶC",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      // indent: 20,
                      // endIndent: 0,
                      color: Colors.grey[200],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          height: 40,
                          width: 40,
                          child: Image.asset('images/facebook.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          height: 40,
                          width: 40,
                          child: Image.asset('images/google.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          height: 40,
                          width: 40,
                          child: Image.asset('images/twitter.png'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const Home();
                                    }));
                                  },
                                  child: Image.asset(
                                    'images/home.png',
                                    height: 40,
                                    width: 40,
                                  )),
                            ),
                            Image.asset(
                              'images/fast-backward.png',
                              height: 25,
                              width: 25,
                            )
                          ],
                        ),
                        const Text(
                          "Về trang chủ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              });
            }),
      ),
    );
  }
}

// class RoundedInputField extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final ValueChanged<String> onChanged;
//   const RoundedInputField({
//     Key? key,
//     required this.text,
//     required this.icon,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: onChanged,
//       decoration: InputDecoration(
//           icon: Icon(
//             icon,
//             color: Colors.black,
//           ),
//           hintText: text,
//           border: InputBorder.none),
//     );
//   }
// }
