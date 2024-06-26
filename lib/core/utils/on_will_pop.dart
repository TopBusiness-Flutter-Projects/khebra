//import 'package:flutter/material.dart';

//import '../../config/routes/app_routes.dart';

// Future<bool> onWillPop(BuildContext context) async {
//
//     Navigator.pushNamed(context, Routes.homeRoute);
//     return true;
//
// }
// Future<bool> _onWillPop(BuildContext context) async {
//   return (await showDialog(
//         context: context,
//         builder: (context) => new AlertDialog(
//           title: new Text('Are you sure?'),
//           content: new Text('Do you want to exit an App'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               child: new Text('No'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: new Text('Yes'),
//             ),
//           ],
//         ),
//       )) ??
//       false;
// }
