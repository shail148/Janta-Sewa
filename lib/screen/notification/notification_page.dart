import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/data/notification_data.dart';
import 'package:janta_sewa/widget/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(title: 'Notification', leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 2,
                    color: AppColors.formBgColor,  
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Icon
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              getNotificationIcon(notification['subtitle']),
                              color: getColors(notification['subtitle']),
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Right Text Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 2,
                                notification['title'] ?? '',style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  
                                ),
                                                               
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      notification['subtitle'] ?? '',style: TextStyle(
                                  fontSize: 10
                                ),
                                      
                                    
                                    ),
                                    Text(
                                       notification['time'] ?? '',style: TextStyle(
                                  fontSize: 8
                                ),
                                    
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconData getNotificationIcon(String? type) {
  switch (type) {
    case 'Approval Successful':
      return Icons.verified;
    case 'Submission completed':
      return Icons.send;
    case 'Please join the event':
      return Icons.event;
    case 'Alert':
      return Icons.warning;
    default:
      return Icons.notifications;
  }
}



Color getColors(String? colortype) {
  switch (colortype) {
    case 'Approval Successful':
      return Colors.green;
    case 'Alert':
      return Colors.red;
    case '':
      return Colors.orange;
    case 'Submission completed':
      return Colors.blue;
    case 'Please join the event':
      return Colors.grey;
    default:
      return Colors.black; // fallback color
  }
}
