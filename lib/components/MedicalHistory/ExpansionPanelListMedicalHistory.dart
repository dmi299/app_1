import 'package:flutter/material.dart';
import 'package:app_1/components/Field.dart';
import 'package:app_1/components/MedicalHistory/InfoType/PatientInfo.dart';

class PatientMedicalHistory extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  const PatientMedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20),
      //   side: BorderSide(color: Colors.black, width: size.width),
      // ),
      // borderRadius: BorderRadius.circular(20),
      // physics: const BouncingScrollPhysics(),
      child: buildText(context),
    );
  }

  Widget buildText(BuildContext context) {
    // Size sizePatientInfo = MediaQuery.of(context).size;
    return ExpansionTile(
      // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
      title: Heading2(devideSize: 1, infoValue: 'Chi tiết thông tin'),
      children: [buildInfoPatient(context)],
    );
  }

  Widget buildInfoPatient(BuildContext context) {
    Size sizePatientInfo = MediaQuery.of(context).size;
    bool isHaveType = false;
    return Wrap(
      children: [
        infoText(devideSize: 2, infoKey: "Tuổi", infoValue: '10'),
        infoText(devideSize: 2, infoKey: "Nhóm máu", infoValue: 'AB'),
        infoText(devideSize: 1, infoKey: "Nghề nghiệp", infoValue: 'Học sinh'),
        infoText(devideSize: 1, infoKey: "Số BHYT", infoValue: '4795440831257'),
        infoText(devideSize: 1, infoKey: "Quốc tịch", infoValue: 'Việt Nam'),
        infoText(devideSize: 1, infoKey: "Dân tộc", infoValue: 'Kinh'),
        infoText(
            devideSize: 1, infoKey: "Số điện thoại", infoValue: '0532917118'),
        infoText(devideSize: 1, infoKey: "Hộ chiếu", infoValue: 'B7456745'),
        infoText(
            devideSize: 1, infoKey: "Số CMND/CCCD", infoValue: '243689573'),
        infoText(
            devideSize: 1,
            infoKey: "Đơn vị công tác",
            infoValue: 'Công ty TNVH A'),
      ],
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: <Widget>[
  //       MyStatefulWidget(),
  //       Container(
  //         width: size.width,
  //       )
  //     ],
  //   );
  // }
}

class PatientMedicalHistoryDetail extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  var patient;

  PatientMedicalHistoryDetail({Key? key, required this.patient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20),
      //   side: BorderSide(color: Colors.black, width: size.width),
      // ),
      // borderRadius: BorderRadius.circular(20),
      // physics: const BouncingScrollPhysics(),
      child: buildText(context),
    );
  }

  Widget buildText(BuildContext context) {
    // Size sizePatientInfo = MediaQuery.of(context).size;
    return ExpansionTile(
      // childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
      title: Heading2(devideSize: 1, infoValue: 'Chi tiết thông tin'),
      children: [buildInfoPatient(context)],
    );
  }

  Widget buildInfoPatient(BuildContext context) {
    Size sizePatientInfo = MediaQuery.of(context).size;
    bool isHaveType = false;
    if (patient['patient']['id_card_no'] != null) {
      print('cmnd: ${patient['patient']}');
    } else {
      print('không có cmnd');
    }
    print('length ${patient['patient']}');

    return Wrap(
      children: [
        if (patient['patient']['age'] != null &&
            patient['patient']['age'] != "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Tuổi",
            infoValue: patient['patient']['age'],
          ),
        ],
        if (patient['patient']['patient_infos'].length >= 0 &&
            patient['patient']['patient_infos'][0] != null &&
            patient['patient']['patient_infos'][0]['career'] != null &&
            patient['patient']['patient_infos'][0]['career']['name'] != null &&
            patient['patient']['patient_infos'][0]['career']['name'] != "") ...[
          infoText(
              devideSize: 1,
              infoKey: "Nghề nghiệp",
              infoValue: patient['patient']['patient_infos'][0]['career']
                  ['name']),
        ],
        if (patient['patient']['patient_hicards'].length > 0 &&
            patient['patient']['patient_hicards'][0] != null &&
            patient['patient']['patient_hicards'][0]['hi_number'] != null &&
            patient['patient']['patient_hicards'][0]['hi_number'] != "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Số BHYT",
            infoValue: patient['patient']['patient_hicards'][0]['hi_number'],
          ),
        ],
        if (patient['patient']['patient_infos'].length > 0 &&
            patient['patient']['patient_infos'][0] != null &&
            patient['patient']['patient_infos'][0]['country'] != null &&
            patient['patient']['patient_infos'][0]['country']['name'] != null &&
            patient['patient']['patient_infos'][0]['country']['name'] !=
                "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Quốc tịch",
            infoValue: patient['patient']['patient_infos'][0]['country']
                ['name'],
          ),
        ],
        if (patient['patient']['patient_infos'].length >= 0 &&
            patient['patient']['patient_infos'][0] != null &&
            patient['patient']['patient_infos'][0]['ethnic_group'] != null &&
            patient['patient']['patient_infos'][0]['ethnic_group']['name'] !=
                null &&
            patient['patient']['patient_infos'][0]['ethnic_group']['name'] !=
                "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Dân tộc",
            infoValue: patient['patient']['patient_infos'][0]['ethnic_group']
                ['name'],
          ),
        ],
        if (patient['patient']['phone_number'] != null &&
            patient['patient']['phone_number'] != "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Số điện thoại",
            infoValue: patient['patient']['phone_number'],
          ),
        ],
        if (patient['patient']['passport'] != null &&
            patient['patient']['passport'] != "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Hộ chiếu",
            infoValue: patient['patient']['passport'],
          ),
        ],
        if (patient['patient']['id_card_no'] != null &&
            patient['patient']['id_card_no'] != "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Số CMND/CCCD",
            infoValue: patient['patient']['id_card_no'],
          ),
        ],
        if (patient['patient']['patient_infos'].length >= 0 &&
            patient['patient']['patient_infos'][0] != null &&
            patient['patient']['patient_infos'][0]['work_unit'] != null &&
            patient['patient']['patient_infos'][0]['work_unit']['name'] !=
                null &&
            patient['patient']['patient_infos'][0]['work_unit']['name'] !=
                "") ...[
          infoText(
            devideSize: 1,
            infoKey: "Đơn vị công tác",
            infoValue: patient['patient']['patient_infos'][0]['work_unit']
                ['name'],
          ),
        ],
      ],
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: <Widget>[
  //       MyStatefulWidget(),
  //       Container(
  //         width: size.width,
  //       )
  //     ],
  //   );
  // }
}
