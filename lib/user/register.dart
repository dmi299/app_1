import 'package:app_1/pages/home.dart';
import 'package:app_1/user/login.dart';
import 'package:flutter/material.dart';
import 'package:app_1/user/background.dart';

// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:hasura_connect/hasura_connect.dart';

// String url = 'https://enthms-graphql.safiwis.com/v1/graphql';
// HasuraConnect hasuraConnect = HasuraConnect(url);

class UserRegister extends StatefulWidget {
  UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  String mutation = r'''
  mutation Insert_patient_users {
  insert_patient_users(objects: {
  fullname: $fullname,
   phone_number:  $phone_number,
   password: $password,
   resetpassword: $resetpassword,
   }) {
    affected_rows
  }
}
''';

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return Mutation(
    //   options: MutationOptions(
    //     document: gql(mutation),
    //     // update: (cache, result) {
    //     //   return cache;
    //     // },
    //     // onCompleted: (dynamic resultdata) {
    //     //   print(resultdata);
    //     // },
    //   ),
    //   builder: (runMutation, result) {
    return Scaffold(
      // automatically resizes on keyboard input
      resizeToAvoidBottomInset: false,
      body: Background(
        mainAxisAlignment: MainAxisAlignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo-taimuihongsg.png',
                width: 300,
                height: size.height * 0.2,
              ),
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
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'H??? v?? t??n',
                          border: InputBorder.none),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
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
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'S??? ??i???n tho???i',
                          border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
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
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon:
                              Icon(Icons.visibility, color: Colors.black),
                          hintText: 'M???t kh???u',
                          border: InputBorder.none),
                      obscureText: true, //hide password
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
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
                    child: TextField(
                      controller: resetPasswordController,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon:
                              Icon(Icons.visibility, color: Colors.black),
                          hintText: 'Nh???p l???i M???t kh???u',
                          border: InputBorder.none),
                      obscureText: true, //hide password
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),

              // TextfiledInput(
              //   icon: Icons.person,
              //   hint: 'H??? v?? t??n',
              //   inputType: TextInputType.text,
              //   inputAction: TextInputAction.done,
              // ),
              // TextfiledInput(
              //   icon: Icons.phone,
              //   hint: 'S??? ??i???n tho???i',
              //   inputType: TextInputType.number,
              //   inputAction: TextInputAction.next,
              // ),
              // const PasswordInput(
              //   icon: Icons.lock,
              //   hint: 'M???t kh???u',
              //   inputType: TextInputType.name,
              //   inputAction: TextInputAction.done,
              // ),
              // const PasswordInput(
              //   icon: Icons.lock,
              //   hint: 'Nh???p l???i m???t kh???u',
              //   inputType: TextInputType.name,
              //   inputAction: TextInputAction.done,
              // ),

              const SizedBox(height: 20),
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
                    // onPressed: () => runMutation({
                    //   'fullname': nameController.text,
                    //   'phone_number': phoneController.text,
                    //   'password': passwordController.text,
                    //   'resetpassword': resetPasswordController.text,
                    // }),

                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // content: Text(nameController.text),
                            title: const Text(
                              'B???n ???? t???o t??i kho???n th??nh c??ng',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            actions: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      backgroundColor: Colors.blue,
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const UserLogin();
                                      }));
                                    },
                                    child: const Text(
                                      '????ng nh???p ngay',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white
                                      ),
                                    )),
                              )
                            ],
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(nameController.text),
                                  Text(phoneController.text),
                                  Text(passwordController.text),
                                  Text(resetPasswordController.text),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      '????ng k??',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "B???n ???? c?? t??i kho???n ch??a ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const UserLogin();
                      }));
                    },
                    child: const Text(
                      "????ng nh???p",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "HO???C",
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
                  const SizedBox(height: 30),
                ],
              ),
              const SizedBox(height: 5),

              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        // padding: EdgeInsets.all(20),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 2,
                        //     color: Colors.white,
                        //   ),
                        //   shape: BoxShape.circle,
                        // ),

                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
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
                    "V??? trang ch???",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Text(
              //       "V??? trang ch???",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // When the user presses the button, show an alert dialog containing
      //   // the text that the user has entered into the text field.
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           // content: Text(nameController.text),
      //           title: const Text('AlertDialog Title'),
      //           content: SingleChildScrollView(
      //             child: ListBody(
      //               children: <Widget>[
      //                 Text(nameController.text),
      //                 Text(phoneController.text),
      //                 Text(passwordController.text),
      //                 Text(resetPasswordController.text),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   tooltip: 'Show me the value!',
      //   child: const Icon(Icons.text_fields),
      // ),
    );
    //  },
    // );
  }
}

/*
 class PasswordInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          // color: Colors.grey[50]?.withOpacity(0.7),
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(29),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                suffixIcon: const Icon(Icons.visibility, color: Colors.black),
                hintText: hint,
                border: InputBorder.none),
            obscureText: true, //hide password
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
*/
/*
class TextfiledInput extends StatelessWidget {
  TextfiledInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);
  final myController = TextEditingController();
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                hintText: hint,
                border: InputBorder.none),
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
*/
