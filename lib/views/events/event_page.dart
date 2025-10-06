import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/widgets/custom_app_bar.dart';
import 'package:janta_sewa/widgets/custom_event_card.dart';
import 'package:janta_sewa/localization/language_controller.dart';
import 'package:janta_sewa/data/upcoming_event.dart';
import 'package:janta_sewa/views/bottomTabs/bottom_nav_main_page.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
 final LanguageController languageController = Get.put(LanguageController());

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true, 
                  physics: NeverScrollableScrollPhysics(), 
                  itemCount: languageController.isHindi? upcomingEventHindi.length : upcomingEvent.length,
                  itemBuilder: (context, index) {
                    final event =languageController.isHindi?upcomingEventHindi[index]: upcomingEvent[index];
                    return CustomEventCard(
                      imageUrl: event['imageUrl'],
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
