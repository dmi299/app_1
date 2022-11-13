import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class SubclinicalInfo extends StatelessWidget {
  String SubType;
  SubclinicalInfo({Key? key, required this.SubType}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          if (SubType == "XN")
            TableTest()
          else if (SubType == "ECG") ...[
            _ECGInfoState(),
          ]
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
      padding: EdgeInsets.all(17),
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
          infoText(
              devideSize: 1,
              infoKey: 'Bác sĩ chỉ định',
              infoValue: 'Nguyễn Văn A'),
          infoText(
              devideSize: 1, infoKey: "Ngày chỉ định", infoValue: '25-05-2021'),
          infoText(devideSize: 1, infoKey: "Chẩn đoán", infoValue: ''),
          infoText(
              devideSize: 1,
              infoKey: 'Phụ trách XN',
              infoValue: 'Nguyễn Văn B'),
          infoText(devideSize: 1, infoKey: 'Giờ thực hiện', infoValue: '10:40'),
          ExpansionTile(
            title: Heading2(devideSize: 1, infoValue: 'Nội dung'),
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
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          testHeaderText(content: "Yêu cầu"),
                          testHeaderText(content: "Kết quả"),
                          testHeaderText(content: "Đơn vị tính"),
                          testHeaderText(content: "Khoảng tham chiếu"),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          testHeaderText(content: "(Test requests)"),
                          testHeaderText(content: "(Results)"),
                          testHeaderText(content: "(Units)"),
                          testHeaderText(content: "(Reference ranges)"),
                        ],
                      ),
                    ],
                  ),
                  tableTest(),
                  tableTest2(),
                ],
              ),
            ],
          ),
          infoText(devideSize: 1, infoKey: 'Nhận xét', infoValue: ''),
        ],
      ),
    );
  }
}

class tableTest2 extends StatelessWidget {
  const tableTest2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
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
              title: testNameText(content: "Xét nghiệm sinh hóa máu"),
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
                        2: FlexColumnWidth(),
                        3: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            testText(content: "Nhóm máu ABO + Rh"),
                            testText(content: "\"O\"(Rh Dương)"),
                            testText(content: ""),
                            testText(content: ""),
                          ],
                        ),
                        for (int index = 0; index < 5; index++) ...[
                          TableRow(
                            children: <Widget>[
                              testText(content: "Fiprinogen"),
                              testText(content: "3.33"),
                              testText(content: "g/l"),
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
    );
  }
}

class tableTest extends StatelessWidget {
  const tableTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
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
              title: testNameText(content: "Xét nghiệm huyết học"),
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
                        2: FlexColumnWidth(),
                        3: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            testText(content: "Nhóm máu ABO + Rh"),
                            testText(content: "\"O\"(Rh Dương)"),
                            testText(content: ""),
                            testText(content: ""),
                          ],
                        ),
                        for (int index = 0; index < 5; index++) ...[
                          TableRow(
                            children: <Widget>[
                              testText(content: "Fiprinogen"),
                              testText(content: "3.33"),
                              testText(content: "g/l"),
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
    );
  }
}

class _ECGInfoState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(17),
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 17, bottom: 17),
            child: Wrap(
              children: [
                Heading2(devideSize: 1, infoValue: 'Kết quả đo điện tim (ECG)'),
              ],
            ),
          ),
          infoText(
              devideSize: 1,
              infoKey: "Ngày kết quả: ",
              infoValue: "07/07/2020"),
          Divider(
            thickness: 5,
          ),
          infoText(
              devideSize: 1,
              infoKey: 'Kết luận: ',
              infoValue: "Chưa phát hiện bất thường trên ECG"),
          const Divider(
            thickness: 5,
          ),
          infoText(
              devideSize: 1,
              infoKey: "Bác sĩ kết luận: ",
              infoValue: "KL Nguyễn"),
          Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
