import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/home.dart';
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
import '../test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('data patient medical history: $patient');
    // fetchFirstData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bệnh sử'),
      ),
      drawer: drawerExpandMedicalHistory(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (medicalHistoryType == 'BN') ...[
              PatientInfo(patient: patient),
            ] else if (medicalHistoryType == 'KB') ...[
              ExaminationInfo()
            ] else if (medicalHistoryType == 'XN') ...[
              SubclinicalInfo(
                SubType: medicalHistoryType,
              )
            ] else if (medicalHistoryType == 'SumCLS') ...[
              SummaryThreeYear(
                SubType: medicalHistoryType,
              )
            ] else if (medicalHistoryType == 'SumXN') ...[
              SummaryThreeYear(
                SubType: medicalHistoryType,
              )
            ] else if (medicalHistoryType == 'ECG') ...[
              SubclinicalInfo(
                SubType: medicalHistoryType,
              ),
            ] else if (medicalHistoryType == 'DICOM') ...[
              DICOMInfo()
            ]
          ],
        ),
      ),
    );
  }

  Drawer drawerExpandMedicalHistory(BuildContext context) {
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
            ListTile(
              leading: Icon(Icons.summarize),
              title: ExpansionTile(
                // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
                title: const Text(
                  'Tóm tắt bệnh sử 3 năm',
                  // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                children: [
                  Builder(
                    builder: (context) {
                      Size size = MediaQuery.of(context).size;
                      return SafeArea(
                        child: Column(
                          children: [
                            Container(
                              width: size.width,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('Tóm tắt CLS 3 năm'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Thuốc free");
                                      setState(() {
                                        medicalHistoryType = "SumCLS";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Tóm tắt xét nghiệm 3 năm'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Khám nội soi");
                                      setState(() {
                                        medicalHistoryType = "SumXN";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
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
                            Container(
                              width: size.width,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                        'Cấp đơn thuốc miễn phí 07/07/2020'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Thuốc free");
                                      setState(() {
                                        medicalHistoryType = "KB";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Khám nội soi 2'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Khám nội soi");
                                      setState(() {
                                        medicalHistoryType = "KB";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Khám nội soi 3'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Khám nội soi");
                                      setState(() {
                                        medicalHistoryType = "KB";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Khám nội soi 4'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Khám nội soi");
                                      setState(() {
                                        medicalHistoryType = "KB";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Khám nội soi 5'),
                                    onTap: () {
                                      print(
                                          "start Tab ${medicalHistoryType} Khám nội soi");
                                      setState(() {
                                        medicalHistoryType = "KB";
                                      });
                                      Navigator.pop(context);
                                      print('Tab "${medicalHistoryType} end"');
                                    },
                                  ),
                                ],
                              ),
                            ),
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
            ),
            ListTile(
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
                            ListTile(
                              title: Text('X-Quang Phổi'),
                              onTap: () {
                                setState(() {
                                  medicalHistoryType = "DICOM";
                                });
                                Navigator.pop(context);
                                print('Tab "${medicalHistoryType}"');
                              },
                            ),
                            ListTile(
                              title: Text('Siêu âm 1'),
                              onTap: () {
                                setState(() {
                                  medicalHistoryType = "DICOM";
                                });
                                Navigator.pop(context);
                                print('Tab "${medicalHistoryType}"');
                              },
                            ),
                            ListTile(
                              title: Text('Nội soi 1'),
                              onTap: () {
                                setState(() {
                                  medicalHistoryType = "DICOM";
                                });
                                Navigator.pop(context);
                                print('Tab "${medicalHistoryType}"');
                              },
                            ),
                            ListTile(
                              title: Text('Xét nghiệm 1'),
                              onTap: () {
                                setState(() {
                                  medicalHistoryType = "XN";
                                });
                                Navigator.pop(context);
                                print('Tab "${medicalHistoryType}"');
                              },
                            ),
                            ListTile(
                              title: Text('Đo điện tim (ECG) 02/07/2020'),
                              onTap: () {
                                setState(() {
                                  medicalHistoryType = "ECG";
                                });
                                Navigator.pop(context);
                                print('Tab "${medicalHistoryType}"');
                              },
                            ),
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
            )
          ],
        ),
      ),
    );
  }
}
