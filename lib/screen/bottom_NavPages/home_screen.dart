// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/components/custom_service_card.dart';
import 'package:janta_sewa/screen/bottom_NavPages/bottom_nav.dart';
import 'package:janta_sewa/screen/contacts_invitation/contact_page.dart';
import 'package:janta_sewa/screen/contacts_invitation/invitation_page.dart';
import 'package:janta_sewa/screen/auth_page/language_switch.dart';
import 'package:janta_sewa/screen/letters/budgetDemand/budget_demand.dart';
import 'package:janta_sewa/screen/letters/complains/compain_menu.dart';
import 'package:janta_sewa/screen/letters/recommends/recommendation_menu.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_menu.dart';
import 'package:janta_sewa/screen/services_department/constructions/constructions_menu.dart';
import 'package:janta_sewa/screen/services_department/hospital/hospital_admission.dart';
import 'package:janta_sewa/screen/services_department/parliament_visit/parliament_visit.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.offAll(()=>BottomNav());
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomTextWidget(
                //     text: "${'Welcome'.tr}, ${Get.arguments?['fullName'] ?? 'User'}",
                //   color: AppColors.textColor,
                //   fontsize: 16,
                //   fontWeight: FontWeight.bold,
                // ),
        
                SizedBox(height: 24,),
                Row(children: [
                  ],
                ),
                CustomTextWidget(
                  text: 'services_departments'.tr,
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomServiceCard(
                      icon: Icons.train,
                      text: 'rail_ticket_confirmation'.tr,
                      onTap: () {
                        Get.to(()=>TicketConfirmation());
                      },
                    ),
                    CustomServiceCard(
                      icon: Icons.account_balance,
                      text: 'parliament_visit'.tr,
                      onTap: () {
                        Get.to(()=>ParliamentVisit());
                      },
                    ),
                    CustomServiceCard(
                      icon: Icons.construction,
                      text: 'construction_work'.tr,
                      onTap: () {
                        
                        Get.to(()=>ConstructionsMenu());
                      },
                    ),
                  ],
                ),
                //second row
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomServiceCard(
                      icon: Icons.local_hospital,
                      text: 'hospital_admission'.tr,
                      onTap: () {
                        Get.to(()=>HospitalAdmission());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextWidget(
                  text: 'letter_request'.tr,
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomServiceCard(
                      icon: Icons.description,
                      text: 'recommendation_letter'.tr,
                      onTap: () {
                        Get.to(()=>RecommendationMenu());
                      },
                    ),
                    CustomServiceCard(
                      icon: Icons.report,
                      text: 'complaint_letter'.tr,
                      onTap: () {
                        Get.to(()=>CompainMenu());
                      },
                    ),
                    CustomServiceCard(
                      icon: Icons.lightbulb_outline,
                      text: 'budget_demand'.tr,
                      onTap: () {
                        Get.to(()=>BudgetDemand());
                      },
                    ),
                  ],
                ),
                 SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomServiceCard(
                      icon: Icons.description,
                      text: 'suggestion_letter'.tr,
                      onTap: () {
                        Get.to(()=>SuggestionMenu());
                      },
                    ),
                  
                   
                  ],
                ),
        
        
                SizedBox(height: 20),
                CustomTextWidget(
                  text: 'contact_invitation'.tr,
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomServiceCard(
                      icon: Icons.contact_page,
                      text: 'contact'.tr,
                      onTap: () {
                        Get.to(()=>ContactPage());
                      },
                    ),
                    SizedBox(width: 10),
                    CustomServiceCard(
                      icon: Icons.mail_outline,
                      text: 'invitation'.tr,
                      onTap: () {
                        Get.to(()=>InvitationPage());
                      },
                    ),
                  ],
                ),
               
              ],
              
            ),
          ),
         
        ),
      ),
    );
  }
}
