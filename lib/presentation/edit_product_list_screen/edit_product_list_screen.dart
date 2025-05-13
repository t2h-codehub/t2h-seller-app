// import 'package:flutter/material.dart';
// import 'package:taptohello/presentation/profileScreen/ManageStore/CatalogueScreen/catalogueScreen.dart';

// class EditProductListScreen extends StatefulWidget {
//   // ... (existing code)
// }

// class _EditProductListScreenState extends State<EditProductListScreen> {
//   // ... (existing code)

//   Future<bool> _onBackPressed() async {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Are you sure?'),
//         content: Text("Do you want to Exit ?."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false), // Return `false` if the user cancels.
//             child: Text('No'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(true);
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => CatalogueScreen(productIndex: widget.productIndex),
//                 ),
//               );
//             }, // Return `true` if the user confirms.
//             child: Text('Yes'),
//           ),
//         ],
//       ),
//     ).then((value) => value ?? false); // Ensure a `bool` is returned even if `value` is null.
//   }

//   // ... (rest of the existing code)
// } 