import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class ExaminationInfo extends StatefulWidget {
  var data_interface;
  ExaminationInfo({Key? key, required this.data_interface}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  State<ExaminationInfo> createState() =>
      _ExaminationInfoState(data_interface: data_interface);
}

class _ExaminationInfoState extends State<ExaminationInfo> {
  var data_interface;
  _ExaminationInfoState({Key? key, required this.data_interface});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String namePatient;
    return Column(
      children: <Widget>[
        TableExaminate(data_interface: data_interface),
      ],
    );
  }
}

class TableExaminate extends StatefulWidget {
  var data_interface;
  TableExaminate({Key? key, required this.data_interface}) : super(key: key);
  State<TableExaminate> createState() =>
      _TableExaminateState(data_interface: data_interface);
}

class _TableExaminateState extends State<TableExaminate> {
  var data_interface;
  _TableExaminateState({Key? key, required this.data_interface});
  @override
  Widget build(BuildContext context) {
    List bs = ["a", "b", "c", "d"];
    return Container(
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: <Widget>[
          _ExpansionTileSubclinical(data_interface: data_interface),
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
    return Container(
      padding: EdgeInsets.all(17),
      child: Wrap(
        // thông tin khám bệnh
        children: [
          if (data_interface != null &&
              data_interface!['service'] != null &&
              data_interface!['service']['name'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: 'Nội dung',
                infoValue: data_interface!['service']['name']),
          ],
          if (data_interface != null &&
              data_interface!['examine_time'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Khám lúc",
                infoValue: data_interface!['examine_time']),
          ],
          if (data_interface != null &&
              data_interface!['examine_doctor'] != null &&
              data_interface!['examine_doctor']['fullname'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Bác sĩ điều trị",
                infoValue: data_interface!['examine_doctor']['fullname']),
          ],
          if (data_interface != null &&
              data_interface!['clinic'] != null &&
              data_interface!['clinic']['name'] != null)
            infoText(
                devideSize: 1,
                infoKey: "Phòng khám",
                infoValue: "${data_interface!['clinic']['name']}"),
          if (data_interface != null && data_interface!['pulse'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Mạch",
                infoValue: "${data_interface!['pulse']} lần/phút"),
          ],
          if (data_interface != null &&
              data_interface!['high_blood_pressure'] != null &&
              data_interface!['low_blood_pressure'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Huyết áp",
                infoValue:
                    '${data_interface!['high_blood_pressure']}/${data_interface!['low_blood_pressure']} mmHG'),
          ],
          if (data_interface != null &&
              data_interface!['temperature'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Nhiệt độ",
                infoValue: '${data_interface!['temperature']} °C'),
          ],
          if (data_interface != null &&
              data_interface!['breathing'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Nhịp thở",
                infoValue: '${data_interface!['breathing']} lần/phút'),
          ],
          if (data_interface != null && data_interface!['height'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Chiều cao",
                infoValue: '${data_interface!['height']} cm'),
          ],
          if (data_interface != null && data_interface!['weight'] != null) ...[
            infoText(
                devideSize: 2,
                infoKey: "Cân nặng",
                infoValue: '${data_interface!['weight']} kg'),
          ],
          if (data_interface != null &&
              data_interface!['clinical_sign'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Triệu chứng",
                infoValue: '${data_interface!['clinical_sign']}'),
          ],
          if (data_interface != null &&
              data_interface!['preliminary_diagnosis'] != null) ...[
            infoText(
                devideSize: 1,
                infoKey: "Chẩn đoán",
                infoValue: '${data_interface!['preliminary_diagnosis']}'),
          ],
          // infoText(devideSize: 1, infoKey: "Mã ICD", infoValue: ''),
          // infoText(devideSize: 1, infoKey: "Tên ICD", infoValue: ''),
          if (data_interface != null &&
              data_interface!['medical_examination_prescriptions'].length >
                  0) ...[
            SafeArea(
              child: ExpantionPrescreption(
                  data_examination_prescriptions:
                      data_interface!['medical_examination_prescriptions']),
            ),
          ],
        ],
      ),
    );
  }
}

class ExpantionPrescreption extends StatelessWidget {
  var data_examination_prescriptions;
  ExpantionPrescreption(
      {Key? key, required this.data_examination_prescriptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data_prescription = null;
    if (data_examination_prescriptions.length > 0) {
      print(
          'chuyển data vào đơn thuốc: khám-thuốc: ${data_examination_prescriptions.length}');
    }
    return ExpansionTile(
      title: Heading2(devideSize: 1, infoValue: 'Về kê toa thuốc'),
      children: [
        Wrap(
          children: [
            for (int index = 0;
                index < data_examination_prescriptions.length;
                index++) ...[
              if (data_examination_prescriptions.length > 0 &&
                  data_examination_prescriptions![index] != null &&
                  data_examination_prescriptions![index]['prescriptions']
                          .length >
                      0) ...[
                for (int index2 = 0;
                    index2 <
                        data_examination_prescriptions![index]['prescriptions']
                            .length;
                    index2++) ...[
                  if (data_examination_prescriptions![index]
                          ['prescriptions']![index2] !=
                      null) ...[
                    Prescription(
                      index: index2,
                      prescription: data_examination_prescriptions![index]
                          ['prescriptions']![index2],
                    )
                  ],
                ],
              ],
              if (data_examination_prescriptions.length > 0 &&
                  data_examination_prescriptions![index] != null &&
                  data_examination_prescriptions![index]['note'] != null) ...[
                infoText(
                    devideSize: 1,
                    infoKey: "Lời dặn",
                    infoValue:
                        '${data_examination_prescriptions![index]['note']}'),
              ] else ...[
                infoText(devideSize: 1, infoKey: "Lời dặn", infoValue: ''),
              ]
            ],
          ],
        ),
      ],
    );
  }
}

class Prescription extends StatelessWidget {
  Prescription({Key? key, required this.index, required this.prescription})
      : super(key: key);

  final int index;
  var prescription = null;

  @override
  Widget build(BuildContext context) {
    print('prescription: $prescription');
    String titlePrescription = "";
    if (prescription != null &&
        prescription!['medicine'] != null &&
        prescription!['medicine']['medicine_name'] != null &&
        prescription!['medicine']['medicine_name']['name'] != null) {
      titlePrescription +=
          '${prescription!['medicine']['medicine_name']['name']}';
    }
    if (prescription!['medicine_using'] != null &&
        prescription!['medicine_using']['name'] != null) {
      titlePrescription += ' - ${prescription!['medicine_using']['name']}';
    }
    return SafeArea(
        child: Wrap(
      children: [
        Heading3(
            devideSize: 1,
            infoKey: "\t${index + 1}. ",
            infoValue: titlePrescription),
        Container(
          padding: EdgeInsets.all(17),
          child: Wrap(
            children: [
              if (prescription != null && prescription!['dates'] != null) ...[
                infoText(
                    devideSize: 1,
                    infoKey: "Số ngày điều trị",
                    infoValue: '${prescription!['dates']}'),
              ],
              if (prescription != null && prescription!['note'] != null) ...[
                infoText(
                    devideSize: 1,
                    infoKey: "Ghi chú",
                    infoValue: '${prescription!['note']}'),
              ],
              if (prescription != null &&
                  prescription!['quantity_morning'] != null) ...[
                infoText(
                    devideSize: 4,
                    infoKey: "Sáng",
                    infoValue: '${prescription!['quantity_morning']}'),
              ] else ...[
                infoText(devideSize: 4, infoKey: "Sáng", infoValue: ''),
              ],
              if (prescription != null &&
                  prescription!['quantity_evening'] != null) ...[
                infoText(
                    devideSize: 4,
                    infoKey: "Trưa",
                    infoValue: '${prescription!['quantity_morning']}'),
              ] else ...[
                infoText(devideSize: 4, infoKey: "Trưa", infoValue: ''),
              ],
              if (prescription != null &&
                  prescription!['quantity_noon'] != null) ...[
                infoText(
                    devideSize: 4,
                    infoKey: "Chiều",
                    infoValue: '${prescription!['quantity_noon']}'),
              ] else ...[
                infoText(devideSize: 4, infoKey: "Chiều", infoValue: ''),
              ],
              if (prescription != null &&
                  prescription!['quantity_night'] != null) ...[
                infoText(
                    devideSize: 4,
                    infoKey: "Tối",
                    infoValue: '${prescription!['quantity_night']}'),
              ] else ...[
                infoText(devideSize: 4, infoKey: "Tối", infoValue: ''),
              ],
              if (prescription != null &&
                  prescription!['quantity'] != null) ...[
                infoText(
                    devideSize: 1,
                    infoKey: "Tổng cộng",
                    infoValue: '${prescription!['quantity']}'),
              ] else ...[
                infoText(devideSize: 1, infoKey: "Tổng cộng", infoValue: ''),
              ],
            ],
          ),
        ),
      ],
    ));
  }
}
