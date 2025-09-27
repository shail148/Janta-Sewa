import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/data/status_data.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "In Process":
        return const Color(0xFF356CC5);
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w), // w responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "status".tr,
                color: AppColors.textColor,
                fontsize: 16, // font
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h), // h
              Expanded(
                child: ListView.builder(
                  itemCount: statusData.length,
                  itemBuilder: (context, index) {
                    final item = statusData[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.h), // h
                      elevation: 0,
                      color: const Color(0xFFDDDBE6).withAlpha(30),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: const Color(0xFF403572).withValues(alpha: 0.2),
                          width: 1, // w
                        ),
                        borderRadius: BorderRadius.circular(16), // rad
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 0.h,
                          left: 8.w,
                          right: 8.w,
                          bottom: 8.h,
                        ), // h
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              margin: EdgeInsets.symmetric(vertical: 8.h), // h
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1, // width
                                  color: const Color(
                                    0xFF403572,
                                  ).withValues(alpha: 0.2),
                                ),
                                borderRadius: BorderRadius.circular(12), // rad
                              ),
                              color: AppColors.white,
                              child: Padding(
                                padding: EdgeInsets.all(12.w), // width
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 2.h,
                                      ), //h
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6F8FA),
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ), //rad
                                      ),
                                      child: Text(
                                        item['applicationId'],
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 12, // font size responsive
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h), // height responsive
                                    _infoRow(
                                      icon: Icons.person,
                                      text:
                                          "${'name_of_applicant :'.tr} ${item['applicantName']}",
                                    ),
                                    SizedBox(height: 6.h), // h
                                    _infoRow(
                                      icon: Icons.calendar_today,
                                      text:
                                          "${'submitted_on :'.tr} ${item['submittedOn']}",
                                    ),
                                    SizedBox(height: 6.h), // h
                                    _infoRow(
                                      icon: Icons.message,
                                      text:
                                          "${'type_of_request :'.tr} ${item['requestType']}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.w), // padding
                              child: Row(
                                children: [
                                  SizedBox(width: 4.w), // width
                                  Icon(
                                    Icons.access_time,
                                    size: 20,
                                  ), // icon size
                                  SizedBox(width: 8.w), // w
                                  Text(
                                    'Status :',
                                    style: TextStyle(fontSize: 12), // font
                                  ),
                                  SizedBox(width: 6.w), // width responsive
                                  Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.035,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.23,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 4.h,
                                    ), // h
                                    decoration: BoxDecoration(
                                      color: widget
                                          .getStatusColor(item['status'])
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ), // rad
                                    ),
                                    child: Text(
                                      item['status'],
                                      style: TextStyle(
                                        color: widget.getStatusColor(
                                          item['status'],
                                        ),
                                        fontSize: 12, // font
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.035,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 2.h,
                                      ), // h
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ), // radius
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "view".tr,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 11, // sp
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: 4.w), // w
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 12, // sp
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
        Icon(icon, size: 20, color: Colors.black), // icon size
        SizedBox(width: 8.w), // width responsive
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12), // font
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



 */