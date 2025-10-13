// file: controllers/file_upload_controller.dart

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  RxList<PlatformFile> uploadedFiles = <PlatformFile>[].obs;
  static const int maxFileSizeBytes = 10 * 1024 * 1024; // 10 MB
  static const int maxTotalFiles = 10; // total files allowed

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: true,
      );

      // user cancelled
      if (result == null || result.files.isEmpty) return;

      // Defer processing to avoid blocking the UI thread
      Future.microtask(() {
        final allowed = <String>{'jpg', 'jpeg', 'png', 'pdf'};

        // how many slots left
        final remaining = maxTotalFiles - uploadedFiles.length;
        if (remaining <= 0) {
          Get.snackbar(
            'Limit reached',
            'You can upload up to $maxTotalFiles files.',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        final List<PlatformFile> toAdd = [];
        for (var f in result.files) {
          // stop if we reached remaining capacity
          if (toAdd.length >= remaining) {
            Get.snackbar(
              'Limit reached',
              'Only $remaining more file(s) can be added.',
              snackPosition: SnackPosition.BOTTOM,
            );
            break;
          }

          final name = f.name;
          final ext = (name.contains('.'))
              ? name.split('.').last.toLowerCase()
              : '';

          if (ext.isEmpty || !allowed.contains(ext)) {
            Get.snackbar(
              'Invalid file type',
              '${f.name} is not supported. Allowed: ${allowed.join(', ')}',
              snackPosition: SnackPosition.BOTTOM,
            );
            continue;
          }

          if (f.size != null && f.size > maxFileSizeBytes) {
            Get.snackbar(
              'File too large',
              '${f.name} is larger than ${maxFileSizeBytes ~/ (1024 * 1024)} MB and was skipped.',
              snackPosition: SnackPosition.BOTTOM,
            );
            continue;
          }

          // prefer path (streaming upload). add file
          toAdd.add(f);
        }

        if (toAdd.isNotEmpty) {
          // add in one batch to avoid many small UI updates
          uploadedFiles.addAll(toAdd);
        }
      });
    } catch (e, st) {
      // catch unexpected native/platform errors
      if (kDebugMode) {
        print('pickFile error: $e\n$st');
      }
      Get.snackbar(
        'Error',
        'Failed to pick files: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeFile(int index) {
    if (index >= 0 && index < uploadedFiles.length) {
      uploadedFiles.removeAt(index);
    }
  }
}
