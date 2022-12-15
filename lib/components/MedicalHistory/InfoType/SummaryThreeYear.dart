import 'dart:math';
import 'dart:async';
import 'package:app_1/components/MedicalHistory/InfoType/SubclinicalInfo.dart';
import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class SummaryThreeYear extends StatelessWidget {
  String SubType;
  var patient;
  var subclinicalsCreateAts;
  SummaryThreeYear(
      {Key? key,
      required this.SubType,
      required this.patient,
      required this.subclinicalsCreateAts})
      : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          if (SubType == "SumCLS")
            TableTest(
                patient: patient, subclinicalsCreateAts: subclinicalsCreateAts)
          else if (SubType == "SumXN")
            _ECGInfoState(patient: patient)
        ],
      ),
    );
  }
}

class TableTest extends StatefulWidget {
  @override
  var patient;
  var subclinicalsCreateAts;
  TableTest(
      {Key? key, required this.patient, required this.subclinicalsCreateAts})
      : super(key: key);
  State<TableTest> createState() => _TableTestState(patient: patient);
}

class _TableTestState extends State<TableTest> {
  var patient;
  _TableTestState({Key? key, required this.patient});

  @override
  Widget build(BuildContext context) {
    bool sameDay = false;
    var subclinicalsCreateAts = [];
    var examinationCreateAts = [];
    var subclinicalRequests = null;

    // pushCreateAt(patient, subclinicalsCreateAts) {
    //   if (patient != null &&
    //       patient!['patient'] != null &&
    //       patient!['patient']['subclinical_requests'].length > 0) {
    //     for (int index = 0;
    //         index < patient!['patient']['subclinical_requests'].length;
    //         index++) {
    //       if (patient!['patient']['subclinical_requests'][index] != null &&
    //           patient!['patient']['subclinical_requests'][index]
    //                   ['created_at'] !=
    //               null &&
    //           patient!['patient']['subclinical_requests'][index]
    //                   ['service_group'] !=
    //               null &&
    //           patient!['patient']['subclinical_requests'][index]
    //                   ['service_group']['name'] !=
    //               null &&
    //           patient!['patient']['subclinical_requests'][index]
    //                       ['service_group']['name']
    //                   .contains('Xét nghiệm') ==
    //               false &&
    //           patient!['patient']['subclinical_requests'][index]
    //                       ['service_group']['name']
    //                   .contains('xét nghiệm') ==
    //               false) {
    //         if (subclinicalsCreateAts.contains(patient!['patient']
    //                 ['subclinical_requests'][index]['created_at']) ==
    //             false) {
    //           subclinicalsCreateAts.add(
    //             patient!['patient']['subclinical_requests'][index]
    //                 ['created_at'],
    //           );
    //         }
    //       }
    //     }
    //   }
    // }

    if (patient != null &&
        patient!['patient'] != null &&
        patient!['patient']['subclinical_requests'].length > 0) {
      for (int index = 0;
          index < patient!['patient']['subclinical_requests'].length;
          index++) {
        if (patient!['patient']['subclinical_requests'][index] != null &&
            patient!['patient']['subclinical_requests'][index]['created_at'] !=
                null &&
            patient!['patient']['subclinical_requests'][index]
                    ['service_group'] !=
                null &&
            patient!['patient']['subclinical_requests'][index]['service_group']
                    ['name'] !=
                null &&
            patient!['patient']['subclinical_requests'][index]['service_group']
                        ['name']
                    .contains('Xét nghiệm') ==
                false &&
            patient!['patient']['subclinical_requests'][index]['service_group']
                        ['name']
                    .contains('xét nghiệm') ==
                false) {
          if (subclinicalsCreateAts.contains(patient!['patient']
                      ['subclinical_requests'][index]['created_at']
                  .toString()
                  .split('T')[0]) ==
              false) {
            subclinicalsCreateAts.add(
              patient!['patient']['subclinical_requests'][index]['created_at']
                  .toString()
                  .split('T')[0],
            );
          }
        }
      }
    }
    // lịch sử ngày khám bệnh
    if (patient != null &&
        patient!['patient'] != null &&
        patient!['patient']['medical_examinations'].length > 0) {
      for (int index = 0;
          index < patient!['patient']['medical_examinations'].length;
          index++) {
        if (patient!['patient']['medical_examinations'][index] != null &&
            patient!['patient']['medical_examinations'][index]['created_at'] !=
                null) {
          if (subclinicalsCreateAts.contains(patient!['patient']
                      ['medical_examinations'][index]['created_at']
                  .toString()
                  .split('T')[0]) ==
              false) {
            subclinicalsCreateAts.add(
              patient!['patient']['medical_examinations'][index]['created_at']
                  .toString()
                  .split('T')[0],
            );
          }
        }
      }
    }
    print('subclinicalsCreateAts $subclinicalsCreateAts');
    print('medical_examinations $examinationCreateAts');
    print('${patient!['patient']['medical_examinations'].length}');
    return Container(
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 17, bottom: 17),
            child: Wrap(
              children: [
                Heading2(devideSize: 1, infoValue: 'Tóm tắt CLS'),
              ],
            ),
          ),
          for (int index = 0;
              index < subclinicalsCreateAts.length;
              index++) ...[
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                // 0: IntrinsicColumnWidth(),
                // 2: FixedColumnWidth(64),
                0: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    ExpansionTile(
                      title: middleText(
                        devideSize: 1,
                        infoValue:
                            "${subclinicalsCreateAts[index].split('T')[0]}",
                      ),
                      children: [
                        Wrap(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                // 0: IntrinsicColumnWidth(),
                                // 2: FixedColumnWidth(64),
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                if (patient != null &&
                                    patient!['patient'] != null &&
                                    patient!['patient']['subclinical_requests']
                                            .length >
                                        0) ...[
                                  for (int index2 = 0;
                                      index2 <
                                          patient!['patient']
                                                  ['subclinical_requests']
                                              .length;
                                      index2++) ...[
                                    if (patient!['patient']['subclinical_requests'][index2] != null &&
                                        patient!['patient']['subclinical_requests']
                                                [index2]['service_group'] !=
                                            null &&
                                        patient!['patient']['subclinical_requests']
                                                    [index2]['service_group']
                                                ['name'] !=
                                            null &&
                                        patient!['patient']['subclinical_requests']
                                                        [index2]
                                                    ['service_group']['name']
                                                .contains('Xét nghiệm') ==
                                            false &&
                                        patient!['patient']['subclinical_requests']
                                                    [index2]['service_group']['name']
                                                .contains('xét nghiệm') ==
                                            false) ...[
                                      if (subclinicalsCreateAts[index] ==
                                              patient!['patient'][
                                                          'subclinical_requests']
                                                      [index2]['created_at']
                                                  .toString()
                                                  .split('T')[0] &&
                                          patient!['patient']['subclinical_requests']
                                                          [index2]
                                                      ['service_group']['name']
                                                  .contains('Khám bệnh') ==
                                              false &&
                                          patient!['patient']['subclinical_requests']
                                                          [index2]
                                                      ['service_group']['name']
                                                  .contains('khám bệnh') ==
                                              false) ...[
                                        TableRow(
                                          children: <Widget>[
                                            testText(
                                                content:
                                                    "${patient!['patient']['subclinical_requests'][index2]['service_group']['name']}"),
                                            if (patient!['patient']['subclinical_requests']
                                                        [index2]['diagnose'] !=
                                                    null &&
                                                patient!['patient']['subclinical_requests']
                                                        [index2]['diagnose'] !=
                                                    '') ...[
                                              testText(
                                                  content:
                                                      "${patient!['patient']['subclinical_requests'][index2]['diagnose']}"),
                                            ] else if (patient!['patient']['subclinical_requests'][index2]['subclinical_results'].length > 0 &&
                                                patient!['patient']['subclinical_requests']
                                                                [index2]
                                                            ['subclinical_results']
                                                        [0] !=
                                                    null &&
                                                patient!['patient']['subclinical_requests']
                                                                [index2]
                                                            ['subclinical_results']
                                                        [0]['conclusion'] !=
                                                    null) ...[
                                              testText(
                                                content:
                                                    "${patient!['patient']['subclinical_requests'][index2]['subclinical_results'][0]['conclusion']}",
                                              ),
                                            ]
                                          ],
                                        ),
                                      ]
                                    ],
                                  ],
                                ],
                                // show danh sách khám bệnh
                                if (patient != null &&
                                    patient!['patient'] != null &&
                                    patient!['patient']['medical_examinations']
                                            .length >
                                        0) ...[
                                  for (int index2 = 0;
                                      index2 <
                                          patient!['patient']
                                                  ['medical_examinations']
                                              .length;
                                      index2++) ...[
                                    if (subclinicalsCreateAts[index] ==
                                            patient!['patient']
                                                        ['medical_examinations']
                                                    [index2]['created_at']
                                                .toString()
                                                .split('T')[0] &&
                                        patient!['patient']
                                                    ['medical_examinations']
                                                [index2]['service'] !=
                                            null &&
                                        patient!['patient']
                                                    ['medical_examinations']
                                                [index2]['service']['name'] !=
                                            null &&
                                        patient!['patient']
                                                        ['medical_examinations']
                                                    [index2]
                                                ['preliminary_diagnosis'] !=
                                            null) ...[
                                      TableRow(
                                        children: <Widget>[
                                          testText(
                                              content:
                                                  "${patient!['patient']['medical_examinations'][index2]['service']['name']}"),
                                          testText(
                                              content:
                                                  "${patient!['patient']['medical_examinations'][index2]['preliminary_diagnosis']}"),
                                        ],
                                      ),
                                    ],
                                  ],
                                ]
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ECGInfoState extends StatelessWidget {
  var patient;
  _ECGInfoState({Key? key, required this.patient});
  var testCreatedAts = [];
  var testGroups = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (patient != null &&
        patient!['patient'] != null &&
        patient!['patient']['subclinical_requests'].length > 0) {
      for (int index = 0;
          index < patient!['patient']['subclinical_requests'].length;
          index++) {
        if (patient!['patient']['subclinical_requests'][index] != null &&
            patient!['patient']['subclinical_requests'][index]['created_at'] !=
                null &&
            patient!['patient']['subclinical_requests'][index]
                    ['service_group'] !=
                null &&
            patient!['patient']['subclinical_requests'][index]['service_group']
                    ['name'] !=
                null &&
            (patient!['patient']['subclinical_requests'][index]['service_group']
                            ['name']
                        .contains('Xét nghiệm') ==
                    true ||
                patient!['patient']['subclinical_requests'][index]
                            ['service_group']['name']
                        .contains('xét nghiệm') ==
                    true)) {
          // lấy danh sách ngày khám
          if (testCreatedAts.contains(patient!['patient']
                      ['subclinical_requests'][index]['created_at']
                  .toString()
                  .split('T')[0]) ==
              false) {
            testCreatedAts.add(
              patient!['patient']['subclinical_requests'][index]['created_at']
                  .toString()
                  .split('T')[0],
            );
          }
          // lấy danh sách xét nghiệm
          if (testGroups.contains(patient!['patient']['subclinical_requests']
                  [index]['service_group']['name']) ==
              false) {
            testGroups.add(patient!['patient']['subclinical_requests'][index]
                ['service_group']['name']);
          }
        }
      }
    }
    print('testCreatedAts $testCreatedAts');
    return Container(
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 17, bottom: 17),
            child: Wrap(
              children: [
                Heading2(devideSize: 1, infoValue: 'Tóm tắt xét nghiệm'),
              ],
            ),
          ),

          // table xét nghiệm
          for (int index = 0; index < testCreatedAts.length; index++) ...[
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                // 0: IntrinsicColumnWidth(),
                // 2: FixedColumnWidth(64),
                0: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    ExpansionTile(
                      title: middleText(
                        devideSize: 1,
                        infoValue: "${testCreatedAts[index]}",
                      ),
                      children: [
                        Wrap(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              columnWidths: <int, TableColumnWidth>{
                                // 0: IntrinsicColumnWidth(),
                                // 2: FixedColumnWidth(64),
                                0: FixedColumnWidth(size.width / 4),
                                1: FixedColumnWidth(size.width / 4 * 3),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                if (patient != null &&
                                    patient!['patient'] != null &&
                                    patient!['patient']['subclinical_requests']
                                            .length >
                                        0) ...[
                                  for (int index3 = 0;
                                      index3 < testGroups.length;
                                      index3++) ...[
                                    for (int index2 = 0;
                                        index2 <
                                            patient!['patient']
                                                    ['subclinical_requests']
                                                .length;
                                        index2++) ...[
                                      if (patient!['patient']['subclinical_requests'][index2] != null &&
                                          patient!['patient']['subclinical_requests']
                                                  [index2]['service_group'] !=
                                              null &&
                                          patient!['patient']['subclinical_requests'][index2]
                                                  ['service_group']['name'] !=
                                              null &&
                                          (patient!['patient']['subclinical_requests'][index2]['service_group']['name'].contains('xét nghiệm') == true ||
                                              patient!['patient']['subclinical_requests']
                                                              [index2]['service_group']
                                                          ['name']
                                                      .contains('Xét nghiệm') ==
                                                  true) &&
                                          testGroups[index3] ==
                                              patient!['patient']['subclinical_requests']
                                                  [index2]['service_group']['name'] &&
                                          patient!['patient']['subclinical_requests'][index2]['subclinical_request_details'].length > 0 &&
                                          testCreatedAts[index] == patient!['patient']['subclinical_requests'][index2]['created_at'].toString().split('T')[0]) ...[
                                        TableRow(
                                          children: <Widget>[
                                            testText(
                                                content:
                                                    "${patient!['patient']['subclinical_requests'][index2]['service_group']['name']}"),
                                            Table(
                                              border: TableBorder.all(),
                                              columnWidths: const <int,
                                                  TableColumnWidth>{
                                                // 0: IntrinsicColumnWidth(),
                                                // 2: FixedColumnWidth(64),
                                                2: FlexColumnWidth(),
                                                3: FlexColumnWidth(),
                                                4: FlexColumnWidth(),
                                              },
                                              defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              children: <TableRow>[
                                                for (int index4 = 0;
                                                    index4 <
                                                        patient!['patient'][
                                                                        'subclinical_requests']
                                                                    [index2][
                                                                'subclinical_request_details']
                                                            .length;
                                                    index4++) ...[
                                                  if (patient!['patient']['subclinical_requests']
                                                                          [index2]
                                                                      ['subclinical_request_details']
                                                                  [index4]
                                                              ['service'] !=
                                                          null &&
                                                      patient!['patient']['subclinical_requests']
                                                                          [index2]
                                                                      [
                                                                      'subclinical_request_details']
                                                                  [index4][
                                                              'service']['name'] !=
                                                          null) ...[
                                                    TableRow(
                                                      children: <Widget>[
                                                        testText(
                                                            content:
                                                                "${patient!['patient']['subclinical_requests'][index2]['subclinical_request_details'][index4]['service']['name']}"),
                                                        // testText(content: "3.33"),
                                                        // testText(
                                                        //     content: "1.5 - 3.8"),
                                                      ],
                                                    ),
                                                  ],
                                                ]
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ],
                                ],
                              ],
                            ),
                            // Table(
                            //   border: TableBorder.all(),
                            //   columnWidths: <int, TableColumnWidth>{
                            //     // 0: IntrinsicColumnWidth(),
                            //     // 2: FixedColumnWidth(64),
                            //     0: FixedColumnWidth(size.width / 4),
                            //     1: FixedColumnWidth(size.width / 4 * 3),
                            //   },
                            //   defaultVerticalAlignment:
                            //       TableCellVerticalAlignment.middle,
                            //   children: <TableRow>[
                            //     TableRow(
                            //       children: <Widget>[
                            //         testText(
                            //             content: "Xét nghiệm sinh hóa máu"),
                            //         Table(
                            //           border: TableBorder.all(),
                            //           columnWidths: const <int,
                            //               TableColumnWidth>{
                            //             // 0: IntrinsicColumnWidth(),
                            //             // 2: FixedColumnWidth(64),
                            //             2: FlexColumnWidth(),
                            //             3: FlexColumnWidth(),
                            //             4: FlexColumnWidth(),
                            //           },
                            //           defaultVerticalAlignment:
                            //               TableCellVerticalAlignment.middle,
                            //           children: <TableRow>[
                            //             TableRow(
                            //               children: <Widget>[
                            //                 testText(
                            //                     content: 'Nhóm máu ABO + Rh'),
                            //                 testText(content: '"O"(Rh Dương)'),
                            //                 testText(content: ''),
                            //               ],
                            //             ),
                            //             for (int index = 0;
                            //                 index < 5;
                            //                 index++) ...[
                            //               TableRow(
                            //                 children: <Widget>[
                            //                   testText(content: "Fiprinogen"),
                            //                   testText(content: "3.33"),
                            //                   testText(content: "1.5 - 3.8"),
                            //                 ],
                            //               ),
                            //             ],
                            //           ],
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
          // cột tên dịch vụ xn
        ],
      ),
    );
  }
}
