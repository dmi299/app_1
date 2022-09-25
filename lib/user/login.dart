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
    query MyQuery ($phone_number: String!){
  patient_users(where: {phone_number: {_eq: $phone_number}}){
    phone_number
    fullname
    password
    birthday
    patient_id
  }
}
                '''),
              variables: {
                'phone_number': '0766651677',
              },
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              List? repositories = result.data?['patient_users'];
              if (result.data == null && !result.hasException) {
                return const Text(
                  'Loading has completed, but both data and errors are null. '
                  'This should never be the case – please open an issue',
                );
              } else {
                print('completed');
              }
              return Form(
                  // key: _formKey,
                  child: Column(children: <Widget>[
                Image.asset(
                  'images/logo-taimuihongsg.png',
                  width: 300,
                  height: size.height * 0.3,
                ),

                // ................................Textfield name.............................................//
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      // color: Colors.grey[50]?.withOpacity(0.5),
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: phonenumberController,
                        decoration: const InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            // labelText: 'Họ và tên',
                            hintText: 'Họ và tên',
                            border: InputBorder.none),

                        // autofocus: false,

                        // validator: (value) {
                        //   if (value!.isEmpty ||
                        //       !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                        //     return 'Không được để trống';
                        //   } else {
                        //     return null;
                        //   }
                        // },

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Không được để trống';
                          } else {
                            return null;
                          }
                        },

                        keyboardType: TextInputType.text,
                        // onSaved: (value) {
                        //   nameController.text = value!;
                        // },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                ),
                // ................................Textfield password.............................................//
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      // color: Colors.grey[50]?.withOpacity(0.5),
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                            // labelText: 'Số điện thoại',
                            border: InputBorder.none,
                            hintText: 'Nhập số điện thoại'),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                  .hasMatch(value)) {
                            return 'Không được để trống';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: repositories!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            //logo
                            // Image.asset(
                            //   'images/logo-taimuihongsg.png',
                            //   width: 300,
                            //   height: size.height * 0.3,
                            // ),

                            //textfield -> phone number
                            // Container(
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
                            //     controller: phonenumberController,
                            //     decoration: const InputDecoration(
                            //         icon: Icon(
                            //           Icons.person,
                            //           color: Colors.black,
                            //         ),
                            //         hintText: 'Số điện thoại',
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                            // const SizedBox(height: 10),

                            //textfield -> password
                            // Container(
                            //   margin: const EdgeInsets.symmetric(vertical: 5),
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 10),
                            //   width: size.width * 0.8,
                            //   decoration: BoxDecoration(
                            //     // color: Colors.grey[600]?.withOpacity(0.5),
                            //     color: Colors.grey[50],
                            //     borderRadius: BorderRadius.circular(29),
                            //   ),
                            //   child: TextField(
                            //     controller: passwordController,
                            //     obscureText: true,
                            //     decoration: const InputDecoration(
                            //         icon: Icon(
                            //           Icons.lock,
                            //           color: Colors.black,
                            //         ),
                            //         suffixIcon:
                            //             Icon(Icons.visibility, color: Colors.black),
                            //         hintText: 'Mật khẩu',
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                            // const SizedBox(height: 25),

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
                                    if (phonenumberController.text ==
                                            result.data!['patient_users'][index]
                                                ['phone_number'] &&
                                        passwordController.text ==
                                            result.data!['patient_users'][index]
                                                ['password']) {
                                      final showdialog = showDialog(
                                          builder: (context) {
                                            return AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0))),
                                              // backgroundColor: Colors.white,
                                              content: SingleChildScrollView(
                                                  child: ListBody(children: <
                                                      Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    // SizedBox(
                                                    //   height: ,
                                                    // )
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        const Icon(
                                                          Icons.arrow_back,
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 30),
                                                          child: Stack(
                                                            children: const [
                                                              CircleAvatar(
                                                                minRadius: 30,
                                                                maxRadius: 65,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                  'images/account_logo.jpg',
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          icon: Icon(
                                                            Icons.phone,
                                                            color: Colors.black,
                                                          ),
                                                          hintText:
                                                              'Số điện thoại',
                                                          border:
                                                              InputBorder.none),
                                                ),
                                                TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            icon: Icon(
                                                              Icons.person,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            hintText:
                                                                'Tên người dùng',
                                                            border: InputBorder
                                                                .none)),
                                                Text(
                                                  result.data!['patient_users']
                                                      [index]['phone_number'],
                                                ),
                                                Text(result
                                                        .data!['patient_users']
                                                    [index]['fullname']),
                                              ])),
                                            );
                                          },
                                          context: context);
                                      // Column(
                                      //   children: <Widget>[
                                      //     // SizedBox(
                                      //     //   height: ,
                                      //     // )
                                      //     Row(
                                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: <Widget>[
                                      //         const Icon(
                                      //           Icons.arrow_back,

                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(top: 30),
                                      //           child: Stack(
                                      //             children: const [
                                      //               CircleAvatar(
                                      //                 radius: 30,
                                      //                 backgroundImage: AssetImage('assets/images/logo.png'),
                                      //                 )
                                      //             ],
                                      //           ),
                                      //         )
                                      //       ],
                                      //     )
                                      //   ],
                                      // );

                                    Navigator.pushNamed(context, '/home');
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
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
                      }),
                )
              ]));
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
