import 'package:flutter/material.dart';
import 'package:app_1/components/Buttons.dart';
import 'package:app_1/components/Field.dart';
import 'package:app_1/components/MedicalHistory/ExpansionPanelListMedicalHistory.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PatientInfo extends StatelessWidget {
  var patient;
  PatientInfo({Key? key, required this.patient}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    print('patient info $patient');
    Size size = MediaQuery.of(context).size;
    String namePatient;
    return Column(
      children: <Widget>[
        buildPatientInfo(context),
      ],
    );
  }

  Widget buildPatientInfo(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('fetch data patient');
    print('data patient patientInfo: $patient');
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          if (patient != null) ...[
            HavePatientInfo(
              size: size,
              patient: patient,
            )
          ] else ...[
            NullPatientInfo(size: size),
          ]
        ],
      ),
    );
  }
}

class HavePatientInfo extends StatelessWidget {
  var patient;
  HavePatientInfo({
    Key? key,
    required this.size,
    required this.patient,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      alignment: Alignment.centerLeft,
      width: size.width,
      child: Wrap(
        children: <Widget>[
          infoText(
              devideSize: 1,
              infoKey: "Họ và tên",
              infoValue: patient['patient']['fullname']),
          infoText(
              devideSize: 1,
              infoKey: "Địa chỉ",
              infoValue: '423/43 Ung Văn Khiêm,P.25,Q.Bình Thạnh,TP.HCM'),
          infoText(
              devideSize: 2, infoKey: "Ngày sinh", infoValue: '29-10-2012'),
          infoText(devideSize: 2, infoKey: "Giới tính", infoValue: 'Nam'),
          const PatientMedicalHistory(),
        ],
      ),
    );
  }
}

class NullPatientInfo extends StatelessWidget {
  const NullPatientInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      alignment: Alignment.centerLeft,
      width: size.width,
      child: Wrap(
        children: <Widget>[
          infoText(
              devideSize: 1, infoKey: "Họ và tên", infoValue: 'Nguyễn Văn A'),
          infoText(
              devideSize: 1,
              infoKey: "Địa chỉ",
              infoValue: '423/43 Ung Văn Khiêm,P.25,Q.Bình Thạnh,TP.HCM'),
          infoText(
              devideSize: 2, infoKey: "Ngày sinh", infoValue: '29-10-2012'),
          infoText(devideSize: 2, infoKey: "Giới tính", infoValue: 'Nam'),
          const PatientMedicalHistory(),
        ],
      ),
    );
  }
}
