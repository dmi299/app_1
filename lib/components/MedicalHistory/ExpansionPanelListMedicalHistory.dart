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

// stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle:
//                   const Text('To delete this panel, tap the trash can icon'),
//               trailing: const Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   _data.removeWhere((Item currentItem) => item == currentItem);
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }
