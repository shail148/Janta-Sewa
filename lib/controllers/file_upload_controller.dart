import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class FileUploadController extends GetxController {
  final uploadedFiles = <PlatformFile>[].obs;
  static const allowedExt = ['jpg', 'jpeg', 'png', 'pdf'];
  static const maxSize = 10 * 1024 * 1024; // 10 MB

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: allowedExt,
      );
      if (result == null) return;

      final valid = result.files.where((f) {
        final ext = f.extension?.toLowerCase() ?? '';
        if (!allowedExt.contains(ext)) {
          Get.snackbar('Invalid file', '${f.name} is not supported');
          return false;
        }
        if (f.size > maxSize) {
          Get.snackbar('Too large', '${f.name} exceeds 10 MB limit');
          return false;
        }
        return true;
      }).toList();

      if (valid.isNotEmpty) uploadedFiles.assignAll(valid);
    } catch (e) {
      if (kDebugMode) print('File pick error: $e');
      Get.snackbar('Error', 'Failed to pick file');
    }
  }

  void removeFile(int index) => uploadedFiles.removeAt(index);
}
