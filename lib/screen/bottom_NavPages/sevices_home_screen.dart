import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_service_card.dart';
import 'package:janta_sewa/screen/contacts_invitation/invitation_page.dart';
import 'package:janta_sewa/screen/letters/budgetDemand/budget_demand.dart';
import 'package:janta_sewa/screen/letters/complains/compain_menu.dart';
import 'package:janta_sewa/screen/letters/recommends/recommendation_menu.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_menu.dart';
import 'package:janta_sewa/screen/services_department/constructions/constructions_menu.dart';
import 'package:janta_sewa/screen/services_department/hospital/hospital_admission.dart';
import 'package:janta_sewa/screen/services_department/parliament_visit/parliament_visit.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ServicesHomeScreen extends StatefulWidget {
  const ServicesHomeScreen({super.key});

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     // SizedBox(height: 16),
                      CustomTextWidget(
                      text: 'services'.tr,
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomServiceCard(
                              text: 'train_ticket_confirmation'.tr,
                              imagePath: 'assets/images/train.png',
                              onTap: () => Get.to(() => TicketConfirmation()),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: CustomServiceCard(
                              text: 'hospital_admission'.tr,
                              imagePath: 'assets/images/hospital.png',
                              onTap: () => Get.to(() => HospitalAdmission()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Departments Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'departments'.tr,
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomServiceCard(
                              text: 'budget_demand'.tr,
                              imagePath: 'assets/images/budget.png',
                              onTap: () => Get.to(() => BudgetDemand()),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: CustomServiceCard(
                              text: 'construction_work'.tr,
                              imagePath: 'assets/images/construction.png',
                              onTap: () => Get.to(() => ConstructionsMenu()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Letters Section
             Expanded(
                flex: 2, // make this section taller
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'letters'.tr,
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            //flex: 2,
                            child: CustomServiceCard(
                              height: 300,
                              text: 'recommendation_letter'.tr,
                              imagePath: 'assets/images/recommendation.png',
                              onTap: () => Get.to(() => RecommendationMenu()),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CustomServiceCard(
                                    text: 'complaint_letter'.tr,
                                    imagePath: 'assets/images/complaint.png',
                                    onTap: () => Get.to(() => CompainMenu()),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Expanded(
                                  child: CustomServiceCard(
                                    text: 'suggestion_letter'.tr,
                                    imagePath: 'assets/images/suggestion.png',
                                    onTap: () => Get.to(() => SuggestionMenu()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), 
              
              SizedBox(height: 16),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'requests'.tr,
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomServiceCard(
                              text: 'parliament_visit'.tr,
                              imagePath: 'assets/images/parliament.png',
                              //imageScale: 0.9,   // <– smaller number = bigger image
                             // imageZoom: 5.3,
                              imageBoxFactor: 0.5,  // << bigger box => visibly larger image, we can increase to 0.7 also
                              onTap: () => Get.to(() => ParliamentVisit()),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: CustomServiceCard(
                              text: 'invitation'.tr,
                              imagePath: 'assets/images/invitation.png',
                              onTap: () => Get.to(() => InvitationPage()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

                  SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/custom_service_card.dart';
import 'package:janta_sewa/screen/contacts_invitation/invitation_page.dart';
import 'package:janta_sewa/screen/letters/budgetDemand/budget_demand.dart';
import 'package:janta_sewa/screen/letters/complains/compain_menu.dart';
import 'package:janta_sewa/screen/letters/recommends/recommendation_menu.dart';
import 'package:janta_sewa/screen/letters/suggestions/suggestion_menu.dart';
import 'package:janta_sewa/screen/services_department/constructions/constructions_menu.dart';
import 'package:janta_sewa/screen/services_department/hospital/hospital_admission.dart';
import 'package:janta_sewa/screen/services_department/parliament_visit/parliament_visit.dart';
import 'package:janta_sewa/screen/services_department/tickets/ticket_confirmation.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class ServicesHomeScreen extends StatefulWidget {
  const ServicesHomeScreen({super.key});

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final rectangularCardWidth = screenWidth * 0.42;
    final rectangularCardHeight = screenHeight * 0.095;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  CustomTextWidget(
                    text: 'services'.tr,
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    runSpacing: 20,
                    spacing: 25,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      CustomServiceCard(
                        text: 'rail_ticket_confirmation'.tr,
                        imagePath: 'assets/images/train.png',
                        onTap: () => Get.to(() => TicketConfirmation()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                      CustomServiceCard(
                        text: 'hospital_admission'.tr,
                        imagePath: 'assets/images/hospital.png',
                        onTap: () => Get.to(() => HospitalAdmission()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                    ],
                  ), 
                   
                  SizedBox(height: 16),

                  CustomTextWidget(
                    text: 'departments'.tr,
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    runSpacing: 20,
                    spacing: 25,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      CustomServiceCard(
                        text: 'budget_demand'.tr,
                        imagePath: 'assets/images/budget.png',
                        onTap: () => Get.to(() => BudgetDemand()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                      CustomServiceCard(
                        text: 'construction_work'.tr,
                        imagePath: 'assets/images/construction.jpg',
                        onTap: () => Get.to(() => ConstructionsMenu()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextWidget(
                    text: 'letters'.tr,
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomServiceCard(
                        text: 'recommendation_letter'.tr,
                        imagePath: 'assets/images/recommendation1.png',
                        onTap: () => Get.to(() => RecommendationMenu()),
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.21,
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          CustomServiceCard(
                            text: 'complaint_letter'.tr,
                            imagePath: 'assets/images/complaint.jpg',
                            onTap: () => Get.to(() => CompainMenu()),
                            width: rectangularCardWidth,
                            height: rectangularCardHeight,
                          ),
                          SizedBox(height: 15),
                          CustomServiceCard(
                            text: 'suggestion_letter'.tr,
                            imagePath: 'assets/images/suggestion.jpg',
                            onTap: () => Get.to(() => SuggestionMenu()),
                            width: rectangularCardWidth,
                            height: rectangularCardHeight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 16),
              // Bottom content (flush with navbar)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'requests'.tr,
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    runSpacing: 20,
                    spacing: 25,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      CustomServiceCard(
                        text: 'parliament_visit'.tr,
                        imagePath: 'assets/images/parliament.png',
                        onTap: () => Get.to(() => ParliamentVisit()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                      CustomServiceCard(
                        text: 'invitation'.tr,
                        imagePath: 'assets/images/invitation.jpg',
                        onTap: () => Get.to(() => InvitationPage()),
                        width: rectangularCardWidth,
                        height: rectangularCardHeight,
                      ),
                    ],
                  ),
                  

                  SizedBox(height: 8),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */

