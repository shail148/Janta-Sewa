import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/contact_page_tile.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/custom_snackbar.dart';
import 'package:janta_sewa/widget/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        leftIcon: Icon(Icons.arrow_back_ios, color: AppColors.btnBgColor),
        onLeftTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          // thickness: 5,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "contact_page".tr,
                      color: AppColors.textColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    ContactPageTile(
                      title: '7270932671',
                      icons: Icons.phone_in_talk,
                      onTap: () async {
                        final Uri uri = Uri(scheme: 'tel', path: '7270932671');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          CustomSnackbar.show(
                            title: 'Error',
                            message: 'Can not Launch Call',
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                    ),
                    ContactPageTile(
                      title: '7270932671',
                      icons: Icons.message,
                      onTap: () async {
                        final Uri uri = Uri(scheme: 'sms', path: '7270932671');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          CustomSnackbar.show(
                            title: 'Error',
                            message: 'Can not Launch ',
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                    ),
                    ContactPageTile(
                      title: 'shailendra10020@gmail.com',
                      icons: Icons.email,
                      onTap: () async {
                        final Uri uri = Uri(
                          scheme: 'mailto',
                          path: 'shailendra@gmail.com',
                          
                        );

                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication,);
                        } else {
                          CustomSnackbar.show(
                            title: 'Error',
                            message: 'Could not open email app.',
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                    ),

                    ContactPageTile(
                      title: 'shailendra@gmail.com',
                      icons: Icons.public,
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    CustomTextWidget(
                      text: 'Follow us on',
                      fontsize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/whatsapp.png',
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          'assets/images/instagram.png',
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          'assets/images/twitter.png',
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          'assets/images/facebook.png',
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
