import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/views/servicesDepartment/constructions/constructions_menu_page.dart';
import 'package:janta_sewa/views/servicesDepartment/hospital/hospital_admission_page.dart';
import 'package:janta_sewa/views/servicesDepartment/parliamentVisit/parliament_visit_page.dart';
import 'package:janta_sewa/views/servicesDepartment/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/res/colors/app_color.dart';

class ServicesHomeListWidget extends StatelessWidget {
  const ServicesHomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Train Ticket\nConfirmation',
        'image': 'assets/images/train.png',
        'page': () => const TicketConfirmation(),
        'color': const Color(0xFFAAE7E2),
        'zoom': 1.0,
        'alignment': Alignment.topLeft,

      },
      {
        'title': 'Hospital\nAdmission',
        'image': 'assets/images/hospital.png',
        'page': () => const HospitalAdmission(),
        'color': const Color(0xFFE1ECFE),
        'zoom': 1.3,
       'alignment': Alignment.center,

      },
      {
        'title': 'Parliament\nVisit',
        'image': 'assets/images/parliament.png',
        'page': () => const ParliamentVisit(),
        'color': const Color(0xFFF6F4F5),
        'zoom' : 0.93,
        'alignment': Alignment.topRight, //bottomRight

      },
      {
        'title': 'Construction\nWork',
        'image': 'assets/images/construction.png',
        'page': () => const ConstructionsMenu(),
        'color': const Color(0xFFC2E6F2),
        'zoom' : 0.9,
        'alignment': const Alignment(-0.20, 0.3),   // shifts image slightly left & down
        //'alignment': Alignment.centerLeft,
        'offset': const Offset(-4,12), // x, y in logical pixels


      },
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        padding: const EdgeInsets.only(right: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () {
              final pageBuilder = service['page'] as Widget Function();
              Get.to(pageBuilder());
            },
            child: Column(
              children: [
                Container(
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                    color: service['color'] ?? AppColors.bgLight,
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge, // Ensures circular clip
                  child: Transform.translate(
                     offset: service['offset'] ?? Offset.zero, // x, y in logical pixels
                    child: Transform.scale(
                      scale: service['zoom'] ?? 1.0,
                      child: Image.asset(
                        service['image'],
                        fit: BoxFit.cover, // Zooms and crops the image, //cover
                        alignment: service['alignment'] ?? Alignment.center,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 80,
                  child: Text(
                    service['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
