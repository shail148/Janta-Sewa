import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:janta_sewa/controllers/file_upload_controller.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class CustomFileUpload extends StatelessWidget {
  final FileUploadController controller = Get.put(FileUploadController());

  CustomFileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: controller.pickFile,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [6, 6],
              strokeWidth: 3.0,
              radius: const Radius.circular(12),
              color: AppColors.btnBgColor,
              padding: const EdgeInsets.all(0), //can adjust padding
            ),
            child: Container(
              height: 150,
              width: double.infinity,
              color: AppColors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidget(text: 'Upload Your Files', fontsize: 14),
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
            children: List.generate(controller.uploadedFiles.length, (index) {
              final file = controller.uploadedFiles[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D7E3).withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.btnBgColor),
                ),
                child: Row(
                  children: [
                    Icon(Icons.insert_drive_file, color: AppColors.btnBgColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(file.name, overflow: TextOverflow.ellipsis),
                    ),
                    CustomTextWidget(
                      text:
                          '${(file.size / (1024 * 1024)).toStringAsFixed(1)} MB',
                      fontsize: 12,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outlined,
                        color: AppColors.btnBgColor,
                      ),
                      onPressed: () => controller.removeFile(index),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}



//old code shailendra

/* // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class CustomFileUpload extends StatefulWidget {
  @override
  _CustomFileUploadState createState() => _CustomFileUploadState();
}

class _CustomFileUploadState extends State<CustomFileUpload> {
  List<PlatformFile> uploadedFiles = [];

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        uploadedFiles.add(result.files.first);
      });
    }
  }

  void removeFile(int index) {
    setState(() {
      uploadedFiles.removeAt(index);
    });
  }

  Widget fileTile(PlatformFile file, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.btnBgColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.insert_drive_file, color: AppColors.btnBgColor, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              file.name,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomTextWidget(
            text: '${(file.size / (1024 * 1024)).toStringAsFixed(1)} MB',
            fontsize: 12,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: AppColors.btnBgColor, size: 30),
            onPressed: () => removeFile(index),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: pickFile,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.formBgColor,
              border: Border.all(
                color: AppColors.btnBgColor,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidget(text: 'Upload Your Files', fontsize: 14),
                  SizedBox(height: 5),
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
                      SizedBox(width: 5),
                      CustomTextWidget(
                        text: 'Browse',
                        color: AppColors.btnBgColor,
                        fontsize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  // CustomTextWidget(text: 'in JPG, PNG, PDF',fontsize: 12,),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(
            uploadedFiles.length,
            (index) => fileTile(uploadedFiles[index], index),
          ),
        ),
      ],
    );
  }
}
 */