// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// class RedesSociales extends StatelessWidget {
//   final Function onTapGoogle;
//   final Function onTapFacebook;

//   const RedesSociales({
//     Key? key,
//     required this.onTapGoogle,
//     required this.onTapFacebook,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () => onTapGoogle(),
//           child: const CircleAvatar(
//             radius: 25,
//             backgroundColor: Colors.white,
//             child: Image(width: 35, height: 35, image: AssetImage('assets/images/google.png')),
//           ),
//         ),
//         const SizedBox(
//           width: 50,
//         ),
//         GestureDetector(
//           onTap: () => onTapFacebook(),
//           child: const CircleAvatar(
//             radius: 25,
//             backgroundColor: Colors.white,
//             child: Image(width: 35, height: 35, image: AssetImage('assets/images/facebook.png')),
//           ),
//         )
//       ],
//     );
//   }
// }
