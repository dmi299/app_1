import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class SummaryThreeYear extends StatelessWidget {
  String SubType;
  SummaryThreeYear({Key? key, required this.SubType}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          if (SubType == "SumCLS")
            TableTest()
          else if (SubType == "SumXN")
            _ECGInfoState()
        ],
      ),
    );
  }
}

class TableTest extends StatefulWidget {
  @override
  TableTest({Key? key}) : super(key: key);
  State<TableTest> createState() => _TableTestState();
}

class _TableTestState extends State<TableTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 17, bottom: 17),
            child: Wrap(
              children: [
                Heading2(devideSize: 1, infoValue: 'Tóm tắt CLS 3 năm'),
              ],
            ),
          ),
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
                        infoValue: "25-5-2021",
                      ),
                      children: [
                        Wrap(children: [
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
                              TableRow(
                                children: <Widget>[
                                  testText(content: "X-Quang Phổi"),
                                  testText(content: "Bình thường"),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  testText(content: "Siêu âm 1"),
                                  testText(content: "Bình thường"),
                                ],
                              ),
                            ],
                          ),
                        ])
                      ]),
                ],
              ),
            ],
          ),
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
                        infoValue: "25-4-2021",
                      ),
                      children: [
                        Wrap(children: [
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
                              TableRow(
                                children: <Widget>[
                                  testText(content: "Nội soi 1"),
                                  testText(content: "Bình thường"),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  testText(content: "Đo điện tim"),
                                  testText(content: "Bình thường"),
                                ],
                              ),
                            ],
                          ),
                        ])
                      ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ECGInfoState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 17, bottom: 17),
            child: Wrap(
              children: [
                Heading2(devideSize: 1, infoValue: 'Tóm tắt xét nghiệm 3 năm'),
              ],
            ),
          ),

          // table xét nghiệm
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
                      infoValue: "25-4-2021",
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
                              TableRow(
                                children: <Widget>[
                                  testText(content: "Xét nghiệm huyết học"),
                                  Table(
                                    border: TableBorder.all(),
                                    columnWidths: const <int, TableColumnWidth>{
                                      // 0: IntrinsicColumnWidth(),
                                      // 2: FixedColumnWidth(64),
                                      2: FlexColumnWidth(),
                                      3: FlexColumnWidth(),
                                      4: FlexColumnWidth(),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          testText(
                                              content: 'Nhóm máu ABO + Rh'),
                                          testText(content: '"O"(Rh Dương)'),
                                          testText(content: ''),
                                        ],
                                      ),
                                      for (int index = 0;
                                          index < 5;
                                          index++) ...[
                                        TableRow(
                                          children: <Widget>[
                                            testText(content: "Fiprinogen"),
                                            testText(content: "3.33"),
                                            testText(content: "1.5 - 3.8"),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              TableRow(
                                children: <Widget>[
                                  testText(content: "Xét nghiệm sinh hóa máu"),
                                  Table(
                                    border: TableBorder.all(),
                                    columnWidths: const <int, TableColumnWidth>{
                                      // 0: IntrinsicColumnWidth(),
                                      // 2: FixedColumnWidth(64),
                                      2: FlexColumnWidth(),
                                      3: FlexColumnWidth(),
                                      4: FlexColumnWidth(),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          testText(
                                              content: 'Nhóm máu ABO + Rh'),
                                          testText(content: '"O"(Rh Dương)'),
                                          testText(content: ''),
                                        ],
                                      ),
                                      for (int index = 0;
                                          index < 5;
                                          index++) ...[
                                        TableRow(
                                          children: <Widget>[
                                            testText(content: "Fiprinogen"),
                                            testText(content: "3.33"),
                                            testText(content: "1.5 - 3.8"),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // cột tên dịch vụ xn
        ],
      ),
    );
  }
}
