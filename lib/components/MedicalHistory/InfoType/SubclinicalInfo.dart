import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vector_math/vector_math_64.dart';

class SubclinicalInfo extends StatelessWidget {
  String SubType;
  var data_interface;
  SubclinicalInfo(
      {Key? key, required this.SubType, required this.data_interface})
      : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          if (SubType == "XN")
            TableTest(data_interface: data_interface)
          else if (SubType == "ECG") ...[
            _ECGInfoState(
              data_interface: data_interface,
            ),
          ]
        ],
      ),
    );
  }
}

class TableTest extends StatefulWidget {
  var data_interface;
  TableTest({Key? key, required this.data_interface}) : super(key: key);
  @override
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
                Heading2(devideSize: 1, infoValue: 'Xét nghiệm'),
              ],
            ),
          ),
          if (widget.data_interface != null &&
              widget.data_interface!['doctor'] != null &&
              widget.data_interface!['doctor']['fullname'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: 'Bác sĩ chỉ định',
                infoValue: '${widget.data_interface!['doctor']['fullname']}'),
          ] else ...[
            infoText(devideSize: 1, infoKey: 'Bác sĩ chỉ định', infoValue: ''),
          ],
          if (widget.data_interface != null &&
              widget.data_interface!['created_at'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Ngày chỉ định",
                infoValue: '${widget.data_interface!['created_at']}'),
          ] else ...[
            infoText(devideSize: 1, infoKey: "Ngày chỉ định", infoValue: ''),
          ],
          if (widget.data_interface != null &&
              widget.data_interface!['diagnose'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Chẩn đoán",
                infoValue: '${widget.data_interface!['diagnose']}'),
          ] else ...[
            infoText(devideSize: 1, infoKey: "Chẩn đoán", infoValue: ''),
          ],
          // infoText(
          //     devideSize: 1,
          //     infoKey: 'Phụ trách XN',
          //     infoValue: 'Nguyễn Văn B'),
          // infoText(devideSize: 1, infoKey: 'Giờ thực hiện', infoValue: '10:40'),
          ExpansionTile(
            title: Heading2(devideSize: 1, infoValue: 'Nội dung'),
            children: [
              Wrap(
                children: [
                  // Table(
                  //   border: TableBorder.all(),
                  //   columnWidths: const <int, TableColumnWidth>{
                  //     // 0: IntrinsicColumnWidth(),
                  //     // 2: FixedColumnWidth(64),
                  //     0: FlexColumnWidth(),
                  //     1: FlexColumnWidth(),
                  //     2: FlexColumnWidth(),
                  //     3: FlexColumnWidth(),
                  //   },
                  //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  //   children: <TableRow>[
                  //     TableRow(
                  //       children: <Widget>[
                  //         testHeaderText(content: "Yêu cầu"),
                  //         testHeaderText(content: "Kết quả"),
                  //         testHeaderText(content: "Đơn vị tính"),
                  //         testHeaderText(content: "Khoảng tham chiếu"),
                  //       ],
                  //     ),
                  //     TableRow(
                  //       children: <Widget>[
                  //         testHeaderText(content: "(Test requests)"),
                  //         testHeaderText(content: "(Results)"),
                  //         testHeaderText(content: "(Units)"),
                  //         testHeaderText(content: "(Reference ranges)"),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  if (widget.data_interface != null &&
                      widget.data_interface!['details'] != null) ...[
                    tableTest(data_interface: widget.data_interface),
                  ],
                  // tableTest2(),
                ],
              ),
            ],
          ),
          // infoText(devideSize: 1, infoKey: 'Nhận xét', infoValue: ''),
        ],
      ),
    );
  }
}

// class tableTest2 extends StatelessWidget {
//   const tableTest2({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(),
//       columnWidths: const <int, TableColumnWidth>{
//         // 0: IntrinsicColumnWidth(),
//         // 2: FixedColumnWidth(64),
//         0: FlexColumnWidth(),
//       },
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       children: <TableRow>[
//         TableRow(
//           children: <Widget>[
//             ExpansionTile(
//               title: testNameText(content: "Xét nghiệm sinh hóa máu"),
//               children: [
//                 Wrap(
//                   children: [
//                     Table(
//                       border: TableBorder.all(),
//                       columnWidths: const <int, TableColumnWidth>{
//                         // 0: IntrinsicColumnWidth(),
//                         // 2: FixedColumnWidth(64),
//                         0: FlexColumnWidth(),
//                         1: FlexColumnWidth(),
//                         2: FlexColumnWidth(),
//                         3: FlexColumnWidth(),
//                       },
//                       defaultVerticalAlignment:
//                           TableCellVerticalAlignment.middle,
//                       children: <TableRow>[
//                         TableRow(
//                           children: <Widget>[
//                             testText(content: "Nhóm máu ABO + Rh"),
//                             testText(content: "\"O\"(Rh Dương)"),
//                             testText(content: ""),
//                             testText(content: ""),
//                           ],
//                         ),
//                         for (int index = 0; index < 5; index++) ...[
//                           TableRow(
//                             children: <Widget>[
//                               testText(content: "Fiprinogen"),
//                               testText(content: "3.33"),
//                               testText(content: "g/l"),
//                               testText(content: "1.5 - 3.8"),
//                             ],
//                           ),
//                         ],
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class tableTest extends StatelessWidget {
  var data_interface;
  tableTest({Key? key, required this.data_interface}) : super(key: key);

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
            testNameText(content: "${data_interface!['details']}"),
            // ExpansionTile(
            //   title: testNameText(content: "${data_interface!['details']}"),
            //   children: [
            //     Wrap(
            //       children: [
            //         Table(
            //           border: TableBorder.all(),
            //           columnWidths: const <int, TableColumnWidth>{
            //             // 0: IntrinsicColumnWidth(),
            //             // 2: FixedColumnWidth(64),
            //             0: FlexColumnWidth(),
            //             1: FlexColumnWidth(),
            //             2: FlexColumnWidth(),
            //             3: FlexColumnWidth(),
            //           },
            //           defaultVerticalAlignment:
            //               TableCellVerticalAlignment.middle,
            //           children: <TableRow>[
            //             if (data_interface!['subclinical_request_details']
            //                     .length >
            //                 0) ...[
            //               for (int index = 0;
            //                   index <
            //                       data_interface!['subclinical_request_details']
            //                           .length;
            //                   index++) ...[
            //                 if (data_interface!['subclinical_request_details']
            //                             [index] !=
            //                         null &&
            //                     data_interface!['subclinical_request_details']
            //                             [index]['service'] !=
            //                         null &&
            //                     data_interface!['subclinical_request_details']
            //                             [index]['service']['name'] !=
            //                         null) ...[
            //                   TableRow(
            //                     children: <Widget>[
            //                       testText(
            //                           content:
            //                               "${data_interface!['subclinical_request_details'][index]['service']['name']}"),
            //                       testText(content: ""),
            //                       testText(content: ""),
            //                       testText(content: ""),
            //                     ],
            //                   ),
            //                 ]
            //               ],
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
    );
  }
}

class _ECGInfoState extends StatefulWidget {
  var data_interface;
  _ECGInfoState({Key? key, required this.data_interface}) : super(key: key);

  @override
  State<_ECGInfoState> createState() => _ECGInfoStateState();
}

class _ECGInfoStateState extends State<_ECGInfoState> {
  double _scale = 1.0;

  var _previousScale = null;

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
          if (widget.data_interface != null &&
              widget.data_interface!['created_at'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Ngày kết quả: ",
                infoValue: widget.data_interface!['created_at']
                    .toString()
                    .split('T')[0]),
          ] else ...[
            infoText(devideSize: 1, infoKey: "Ngày kết quả: ", infoValue: ""),
          ],
          if (widget.data_interface != null &&
              widget.data_interface!['thuong_subclinical_images'].length >
                  0) ...[
            for (int index = 0;
                index <
                    widget.data_interface!['thuong_subclinical_images'].length;
                index++) ...[
              if (widget.data_interface!['thuong_subclinical_images'][index] !=
                      null &&
                  widget.data_interface!['thuong_subclinical_images'][index]
                          ['url'] !=
                      null) ...[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        builder: (context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            // backgroundColor: Colors.white,
                            content: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width,
                                    // height: size.height / 2,
                                    child: Image.network(
                                      '${widget.data_interface!['thuong_subclinical_images'][index]['url']}',
                                      fit: BoxFit.cover, // Fixes border issues
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          // Image.network(
                          //   '${widget.data_interface!['thuong_subclinical_images'][index]['url']}',
                          //   fit: BoxFit.cover, // Fixes border issues
                          //   width: size.width - 17 * 3,
                          // );
                          // InteractiveViewer(
                          //   panEnabled: false, // Set it to false
                          //   boundaryMargin: EdgeInsets.all(size.width - 17 * 3),
                          //   minScale: 0.5,
                          //   maxScale: 2,
                          //   child: Image.network(
                          //     '${widget.data_interface!['thuong_subclinical_images'][index]['url']}',
                          //     fit: BoxFit.cover, // Fixes border issues
                          //     width: size.width - 17 * 3,
                          //   ),
                          // );
                        },
                        context: context,
                      );
                    }, // Image tapped
                    child: Image.network(
                      '${widget.data_interface!['thuong_subclinical_images'][index]['url']}',
                      fit: BoxFit.cover, // Fixes border issues
                      width: size.width - 17 * 3,
                    ),
                  ),
                )
              ]
            ]
          ],
          if (widget.data_interface != null &&
              widget.data_interface!['diagnose'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: 'Kết luận: ',
                infoValue: "${widget.data_interface!['diagnose']}"),
          ] else ...[
            infoText(devideSize: 1, infoKey: 'Kết luận: ', infoValue: ""),
          ],
          if (widget.data_interface != null &&
              widget.data_interface!['doctor'] != null &&
              widget.data_interface!['doctor']['fullname'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Bác sĩ kết luận: ",
                infoValue: "${widget.data_interface!['doctor']['fullname']}"),
          ] else ...[
            infoText(
                devideSize: 1, infoKey: "Bác sĩ kết luận: ", infoValue: ""),
          ],
        ],
      ),
    );
  }
}
