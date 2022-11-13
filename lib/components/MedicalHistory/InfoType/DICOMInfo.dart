import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';

class DICOMInfo extends StatefulWidget {
  DICOMInfo({Key? key}) : super(key: key);
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
          Heading2(devideSize: 1, infoValue: 'X-Quang'),
          infoText(
              devideSize: 1,
              infoKey: 'Bác sĩ chỉ định',
              infoValue: doctor_name),
          infoText(
              devideSize: 1,
              infoKey: "Ngày chỉ định",
              infoValue: examination_date),
          infoText(devideSize: 1, infoKey: "Chẩn đoán sơ bộ", infoValue: ''),
          infoText(
              devideSize: 1, infoKey: "Nội dung", infoValue: "X-Quang Phổi"),

          Container(
              padding: const EdgeInsets.only(top: 17, bottom: 17),
              child: Wrap(
                children: [
                  Heading3(
                      devideSize: 1, infoKey: 'Mô tả hình ảnh', infoValue: ''),
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 17),
              child: Wrap(
                children: [
                  infoText(
                      devideSize: 1,
                      infoKey: "Tổn thương nhu mô trong hai phổi",
                      infoValue: 'Không rõ'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Hạch phì đại tại các rốn phổi",
                      infoValue: 'Không có'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Màng phổi 2 bên",
                      infoValue: 'Bình thường'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Cơ hoành",
                      infoValue: 'Bình thường'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Bóng tim",
                      infoValue: 'Không to'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Các mạch máu chính",
                      infoValue: 'Quai động mạch chủ bình thường'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Trung thất",
                      infoValue: 'Không mở rộng, không có hạch phì đại'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Lồng ngực và mô mềm",
                      infoValue: 'Bình thường'),
                  infoText(
                      devideSize: 1,
                      infoKey: "Ghi nhận khác",
                      infoValue: 'không có'),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 17),
              child: Wrap(
                children: [
                  Heading3(
                      devideSize: 1,
                      infoKey: 'Kết luận: ',
                      infoValue: '\n\tHÌNH ẢNH X-QUANG TIM PHỔI THẲNG BÌNH THƯỜNG'),
                ],
              )),
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
