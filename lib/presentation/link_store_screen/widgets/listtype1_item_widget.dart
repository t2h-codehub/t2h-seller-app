// import 'package:flutter/material.dart';
// import 'package:taptohello/core/app_export.dart';

// // ignore: must_be_immutable
// class Listtype1ItemWidget extends StatelessWidget {
//   Listtype1ItemWidget();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: getPadding(
//         left: 20,
//         top: 9,
//         right: 20,
//         bottom: 9,
//       ),
//       decoration: AppDecoration.outlineBlack9003f.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder5,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Card(
//             clipBehavior: Clip.antiAlias,
//             elevation: 0,
//             margin: getMargin(
//               left: 1,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                 getHorizontalSize(
//                   5,
//                 ),
//               ),
//             ),
//             child: Container(
//               height: getSize(
//                 33,
//               ),
//               width: getSize(
//                 33,
//               ),
//               padding: getPadding(
//                 all: 4,
//               ),
//               decoration: AppDecoration.outlineBlack9003f15.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder5,
//               ),
//               child: Stack(
//                 children: [
//                   CustomImageView(
//                     imagePath: ImageConstant.imgImage75,
//                     height: getSize(
//                       25,
//                     ),
//                     width: getSize(
//                       25,
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: getPadding(
//               left: 23,
//               top: 7,
//               bottom: 7,
//             ),
//             child: Text(
//               "Plum Guide",
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.left,
//               style: AppStyle.txtPoppinsSemiBold12,
//             ),
//           ),
//           Spacer(),
//           Container(
//             height: getVerticalSize(
//               16,
//             ),
//             width: getHorizontalSize(
//               36,
//             ),
//             margin: getMargin(
//               top: 8,
//               bottom: 8,
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CustomImageView(
//                   svgPath: ImageConstant.imgMenuWhiteA700,
//                   height: getVerticalSize(
//                     16,
//                   ),
//                   width: getHorizontalSize(
//                     36,
//                   ),
//                   alignment: Alignment.center,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Add",
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppStyle.txtPoppinsMedium10Gray900,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
