// import 'package:aag_e_order_app/utils/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:motion_toast/resources/arrays.dart';
//
// class MinutesOfMeetingScreen extends StatefulWidget {
//   const MinutesOfMeetingScreen({Key? key}) : super(key: key);
//
//   @override
//   _MinutesOfMeetingScreenState createState() => _MinutesOfMeetingScreenState();
// }
//
// class _MinutesOfMeetingScreenState extends State<MinutesOfMeetingScreen> {
//   var participantsController = TextEditingController();
//   var issuesController = TextEditingController();
//   var conclusionsController = TextEditingController();
//   var nextStepController = TextEditingController();
//   bool _isYes = true;
//   bool _isNo = true;
//   bool _isSampling = true;
//
//   void _displayDeleteMotionToast() {
//     MotionToast.delete(
//       title: 'Deleted',
//       titleStyle: const TextStyle(fontWeight: FontWeight.bold),
//       description: 'The item is deleted',
//       animationType: ANIMATION.fromTop,
//       position: MOTION_TOAST_POSITION.top,
//     ).show(context);
//   }
//
//   void _onRadioChanged(bool value) {
//     setState(() {
//       _isSampling = value;
//     });
//   }
//
//   DateTime selectedDate = DateTime.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.green,
//         title: const Text(
//           "Minutes of meeting",
//           style: TextStyle(color: AppColors.offWhite),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 _displayDeleteMotionToast();
//               },
//               icon: Icon(Icons.delete_rounded))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "Issues discussed*",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: TextField(
//                       controller: issuesController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                           // labelText: '    Duration(days)*',
//                           labelStyle: TextStyle(fontSize: 16),
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 10)),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "Participants",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: TextField(
//                       controller: participantsController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                           // labelText: '    Duration(days)*',
//                           labelStyle: TextStyle(fontSize: 16),
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 10)),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "Conclusions",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: TextField(
//                       controller: conclusionsController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                           // labelText: '    Duration(days)*',
//                           labelStyle: TextStyle(fontSize: 16),
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 10)),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "Next Step",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: TextField(
//                       controller: nextStepController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                           // labelText: '    Duration(days)*',
//                           labelStyle: TextStyle(fontSize: 16),
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 10)),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "Next Contact date",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('${selectedDate}'),
//                         RaisedButton(
//                           color: AppColors.green,
//                           onPressed: () => _selectDate(context),
//                           child: const Text(
//                             'Pick Date',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Card(
//               elevation: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                     child: Text(
//                       "issues Closed*",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: AppColors.lightGrey,
//                   ),
//                   ListTile(
//                     leading: Radio(
//                         value: false,
//                         groupValue: _isYes,
//                         fillColor: MaterialStateColor.resolveWith(
//                             (states) => Colors.grey),
//                         activeColor: Colors.white,
//                         onChanged: (value) {
//                           _onRadioChanged(value as bool);
//                         }),
//                     title: const Text(
//                       "Yes",
//                     ),
//                   ),
//                   ListTile(
//                     leading: Radio(
//                         value: false,
//                         groupValue: _isNo,
//                         fillColor: MaterialStateColor.resolveWith(
//                             (states) => Colors.grey),
//                         activeColor: Colors.white,
//                         onChanged: (value) {
//                           _onRadioChanged(value as bool);
//                         }),
//                     title: const Text(
//                       "No",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
