// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:mappy/src/core/internet_checker/internet_not_available.dart';

// class BaseWidget extends StatelessWidget {
//   final Widget child;
//   const BaseWidget({super.key, required this.child});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Visibility(
//             visible:
//                 BlocProvider.of<InternetConnectionStatus>(context) ==
//                 InternetConnectionStatus.disconnected,
//             child: Column(
//               children: [SizedBox(height: 20), const InternetNotAvailable()],
//             ),
//           ),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }
// }
