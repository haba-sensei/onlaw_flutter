// // ignore_for_file: avoid_print
// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// // import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// // import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class PushNotificationService {
//   late AndroidNotificationChannel channel;

//   late FlutterLocalNotificationsPlugin
//       flutterLocalNotificationsPlugin;

//   void initNotifications() async {
//     channel = const AndroidNotificationChannel(
//       'id',
//       'titulo',
//       description: 'descript',
//       enableVibration: true,
//       playSound: true,
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   void onMessageListener() {
//     // ! RECIBIR NOTIFICACIONES EN SEGUNDO PLANO
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         print('nueva notificacion $message');
//       }
//     });
//     // ! RECIBIR NOTIFICACIONES EN PRIMER PLANO
//     FirebaseMessaging.onMessage
//         .listen((RemoteMessage message) {
//       RemoteNotification? notification =
//           message.notification;
//       AndroidNotification? android =
//           message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 icon: 'launch_background',
//               ),
//             ));
//       }
//     });
//     // ! ACA VA EL METODO TAP DE LA NOTIFICACION PUSH AL OTP RECUERDA
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((RemoteMessage message) async {
//       // ignore: unused_local_variable
//       String? token =
//           await FirebaseMessaging.instance.getToken();

//     });
//   }

//   Future<void> sendMessage(
//       String to,
//       Map<String, dynamic> data,
//       String title,
//       String body) async {
//     Uri uri = Uri.https('fcm.googleapis.com', '/fcm/send');
//     await http.post(uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization':
//               'key=AAAAVxmBpyo:APA91bGoovXLUNFFrhVPBal44bY-L8PlWXkJxY7eiBcKu5hm_JgIyNdu7fM6Zdu7p694zIqy9JoqAviwEbdfrJcfgLSfGJmIHDu9j-O7B3NAqqrmWfupbiur48Dz213u1jAWL9tXzBpu'
//         },
//         body: jsonEncode(<String, dynamic>{
//           'notification': <String, dynamic>{
//             'body': body,
//             'title': title
//           },
//           'priority': 'high',
//           'ttl': '4500s',
//           'data': data,
//           'to': to
//         }));
//   }
// }
