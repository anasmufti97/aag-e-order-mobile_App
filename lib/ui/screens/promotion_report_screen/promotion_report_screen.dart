// import 'package:aag_e_order_app/utils/constants/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class PromotionReportScreen extends StatefulWidget {
//   const PromotionReportScreen({Key? key}) : super(key: key);
//
//   @override
//   _PromotionReportScreenState createState() => _PromotionReportScreenState();
// }
//
// class _PromotionReportScreenState extends State<PromotionReportScreen> {
//
//   bool _isSampling = true;
//   bool _isExtraExposure = true;
//   bool _isPriceDiscount = true;
//
//   bool _isEntrance = true;
//   bool _isExit = true;
//   bool _isCashier = true;
//   bool _isOther = true;
//
//   bool _isYes = true;
//   bool _isNo = true;
//
//
//
//   var durationController = TextEditingController();
//
//
//   void _onRadioChanged(bool value) {
//     setState(() {
//       _isSampling = value;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.green,
//         title: const Text(
//           "Promotion report screen",
//           style: TextStyle(color: AppColors.offWhite),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Card(
//                 elevation: 5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   const Padding(
//                      padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
//                      child:  Text("Promotion type*",style: TextStyle(fontSize: 16),),
//                    ),
//                    const Divider(thickness: 1,color: AppColors.lightGrey,),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           groupValue: _isSampling,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           activeColor: Colors.white,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Sampling",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           activeColor: Colors.white,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           groupValue: _isExtraExposure,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Extra Exposure",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           activeColor: Colors.white,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           groupValue: _isPriceDiscount,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Price Discount",),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height*0.02,),
//               Card(
//                 elevation: 5,
//                 child:
//                   Column(
//                     children: [
//                       SizedBox(height: size.height*0.01,),
//                       TextField(
//                         controller: durationController,
//                         keyboardType: TextInputType.number,
//                         decoration:const InputDecoration(
//                             labelText: '    Duration(days)*',
//                             labelStyle: TextStyle(fontSize: 16),
//                             hintStyle:
//                             TextStyle(color: Colors.grey, fontSize: 10)),
//                         style:const TextStyle(fontSize: 14),
//                       ),
//                       SizedBox(height: size.height*0.01,),
//                     ],
//                   ),
//               ),
//               SizedBox(height: size.height*0.02,),
//               Card(
//                 elevation: 5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
//                       child:  Text("Position",style: TextStyle(fontSize: 16),),
//                     ),
//                     const Divider(thickness: 1,color: AppColors.lightGrey,),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           groupValue: _isEntrance,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           activeColor: Colors.white,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Entrance",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           groupValue: _isExit,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           activeColor: Colors.white,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Exit",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           activeColor: Colors.white,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           groupValue: _isCashier,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("At Cashier",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           activeColor: Colors.white,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           groupValue: _isOther,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("-other-",),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height*0.02,),
//               Card(
//                 elevation: 5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
//                       child:  Text("Stall",style: TextStyle(fontSize: 16),),
//                     ),
//                     const Divider(thickness: 1,color: AppColors.lightGrey,),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           groupValue: _isYes,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           activeColor: Colors.white,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("Yes",),
//                     ),
//                     ListTile(
//                       leading: Radio(
//                           value: false,
//                           groupValue: _isNo,
//                           fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//                           activeColor: Colors.white,
//                           onChanged: (value) {
//                             _onRadioChanged(value as bool);
//                           }),
//                       title:const Text("No",),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height*0.02,),
//               Card(
//                 elevation: 5,
//                 child:
//                 Column(
//                   children: [
//                     SizedBox(height: size.height*0.01,),
//                     TextField(
//                       controller: durationController,
//                       keyboardType: TextInputType.number,
//                       decoration:const InputDecoration(
//                           labelText: '    No of Employees',
//                           labelStyle: TextStyle(fontSize: 16),
//                           hintStyle:
//                           TextStyle(color: Colors.grey, fontSize: 10)),
//                       style:const TextStyle(fontSize: 14),
//                     ),
//                     SizedBox(height: size.height*0.01,),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height*0.02,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
