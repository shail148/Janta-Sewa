import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/data/status_data.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "In Process":
        return const Color(0xFF356CC5)
;
      default:
        return Colors.orange; // Pending
    }
  }


  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFDDDBE6).withAlpha(76), // same card bg
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "status".tr,
                color: AppColors.textColor,
                fontsize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: statusData.length,
                  itemBuilder: (context, index) {
                    final item = statusData[index];
                    
                    //outer card under which another card exist
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 0,
                     color: const Color(0xFFDDDBE6).withAlpha(30), //background color outer card
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: const Color(0xFF403572).withValues(alpha: 0.2), // border outer card
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 8, right: 8, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Inner white card similar to CustomInfoCard pill
                            Card(
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: const Color(0xFF403572).withValues(alpha: 0.2),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, left: 12, right: 12, bottom: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Application ID pill
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6F8FA),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        item['applicationId'],
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Name
                                    _infoRow(
                                      icon: Icons.person,
                                      text:
                                          "${'name_of_applicant :'.tr} ${item['applicantName']}",
                                    ),
                                    const SizedBox(height: 6),

                                    // Date
                                    _infoRow(
                                      icon: Icons.calendar_today,
                                      text:
                                          "${'submitted_on :'.tr} ${item['submittedOn']}",
                                    ),
                                    const SizedBox(height: 6),

                                    // Request
                                    _infoRow(
                                      icon: Icons.message,
                                      text:
                                          "${'type_of_request :'.tr} ${item['requestType']}",
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Status + View button
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  const SizedBox(width: 4),
                                  const Icon(Icons.access_time, size: 20),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Status :',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *0.035,
                                    width: MediaQuery.of(context).size.width *0.23,
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: widget
                                          .getStatusColor(item['status'])
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      item['status'],
                                      style: TextStyle(
                                        color:
                                            widget.getStatusColor(item['status']),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate or action
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: MediaQuery.of(context).size.height * 0.035,
                                      
                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // reduce vertical padding

                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min, 
                                        children: [
                                          Text(
                                            "view".tr,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
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
      ),
    );
  }

  Widget _infoRow({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.black),
        const SizedBox(width: 8),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}



/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/data/status_data.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "In Process":
        return AppColors.textColor;
      default:
        return Colors.orange; // Pending
    }
  }

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "status".tr,
                color: AppColors.textColor,
                fontsize: 16,
                // fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: statusData.length,
                  itemBuilder: (context, index) {
                    final item = statusData[index];
                    //outer light grey container or backround
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                      color: AppColors.bgLight, // Light grey background
                      border: Border.all(color: const Color(0xFF403572).withValues(alpha:0.2)), //border color
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                            BoxShadow(
                              color: AppColors.btnBgColor.withValues(alpha: 0.3), // shadow color
                              //blurRadius: 6,                         // softness
                              //spreadRadius: 3,                        // how far it spreads
                              //offset: const Offset(0, 3),             // x,y offset
                          ),
                       ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Inner white container
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.white, //background color
                              border: Border.all(color: const Color(0xFF403572).withValues(alpha:0.2)), //border color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Application ID pill
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                   // color: AppColors.bgLight,
                                    color: Color(0xffF6F8FA),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    item['applicationId'],
                                    style: const TextStyle(
                                      color: AppColors.btnBgColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Name
                                Row(
                                  children: [
                                    const Icon(Icons.person, size: 16),
                                    const SizedBox(width: 6),
                                    CustomTextWidget(
                                      text:
                                          //"name_of_applicant :${item['applicantName']}".tr,
                                          "${'name_of_applicant :'.tr} ${item['applicantName']}",

                                      fontsize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),

                                // Date
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 16),
                                    const SizedBox(width: 6),
                                    CustomTextWidget(
                                      text:
                                          //"Submitted on : ${item['submittedOn']}",
                                          "${'submitted_on :'.tr} ${item['submittedOn']}",

                                      fontsize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),

                                // Request
                                Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.message, size: 16),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: CustomTextWidget(
                                        text:
                                            //"Type of Request : ${item['requestType']}",
                                            "${'type_of_request :'.tr} ${item['requestType']}",

                                        fontsize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Status + View Button outside white container
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.autorenew, // or Icons.loop, Icons.sync
                                    size: 20,
                                    color: AppColors.textGrey,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "status :".tr,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: widget
                                          .getStatusColor(item['status'])
                                          .withAlpha(38),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      item['status'],
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: widget.getStatusColor(
                                          item['status'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // View > Button
                              GestureDetector(
                                onTap: () {
                                  // Navigate or do something
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.btnBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "view".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



 */