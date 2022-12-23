import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class DICOMInfo extends StatefulWidget {
  var data_interface;
  DICOMInfo({Key? key, required this.data_interface}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  State<DICOMInfo> createState() => _XQuangInfoState();
}

class _XQuangInfoState extends State<DICOMInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String namePatient;
    return Column(
      children: <Widget>[
        TableExaminate(data_interface: widget.data_interface),
      ],
    );
  }
}

class TableExaminate extends StatefulWidget {
  var data_interface;
  TableExaminate({Key? key, required this.data_interface}) : super(key: key);
  State<TableExaminate> createState() => _TableExaminateState();
}

class _TableExaminateState extends State<TableExaminate> {
  @override
  Widget build(BuildContext context) {
    List bs = ["a", "b", "c", "d"];
    return Container(
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: <Widget>[
          _ExpansionTileSubclinical(data_interface: widget.data_interface),
        ],
      ),
    );
  }
}

class _ExpansionTileSubclinical extends StatelessWidget {
  var data_interface;
  _ExpansionTileSubclinical({Key? key, required this.data_interface})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (data_interface != null &&
        data_interface!['subclinical_request_details'].length > 0) {
      print('có data subclinical_request_details');
      if (data_interface!['doctor'] != null &&
          data_interface!['doctor']['fullname'] != null) {
        print('có tên bác sĩ');
      } else {
        print('không có tên bác sĩ: mục bác sĩ: ${data_interface!['doctor']}');
      }
    } else {
      print('không có subclinical_request_details');
    }
    return Container(
      padding: EdgeInsets.all(17),
      child: Wrap(
        children: [
          if (data_interface != null &&
              data_interface!['subclinical_request_details'].length > 0) ...[
            if (data_interface!['subclinical_request_details'][0]['service'] !=
                    null &&
                data_interface!['subclinical_request_details'][0]['service']
                        ['name'] !=
                    null) ...[
              Heading2(
                  devideSize: 1,
                  infoValue:
                      '${data_interface!['subclinical_request_details'][0]['service']['name']}'),
            ],
            if (data_interface!['doctor'] != null &&
                data_interface!['doctor']['fullname'] != null) ...[
              infoText(
                  devideSize: 1,
                  infoKey: 'Bác sĩ chỉ định',
                  infoValue: data_interface!['doctor']['fullname']),
            ],
            if (data_interface!['created_at'] != null) ...[
              infoText(
                  devideSize: 1,
                  infoKey: "Ngày chỉ định",
                  infoValue:
                      data_interface!['created_at'].toString().split('T')[0]),
            ],
            Container(
              padding: const EdgeInsets.only(top: 17, bottom: 17),
              child: Wrap(
                children: [
                  Heading3(
                      devideSize: 1, infoKey: 'Mô tả hình ảnh', infoValue: ''),
                ],
              ),
            ),
            if (data_interface!['subclinical_results'] != null &&
                data_interface!['subclinical_results'].length > 0 &&
                data_interface!['subclinical_results'][0]['describe_text'] !=
                    null) ...[
              Container(
                padding: EdgeInsets.only(left: 17),
                child: Wrap(
                  children: [
                    Text(data_interface!['subclinical_results'][0]
                        ['describe_text'])
                  ],
                ),
              ),
            ],
            if (data_interface!['service_group'] != null &&
                data_interface!['service_group']['name'] != null) ...[
              if (data_interface!['service_group']['name']
                      .contains('X - Quang') ==
                  true) ...[
                if (data_interface!['thuong_subclinical_images'].length > 0 &&
                    data_interface!['thuong_subclinical_images'][0] != null &&
                    data_interface!['thuong_subclinical_images'][0]['url'] !=
                        null) ...[
                  Container(
                    padding: EdgeInsets.all(17),
                    child: Image.network(
                      '${data_interface!['thuong_subclinical_images'][0]['url']}',
                      width: size.width - 17 * 3,
                    ),
                  ),
                ],
              ] else if (data_interface!['service_group']['name']
                      .contains('Siêu Âm') ==
                  true) ...[
                if (data_interface!['thuong_subclinical_images'].length >
                    0) ...[
                  Center(
                    child: Wrap(
                      children: [
                        for (int index = 0;
                            index <
                                data_interface!['thuong_subclinical_images']
                                    .length;
                            index++) ...[
                          if (data_interface!['thuong_subclinical_images']
                                      [index] !=
                                  null &&
                              data_interface!['thuong_subclinical_images']
                                      [index]['url'] !=
                                  null) ...[
                            Image.network(
                              '${data_interface!['thuong_subclinical_images'][index]['url']}',
                              width: (size.width) / 2 * 0.8,
                            ),
                            SizedBox(
                              width: size.width / 40,
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ],
              ] else if (data_interface!['service_group']['name']
                      .contains('Nội Soi') ==
                  true) ...[
                if (data_interface!['thuong_subclinical_images'].length >
                    0) ...[
                  Center(
                    child: Wrap(
                      children: [
                        for (int index = 0;
                            index <
                                data_interface!['thuong_subclinical_images']
                                    .length;
                            index++) ...[
                          if (data_interface!['thuong_subclinical_images']
                                      [index] !=
                                  null &&
                              data_interface!['thuong_subclinical_images']
                                      [index]['url'] !=
                                  null) ...[
                            Image.network(
                              '${data_interface!['thuong_subclinical_images'][index]['url']}',
                              width: (size.width) / 2 * 0.8,
                            ),
                            SizedBox(
                              width: size.width / 40,
                            ),
                          ],
                        ],
                        // if (data_interface!['thuong_subclinical_images'][0] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][0]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][0]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                        // if (data_interface!['thuong_subclinical_images'][1] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][1]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][1]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                        // if (data_interface!['thuong_subclinical_images'][2] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][2]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][2]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                        // if (data_interface!['thuong_subclinical_images'][3] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][3]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][3]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                        // if (data_interface!['thuong_subclinical_images'][4] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][4]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][4]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                        // if (data_interface!['thuong_subclinical_images'][5] !=
                        //         null &&
                        //     data_interface!['thuong_subclinical_images'][5]
                        //             ['url'] !=
                        //         null) ...[
                        //   Image.network(
                        //     '${data_interface!['thuong_subclinical_images'][5]['url']}',
                        //     width: (size.width) / 2 * 0.8,
                        //   ),
                        // ],
                      ],
                    ),
                  ),
                ],
              ]
            ],
            if (data_interface!['subclinical_results'] != null &&
                data_interface!['subclinical_results'].length > 0 &&
                data_interface!['subclinical_results'][0]['conclusion'] !=
                    null) ...[
              Container(
                padding: const EdgeInsets.only(top: 17),
                child: Wrap(
                  children: [
                    Heading3(
                        devideSize: 1,
                        infoKey: 'Kết luận: ',
                        infoValue:
                            '\n\t${data_interface!['subclinical_results'][0]['conclusion']}'),
                  ],
                ),
              ),
            ]
          ],
          // SafeArea(child: ExpantionPrescreption()),
        ],
      ),
    );
  }
}

class ExpantionPrescreption extends StatelessWidget {
  const ExpantionPrescreption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ExpansionTile(
      title: Heading2(devideSize: 1, infoValue: 'Về kê toa thuốc'),
      children: [
        Wrap(
          children: [
            for (int index = 0; index < 2; index++) ...[
              Heading3(
                  devideSize: 1,
                  infoKey: "\t${index + 1}. ",
                  infoValue: 'Fluconazole(FLUCONAZOL 150mg) Viên - Uống'),
              Container(
                  padding: EdgeInsets.all(17),
                  child: Wrap(
                    children: [
                      infoText(
                          devideSize: 1,
                          infoKey: "Số ngày điều trị",
                          infoValue: '3'),
                      infoText(
                          devideSize: 1,
                          infoKey: "Ghi chú",
                          infoValue: 'uống sau ăn'),
                      infoText(devideSize: 4, infoKey: "Sáng", infoValue: '1'),
                      infoText(devideSize: 4, infoKey: "Trưa", infoValue: ''),
                      infoText(devideSize: 4, infoKey: "Chiều", infoValue: ''),
                      infoText(devideSize: 4, infoKey: "Tối", infoValue: '1'),
                      infoText(
                          devideSize: 1, infoKey: "Tổng cộng", infoValue: '6'),
                    ],
                  )),
            ],
            infoText(
                devideSize: 1,
                infoKey: "Lời dặn",
                infoValue: 'Uống hết thuốc nghỉ 1 tuần --> tái khám'),
            infoText(
                devideSize: 1, infoKey: "Ngày tái khám", infoValue: 'Khác'),
          ],
        ),
      ],
    );
  }
}
