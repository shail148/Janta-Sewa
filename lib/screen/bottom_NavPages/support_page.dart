import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/components/contact_page_tile.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';



class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                      title: '9456789097',
                      icons: Icons.phone_in_talk,
                      onTap: () {},
                    ),
                    ContactPageTile(
                      title: '945-678-9097',
                      icons: Icons.message,
                      onTap: () {},
                    ),
                    ContactPageTile(
                      title: 'demo@gmail.com',
                      icons: Icons.email,
                      onTap: () {},
                    ),
                    ContactPageTile(
                      title: 'demo@gmail.com',
                      icons: Icons.public,
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    CustomTextWidget(text: 'Follow us on', fontsize: 14, fontWeight: FontWeight.w600),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/whatsapp.png', height: 50, width: 50),
                        Image.asset('assets/images/instagram.png', height: 50, width: 50),
                        Image.asset('assets/images/twitter.png', height: 50, width: 50),
                        Image.asset('assets/images/facebook.png', height: 50, width: 50),
                      ],
                    )
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