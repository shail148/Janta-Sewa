import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_event_card.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/widget/colors.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<Map<String, dynamic>> eventList = [
    {
      "imageUrl": "assets/sliderimages/event.png",
      "description":
          "आप सादर आमंत्रित हैं जनहित एवं लोकहितकारी मूल्यों को समर्पित जनकल्याणकारी समारोह के इस जनचेतना कार्यक्रम में।",
      "date": "22 जुलाई 2025",
    },
    {
      "imageUrl": "assets/sliderimages/event.png",
      "description":
          "इस विशेष महिला सशक्तिकरण कार्यक्रम में आपका स्वागत है, जहां आत्मनिर्भरता और नेतृत्व पर चर्चा होगी।",
      "date": "25 जुलाई 2025",
    },
    {
      "imageUrl": "assets/sliderimages/event.png",
      "description":
          "नगर निगम के सहयोग से आयोजित इस स्वच्छता अभियान में सम्मिलित होकर एक स्वच्छ शहर के निर्माण में योगदान दें।",
      "date": "28 जुलाई 2025",
    },
    {
      "imageUrl": "assets/sliderimages/event.png",
      "description":
          "आप आमंत्रित हैं इस लोकार्पण कार्यक्रम में जिसमें कई ग्रामीण विकास योजनाओं की घोषणा की जाएगी।",
      "date": "30 जुलाई 2025",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.offAll(() => BottomNav());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true, // Important
                  physics: NeverScrollableScrollPhysics(), // Important
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    final event = eventList[index];
                    return CustomEventCard(
                      imageUrl: event['imageUrl'], // ✅ Corrected key
                      description: event['description'],
                      date: event['date'],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
