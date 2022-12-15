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
  bool isUser = false;

  @override
  Widget build(BuildContext context) {
    String phone_number;
    String fullname;
    Object patient = {};
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // automatically resizes on keyboard input
      resizeToAvoidBottomInset: false,
      body: Background(
        mainAxisAlignment: MainAxisAlignment.center,
        child: Form(
          // key: _formKey,
          child: Column(
            children: <Widget>[
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
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          // labelText: 'Họ và tên',
                          labelText: 'Số điện thoại',
                          hintText: 'Số điện thoại',
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

                      keyboardType: TextInputType.number,
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
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: 'password',
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                          ),
                          // labelText: 'Số điện thoại',
                          border: InputBorder.none,
                          hintText: 'Nhập mật khẩu'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value)) {
                          return 'Không được để trống';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  children: <Widget>[
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
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            print('Nhấn đăng nhập');
                            // GraphQLProvider.of(context)
                            //     .value
                            //     .query(QueryOptions(
                            //       document: gql('''
                            //       query MyQuery{
                            //           patient_users(where: {phone_number: {_eq: "${phonenumberController.text}"}, password: {_eq: "${passwordController.text}"}}) {
                            //             birthday
                            //             fullname
                            //             password
                            //             id
                            //             phone_number
                            //             patient {
                            //               fullname
                            //               gender
                            //               email
                            //               birthday
                            //               age
                            //               address
                            //             }
                            //           }
                            //         }
                            //       '''),
                            //     ));
                            var productsGraphQL2 = """
                              query MyQuery{
                                patient_users(where: {phone_number: {_eq: "${phonenumberController.text}"}, password: {_eq: "${passwordController.text}"}}, limit: 1) {
                                  birthday
                                  fullname
                                  password
                                  id
                                  phone_number
                                  patient {
                                    fullname
                                    gender
                                    email
                                    birthday
                                    age
                                    address
                                    created_at
                                    created_by
                                    id
                                    id_card_issue_date
                                    id_card_issue_place
                                    id_card_no
                                    medical_code
                                    note
                                    passport_no
                                    phone_number
                                    patient_infos {
                                      blood_group {
                                        name
                                      }
                                      work_unit {
                                        name
                                      }
                                      career {
                                        name
                                      }
                                      country {
                                        name
                                      }
                                      ethnic_group {
                                        name
                                      }
                                    }
                                    patient_hicards {
                                      hi_number
                                    }
                                    medical_examinations {
                                      breathing
                                      clinic {
                                        name
                                      }
                                      created_at
                                      created_by
                                      date_of_treatment
                                      date_to_reexamination
                                      diagnosis_icd
                                      examine_doctor {
                                        fullname
                                      }
                                      examine_date
                                      examine_time
                                      height
                                      high_blood_pressure
                                      id
                                      low_blood_pressure
                                      pulse
                                      preliminary_diagnosis
                                      service {
                                        name
                                      }
                                      temperature
                                      weight
                                      clinical_sign
                                      medical_examination_prescriptions {
                                        id
                                        note
                                        prescriptions {
                                          created_at
                                          created_by
                                          currency_unit {
                                            name
                                          }
                                          dates
                                          id
                                          medicine {
                                            medicine_name {
                                              name
                                            }
                                          }
                                          note
                                          medicine_using {
                                            name
                                          }
                                          number_of_times_per_day
                                          quantity
                                          quantity_evening
                                          quantity_morning
                                          quantity_night
                                          quantity_noon
                                          quantity_per_time
                                        }
                                      }
                                    }
                                    subclinical_requests {
                                      id
                                      clinic {
                                        name
                                      }
                                      created_at
                                      diagnose
                                      details
                                      note
                                      service_group {
                                        name
                                      }
                                      doctor {
                                        fullname
                                      }
                                      subclinical_request_details {
                                        service {
                                          name
                                        }
                                      }
                                      thuong_subclinical_images {
                                        conclusion
                                        describle
                                        id
                                        url
                                      }
                                      subclinical_results {
                                        describe_text
                                        describe
                                        conclusion
                                        id
                                      }
                                    }
                                  }
                                  patient_id
                                }
                              }
                            """;
                            Future<QueryResult> sendRequest() async {
                              print("sending request");
                              var client2 = GraphQLProvider.of(context).value;
                              var hello = await client2.query(QueryOptions(
                                document: gql(productsGraphQL2),
                              ));
                              return hello;
                            }

                            void calcular() {
                              setState(
                                () {
                                  print("Sending request");
                                  sendRequest().then(
                                    (value) {
                                      print(value.data!['patient_users']);

                                      if (value.data == null ||
                                          value.data!['patient_users'].length ==
                                              0) {
                                        print('không có data');
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        isUser = true;
                                        var patient =
                                            value.data!['patient_users'][0];
                                        print(isUser);
                                        phone_number =
                                            value.data!['patient_users'][0]
                                                ['phone_number'];
                                        fullname = value.data!['patient_users']
                                            [0]['fullname'];
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Home(
                                              isUser: isUser,
                                              patient: patient,
                                            ),
                                          ),
                                        );
                                        showDialog(
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
                                                child: ListBody(
                                                  children: <Widget>[
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
                                                                      right: 20,
                                                                      top: 30),
                                                              child: Stack(
                                                                children: const [
                                                                  CircleAvatar(
                                                                    minRadius:
                                                                        30,
                                                                    maxRadius:
                                                                        65,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundImage:
                                                                        AssetImage(
                                                                      'images/baby-flower.png',
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
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                              icon: const Icon(
                                                                Icons.phone,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              hintText:
                                                                  phone_number,
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                    ),
                                                    TextFormField(
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                              icon: const Icon(
                                                                Icons.person,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              hintText:
                                                                  fullname,
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          context: context,
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            }

                            calcular();
                          },
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
                                      return Home(
                                        isUser: false,
                                        patient: "",
                                      );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
