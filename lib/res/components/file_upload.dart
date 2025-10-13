import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class CustomFileUpload extends StatelessWidget {
  final controller = Get.put(FileUploadController());
  CustomFileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: controller.pickFile,
          child: DottedBorder(
            // color: AppColors.btnBgColor,
            // strokeWidth: 2.5,
            // dashPattern: const [6, 4],
            // borderType: BorderType.RRect,
            // radius: const Radius.circular(12),
            child: Container(
              height: 140,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomTextWidget(
                    text: 'Upload Your Files',
                    fontsize: 14,
                  ),
                  Icon(
                    Icons.file_upload_outlined,
                    color: AppColors.btnBgColor,
                    size: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: 'in JPG, PNG, PDF',
                        color: AppColors.textGrey,
                        fontsize: 12,
                      ),
                      const SizedBox(width: 5),
                      CustomTextWidget(
                        text: 'Browse',
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => Column(
            children: controller.uploadedFiles
                .asMap()
                .entries
                .map((e) => _fileTile(e.key, e.value.name, e.value.size))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _fileTile(int index, String name, int size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.btnBgColor),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, color: AppColors.btnBgColor, size: 22),
          const SizedBox(width: 8),
          Expanded(child: Text(name, overflow: TextOverflow.ellipsis)),
          CustomTextWidget(
            text: '${(size / (1024 * 1024)).toStringAsFixed(1)} MB',
            fontsize: 12,
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.btnBgColor),
            onPressed: () => controller.removeFile(index),
          ),
        ],
      ),
    );
  }
}
