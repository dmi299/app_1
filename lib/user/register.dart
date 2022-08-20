import 'package:app_1/pages/home.dart';
import 'package:app_1/user/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_1/user/background.dart';

// import 'package:app_1/graphql_bloc/main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserRegister extends StatefulWidget {
  UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController resetPasswordController = TextEditingController();

  // TextEditingController birthdayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // automatically resizes on keyboard input
      resizeToAvoidBottomInset: false,
      body: Background(
        mainAxisAlignment: MainAxisAlignment.center,
        child: SingleChildScrollView(
          child: Mutation(
            options: MutationOptions(
              document: gql(r'''
                    mutation MyMutation ($fullname: String!, $phone_number: String!, $password: String!, $resetpassword: String!) {
                      insert_patient_users(objects: {fullname: $fullname,phone_number: $phone_number, password: $password, resetpassword:$resetpassword}) {
                        
                    affected_rows
                  }
                }
'''
                  .replaceAll('\n', '')),
              onCompleted: (result) {
                print('onCompleted called');
              },
              // ignore: void_checks
              update: (cache, result) {
                return cache;
              },
            ),
            builder: (RunMutation runMutation, QueryResult? result) {
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/logo-taimuihongsg.png',
                      width: 300,
                      height: size.height * 0.2,
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
                            controller: nameController,
                            decoration: const InputDecoration(
                                icon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                    // ................................Textfield phone.............................................//
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
                            controller: phoneController,
                            decoration: const InputDecoration(
                                icon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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

                    // ................................Textfield birthday.............................................//

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Container(
                    //     height: size.height * 0.08,
                    //     width: size.width * 0.8,
                    //     decoration: BoxDecoration(
                    //       // color: Colors.grey[50]?.withOpacity(0.5),
                    //       color: Colors.grey[50],
                    //       borderRadius: BorderRadius.circular(29),
                    //     ),
                    //     child: Center(
                    //       child: TextField(
                    //         controller: birthdayController,
                    //         decoration: const InputDecoration(
                    //             icon: Padding(
                    //               padding: EdgeInsets.symmetric(horizontal: 20.0),
                    //               child: Icon(
                    //                 Icons.calendar_today,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //             hintText: 'Ngày tháng năm sinh',
                    //             border: InputBorder.none),
                    //         keyboardType: TextInputType.datetime,

                    //         // textInputAction: TextInputAction.done,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText:
                              _obscureText, //This will obscure text dynamically
                          decoration: InputDecoration(
                            icon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            // labelText: 'Mật khẩu',
                            hintText: 'Mật Khẩu',
                            border: InputBorder.none,
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            // add your custom validation here.
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập mật khẩu';
                            }
                            if (value.length < 6) {
                              return 'Mật khẩu quá ngắn';
                            }
                            return null;
                          },
                        )),
                      ),
                    ),
                    // ................................Textfield resetpassword.............................................//
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
                          keyboardType: TextInputType.text,
                          controller: resetPasswordController,
                          obscureText:
                              _obscureText, //This will obscure text dynamically
                          decoration: InputDecoration(
                            icon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            // labelText: 'Nhâp lại mật khẩu',
                            hintText: 'Nhâp lại mật khẩu',
                            border: InputBorder.none,
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            // add your custom validation here.
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập mật khẩu';
                            }
                            if (value != passwordController.text) {
                              return 'Mật khẩu không khớp';
                            }
                            return null;
                          },
                        )),
                      ),
                    ),

                    // TextfiledInput(
                    //   icon: Icons.person,
                    //   hint: 'Họ và tên',
                    //   inputType: TextInputType.text,
                    //   inputAction: TextInputAction.done,
                    // ),
                    // TextfiledInput(
                    //   icon: Icons.phone,
                    //   hint: 'Số điện thoại',
                    //   inputType: TextInputType.number,
                    //   inputAction: TextInputAction.next,
                    // ),
                    // const PasswordInput(
                    //   icon: Icons.lock,
                    //   hint: 'Mật khẩu',
                    //   inputType: TextInputType.name,
                    //   inputAction: TextInputAction.done,
                    // ),
                    // const PasswordInput(
                    //   icon: Icons.lock,
                    //   hint: 'Nhập lại mật khẩu',
                    //   inputType: TextInputType.name,
                    //   inputAction: TextInputAction.done,
                    // ),

                    // ................................Button sign up.............................................//
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
                          //button
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //check if form data are valid,
                              //your process task ahead if all data are valid
                              final showdialog = showCupertinoDialog(//showdialog
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog( //alertdialog
                                    // backgroundColor: Colors.amber[100],
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          const Text(
                                              'Bạn đã đăng kí tài khoản thành công ',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold
                                              ),
                                              ),
                                          //icon
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            // padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 4,
                                                color: Colors.redAccent,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            height: 60,
                                            width: 60,
                                            child: Image.asset(
                                                'images/register_success.png'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              runMutation({
                                                'fullname': nameController.text,
                                                'phone_number':
                                                    phoneController.text,
                                                'password':
                                                    passwordController.text,
                                                'resetpassword':
                                                    resetPasswordController
                                                        .text,
                                              });
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UserLogin(),
                                                ),
                                              );
                                            },
                                            child: const Text('Đăng nhập ngay'),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              // _scaffoldKey.currentState!.showSnackBar(dialog);
                            }
                          },
                          //----------
                          child: const Text(
                            'Đăng kí',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const UserLogin();
                            }));
                          },
                          child: const Text(
                            "Đăng nhập",
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                          "Về trang chủ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
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
