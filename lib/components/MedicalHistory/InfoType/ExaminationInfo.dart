import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class ExaminationInfo extends StatefulWidget {
  ExaminationInfo({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  State<ExaminationInfo> createState() => _ExaminationInfoState();
}

class _ExaminationInfoState extends State<ExaminationInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String namePatient;
    return Column(
      children: <Widget>[
        TableExaminate(),
      ],
    );
  }
}

class TableExaminate extends StatefulWidget {
  TableExaminate({Key? key}) : super(key: key);
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
          _ExpansionTileSubclinical(
              service_name: 'Dịch vụ ' + bs[0],
              examination_date: 'Ngày ' + bs[1],
              doctor_name: 'Bác sĩ ' + bs[2],
              introductioin_place: 'Nơi giới thiệu ' + bs[3]),
        ],
      ),
    );
  }
}

class _ExpansionTileSubclinical extends StatelessWidget {
  String service_name;
  String examination_date;
  String doctor_name;
  String introductioin_place;
  _ExpansionTileSubclinical(
      {Key? key,
      required this.service_name,
      required this.examination_date,
      required this.doctor_name,
      required this.introductioin_place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      child: Wrap(
        children: [
          infoText(devideSize: 1, infoKey: 'Nội dung', infoValue: service_name),
          infoText(
              devideSize: 1, infoKey: "Khám lúc", infoValue: examination_date),
          infoText(
              devideSize: 1,
              infoKey: "Bác sĩ điều trị",
              infoValue: doctor_name),
          infoText(
              devideSize: 1,
              infoKey: "Phòng khám",
              infoValue: "Phòn khám sàn (Tầng 5)"),
          infoText(devideSize: 2, infoKey: "Mạch", infoValue: ''),
          infoText(devideSize: 2, infoKey: "Huyết áp", infoValue: ''),
          infoText(devideSize: 2, infoKey: "Nhiệt độ", infoValue: ''),
          infoText(devideSize: 2, infoKey: "Nhịp thở", infoValue: ''),
          infoText(devideSize: 2, infoKey: "Chiều cao", infoValue: ''),
          infoText(devideSize: 2, infoKey: "Cân nặng", infoValue: ''),
          infoText(devideSize: 1, infoKey: "Triệu chứng", infoValue: ''),
          infoText(devideSize: 1, infoKey: "Chẩn đoán", infoValue: ''),
          infoText(devideSize: 1, infoKey: "Mã ICD", infoValue: ''),
          infoText(devideSize: 1, infoKey: "Tên ICD", infoValue: ''),
          SafeArea(child: ExpantionPrescreption()),
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
      title:
          Heading2(devideSize: 1, infoValue: 'Về kê toa thuốc'),
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
