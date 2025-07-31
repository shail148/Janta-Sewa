// file: controllers/file_upload_controller.dart

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  RxList<PlatformFile> uploadedFiles = <PlatformFile>[].obs;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      uploadedFiles.add(result.files.first);
    }
  }

  void removeFile(int index) {
    uploadedFiles.removeAt(index);
  }
}
