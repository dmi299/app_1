
import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/controller/HomeController.dart';
import 'package:app_1/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';
import 'package:app_1/components/Delay.dart';
import 'package:app_1/components/MedicalHistory/InfoType/SummaryThreeYear.dart';
import 'package:app_1/components/MedicalHistory/InfoType/PatientInfo.dart';
import 'package:app_1/components/MedicalHistory/InfoType/ExaminationInfo.dart';
import 'package:app_1/components/MedicalHistory/InfoType/SubclinicalInfo.dart';
import 'package:app_1/components/MedicalHistory/InfoType/DICOMInfo.dart';
import 'package:app_1/components/MedicalHistory/ExpansionPanelListMedicalHistory.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/state_manager.dart';
import '../test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app_1/pages/controller/HomeController.dart';

String medicalHistoryType = "BN";

class MedicalHistory extends StatefulWidget {
  var patient;
  MedicalHistory({Key? key, required this.patient}) : super(key: key);
  @override
  State<MedicalHistory> createState() => _MedicalHistoryState(patient: patient);
}

class _MedicalHistoryState extends State<MedicalHistory> {
  var patient;
  _MedicalHistoryState({Key? key, required this.patient});
  String a = "";
  var data_interface = null;
  var subclinicalsCreateAts = [];
  var interface = null;
  secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    super.initState();
    secureScreen();
  }

  @override
  void dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  // bool isTap = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print('data patient medical history: $patient');
    // fetchFirstData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bệnh sử'),
      ),
      drawer: drawerExpandMedicalHistory(context, patient),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (medicalHistoryType == 'BN') ...[
              PatientInfo(patient: patient),
            ] else if (medicalHistoryType == 'KB') ...[
              ExaminationInfo(data_interface: data_interface)
            ] else if (medicalHistoryType == 'XN') ...[
              SubclinicalInfo(
                  SubType: medicalHistoryType, data_interface: data_interface)
            ] else if (medicalHistoryType == 'SumCLS') ...[
              SummaryThreeYear(
                  SubType: medicalHistoryType,
                  patient: patient,
                  subclinicalsCreateAts: subclinicalsCreateAts)
            ] else if (medicalHistoryType == 'SumXN') ...[
              SummaryThreeYear(
                  SubType: medicalHistoryType,
                  patient: patient,
                  subclinicalsCreateAts: subclinicalsCreateAts)
            ] else if (medicalHistoryType == 'ECG') ...[
              SubclinicalInfo(
                  SubType: medicalHistoryType, data_interface: data_interface),
            ] else if (medicalHistoryType == 'DICOM') ...[
              DICOMInfo(
                data_interface: data_interface,
              ),
            ]
          ],
        ),
      ),
    );
  }

  Drawer drawerExpandMedicalHistory(BuildContext context, var patient) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Thông tin bệnh nhân'),
              onTap: () {
                print('Tab "Thông tin bệnh nhân"');
                setState(() {
                  medicalHistoryType = "BN";
                });
                Navigator.pop(context);
              },
            ),
            listTileSummaries(patient),
            listTileExaminations(patient),
            listTileSubclinicals(patient),
          ],
        ),
      ),
    );
  }

  ListTile listTileSummaries(patient) {
    return ListTile(
      leading: Icon(Icons.summarize),
      title: ExpansionTile(
        // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
        title: const Text(
          'Tóm tắt bệnh sử',
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        children: [
          Builder(
            builder: (context) {
              Size size = MediaQuery.of(context).size;
              return SafeArea(
                child: Column(
                  children: [
                    listTileSummaryName(patient, size, context),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container listTileSummaryName(patient, Size size, BuildContext context) {
    return Container(
      width: size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          ListTile(
            title: Text('Tóm tắt CLS'),
            onTap: () {
              if (patient != null &&
                  patient!['patient'] != null &&
                  patient!['patient']['subclinical_requests'].length > 0) {
                for (int index = 0;
                    index < patient!['patient']['subclinical_requests'].length;
                    index++) {
                  if (patient!['patient']['subclinical_requests'][index] !=
                          null &&
                      patient!['patient']['subclinical_requests'][index]
                              ['created_at'] !=
                          null &&
                      patient!['patient']['subclinical_requests'][index]
                              ['service_group'] !=
                          null &&
                      patient!['patient']['subclinical_requests'][index]
                              ['service_group']['name'] !=
                          null &&
                      patient!['patient']['subclinical_requests'][index]
                                  ['service_group']['name']
                              .contains('Xét nghiệm') ==
                          false &&
                      patient!['patient']['subclinical_requests'][index]
                                  ['service_group']['name']
                              .contains('xét nghiệm') ==
                          false) {
                    if (subclinicalsCreateAts.contains(patient!['patient']
                            ['subclinical_requests'][index]['created_at']) ==
                        false) {
                      subclinicalsCreateAts.add(
                        patient!['patient']['subclinical_requests'][index]
                            ['created_at'],
                      );
                    }
                  }
                }
              }
              print("start Tab ${medicalHistoryType} Thuốc free");
              setState(() {
                medicalHistoryType = "SumCLS";
              });
              Navigator.pop(context);
              print('Tab "${medicalHistoryType} end"');
            },
          ),
          ListTile(
            title: Text('Tóm tắt xét nghiệm'),
            onTap: () {
              print("start Tab ${medicalHistoryType} Khám nội soi");
              setState(() {
                medicalHistoryType = "SumXN";
                if (patient != null) {}
              });
              Navigator.pop(context);
              print('Tab "${medicalHistoryType} end"');
            },
          ),
        ],
      ),
    );
  }

  ListTile listTileSubclinicals(patient) {
    return ListTile(
      leading: Icon(Icons.boy_rounded),
      title: ExpansionTile(
        // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
        title: const Text(
          'Cận lâm sàng',
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        children: [
          Builder(
            builder: (context) {
              Size size = MediaQuery.of(context).size;
              return SafeArea(
                child: Column(
                  children: [
                    listTileSubclinicalName(patient, context),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      onTap: () {
        print('Tab "Thông tin cận lâm sàng"');
      },
    );
  }

  SafeArea listTileSubclinicalName(patient, BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          if (patient != null &&
              patient!['patient'] != null &&
              patient!['patient']['subclinical_requests'].length > 0) ...[
            for (int index = 0;
                index < patient!['patient']['subclinical_requests'].length;
                index++) ...[
              if (patient!['patient']['subclinical_requests'][index] != null &&
                  patient!['patient']['subclinical_requests'][index]
                          ['service_group'] !=
                      null &&
                  patient!['patient']['subclinical_requests'][index]
                          ['service_group']['name'] !=
                      null &&
                  patient!['patient']['subclinical_requests'][index]
                              ['service_group']['name']
                          .contains('Khám bệnh') ==
                      false) ...[
                if (patient!['patient']['subclinical_requests'][index]
                            ['details'] !=
                        null &&
                    patient!['patient']['subclinical_requests'][index]
                            ['created_at'] !=
                        null) ...[
                  ListTile(
                    title: Text(
                        '${patient!['patient']['subclinical_requests'][index]['details']}\n(${patient!['patient']['subclinical_requests'][index]['created_at'].toString().split('T')[0]})'),
                    onTap: () {
                      setState(() {
                        if (patient!['patient']['subclinical_requests'][index]
                                    ['service_group']['name']
                                .contains('Xét nghiệm') ==
                            true) {
                          medicalHistoryType = "XN";
                          data_interface = null;
                          data_interface = patient!['patient']
                              ['subclinical_requests'][index];
                        } else if (patient!['patient']['subclinical_requests']
                                    [index]['service_group']['name']
                                .contains('Điện tim') ==
                            true) {
                          medicalHistoryType = "ECG";
                          data_interface = null;
                          data_interface = patient!['patient']
                              ['subclinical_requests'][index];
                        } else {
                          medicalHistoryType = "DICOM";
                          data_interface = null;
                          data_interface = patient!['patient']
                              ['subclinical_requests'][index];
                        }
                      });
                      Navigator.pop(context);
                      print('Tab "${medicalHistoryType}"');
                    },
                  ),
                ],
              ]
            ]
          ],
        ],
      ),
    );
  }

// phần xổ xuống của danh sách khám bệnh
  ListTile listTileExaminations(patient) {
    return ListTile(
      leading: Icon(Icons.medical_services_outlined),
      title: ExpansionTile(
        // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
        title: const Text(
          'Thông tin khám bệnh',
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        children: [
          Builder(
            builder: (context) {
              Size size = MediaQuery.of(context).size;
              return SafeArea(
                child: Column(
                  children: [
                    listTileExaminationName(size, patient, context),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      onTap: () {
        print('Tab "Thông tin khám bệnh"');
      },
    );
  }

// phần danh sách tên dịch vụ khám bệnh
  Container listTileExaminationName(Size size, patient, BuildContext context) {
    return Container(
      width: size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          if (patient!['patient']['medical_examinations'].length > 0) ...[
            for (int index = 0;
                index < patient!['patient']['medical_examinations'].length;
                index++) ...[
              if (patient!['patient']['medical_examinations'].length > 0 &&
                  patient!['patient']['medical_examinations'][index] != null &&
                  patient!['patient']['medical_examinations'][index]
                          ['service'] !=
                      null &&
                  patient!['patient']['medical_examinations'][index]['service']
                          ['name'] !=
                      null &&
                  patient!['patient']['medical_examinations'][index]
                          ['created_at'] !=
                      null) ...[
                ListTile(
                  title: Text(
                      '${patient!['patient']['medical_examinations'][index]['service']['name']}\n(${patient!['patient']['medical_examinations'][index]['created_at'].toString().split('T')[0]})'),
                  onTap: () {
                    print(
                        "số dịch vụ khám: ${patient!['patient']['medical_examinations'].length}");
                    setState(() {
                      medicalHistoryType = "KB";
                      data_interface = null;
                      data_interface =
                          patient!['patient']['medical_examinations'][index];
                    });
                    Navigator.pop(context);
                    print('Tab "${medicalHistoryType} end"');
                  },
                ),
              ],
            ]
          ],
        ],
      ),
    );
  }
}
