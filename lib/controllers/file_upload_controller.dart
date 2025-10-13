import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class FileUploadController extends GetxController {
  final uploadedFiles = <PlatformFile>[].obs;

  static const allowedExt = ['jpg', 'jpeg', 'png', 'pdf'];
  static const maxSize = 10 * 1024 * 1024; // 10 MB per file

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: allowedExt,
      );

      if (result == null) return;

      // Filter valid new files
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

      if (valid.isEmpty) return;

      // ✅ Append new valid files to existing list (no duplicates)
      final existingNames = uploadedFiles.map((f) => f.name).toSet();
      final newUniqueFiles = valid
          .where((f) => !existingNames.contains(f.name))
          .toList();

      if (newUniqueFiles.isEmpty) {
        Get.snackbar('Duplicate', 'All selected files are already added');
        return;
      }

      uploadedFiles.addAll(newUniqueFiles);

      if (kDebugMode) {
        print('📁 Total selected files: ${uploadedFiles.length}');
      }
    } catch (e) {
      if (kDebugMode) print('File pick error: $e');
      Get.snackbar('Error', 'Failed to pick files');
    }
  }

  void removeFile(int index) => uploadedFiles.removeAt(index);

  void clearFiles() => uploadedFiles.clear();
}
