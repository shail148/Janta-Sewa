import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/data/status_data.dart';


import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class TrackPage extends StatefulWidget {
const  TrackPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.orange;
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Status".tr,
                color: AppColors.textColor,
                fontsize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
            //  Divider(thickness: 1.2, color: AppColors.btnBgColor),
              Expanded(
                child: ListView.builder(
                  itemCount: statusData.length,
                  itemBuilder: (context, index) {
                    final item = statusData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.btnBgColor,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Application ID : ${item['applicationId']}",
                            fontsize: 12,
                          ),
                          CustomTextWidget(text: "Name of Applicant : ${item['applicantName']}",fontsize: 12,),
                          CustomTextWidget(text: "Type of Request : ${item['requestType']}",fontsize: 12,),
                          CustomTextWidget(text: "Submitted on : ${item['submittedOn']}",fontsize: 12,),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Status : ',
                                  style: const TextStyle(color: Colors.black,fontFamily: 'Poppins', fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: item['status'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,fontFamily: 'Poppins', fontSize: 12,
                                        color: widget.getStatusColor(
                                          item['status'],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomTextWidget(
                                text: 'view_details'.tr,
                                  color: AppColors.btnBgColor,
                                fontsize: 12,
                                  fontWeight: FontWeight.bold,
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
