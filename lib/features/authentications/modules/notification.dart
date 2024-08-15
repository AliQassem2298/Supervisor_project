// import 'package:flutter/material.dart';

// /*class NotificationItem extends StatelessWidget {
//   final String userImage;
//   final String userName;
//   final String action;
//   final String time;
//   final Color moreIconColor;

//   NotificationItem({
//     required this.userImage,
//     required this.userName,
//     required this.action,
//     required this.time,
//     this.moreIconColor = Colors.black,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage(userImage),
//             radius: 24,
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: '$userName ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextSpan(
//                         text: action,
//                         style: TextStyle(color:Color(0xff4d4c4c)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   time,
//                   style: TextStyle(color:  Color(0xff4d4c4c)),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.more_vert, color:  Color(0xffE4C9E5)),
//             onPressed: () {
//               // Handle more options button press
//             },
//           ),
//         ],
//       ),
//     );
//   }

// }*/
// class NotificationItemData {
//   final String userImage;
//   final String userName;
//   final String action;
//   final String time;

//   NotificationItemData({
//     required this.userImage,
//     required this.userName,
//     required this.action,
//     required this.time,
//   });
// }

// class NotificationItem extends StatelessWidget {
//   final String userImage;
//   final String userName;
//   final String action;
//   final String time;
//   final VoidCallback onDelete;

//   const NotificationItem({
//     required this.userImage,
//     required this.userName,
//     required this.action,
//     required this.time,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(userImage),
//         ),
//         title: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: userName,
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               TextSpan(
//                 text: ' $action',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//         subtitle: Text(time),
//         trailing: PopupMenuButton(
//           onSelected: (value) {
//             if (value == 'delete') {
//               onDelete();
//             }
//           },
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem(
//               value: 'delete',
//               child: Text('Delete'),
//             ),
//           ],
//           icon: Icon(Icons.more_vert, color: Color(0xff36D6E7)),
//         ),
//       ),
//     );
//   }
// }
