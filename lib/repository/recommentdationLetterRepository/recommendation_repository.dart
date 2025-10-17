import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:janta_sewa/data/network/network_api_services.dart';
import 'package:janta_sewa/res/appUrl/app_url.dart';

class RecommendationRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> createTransferLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createTransferLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createTransferLetterApi}');
      print('Transfer Letter API Response: $response');
    }
    return response;
  }

  //posting letter

  Future<dynamic> createPostingLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createPostingLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createPostingLetterApi}');
      print('Posting Letter API Response: $response');
    }
    return response;
  }

  //quarter allotment letter
  Future<dynamic> createQuarterAllotmentLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createQuarterAllotmentLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createQuarterAllotmentLetterApi}');
      print('Quarter Allotment Letter API Response: $response');
    }
    return response;
  }

  //award letter api
  Future<dynamic> createAwardLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createAwardLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createAwardLetterApi}');
      print('Award Letter API Response: $response');
    }
    return response;
  }

  //admission letter api
  Future<dynamic> createAdmissionLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createAdmissionLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createAdmissionLetterApi}');
      print('Admission Letter API Response: $response');
    }
    return response;
  }

  //land allotment letter api
  Future<dynamic> createLandAllotmentLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createLandAllotmentLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createLandAllotmentLetterApi}');
      print('Admission Letter API Response: $response');
    }
    return response;
  }

  //job recommendation letter api
  Future<dynamic> createJobRecommendationLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createJobRecommendationLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createJobRecommendationLetterApi}');
      print('Job Recommendation Letter API Response: $response');
    }
    return response;
  }

  //financial recommendation letter api
  Future<dynamic> createFinancialRecommendationLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createFinancialRecommendationLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createFinancialRecommendationLetterApi}');
      print('Financial Recommendation Letter API Response: $response');
    }
    return response;
  }

  //cultural recommendation letter api
  Future<dynamic> createCulturalRecommendationLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createCulturalRecommendationLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createCulturalRecommendationLetterApi}');
      print('Cultural Recommendation Letter API Response: $response');
    }
    return response;
  }

  //other recommendation letter api
  Future<dynamic> createOtherRecommendationLetterApi(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    List<PlatformFile>? files,
  }) async {
    final fields = <String, String>{};
    data.forEach((key, value) {
      fields[key] = value?.toString() ?? '';
    });
    final response = await _apiService.postMultipart(
      AppUrl.createOtherRecommendationLetterApi,
      fields,
      files ?? [],
      headers: headers,
    );

    if (kDebugMode) {
      print('Api URL : ${AppUrl.createOtherRecommendationLetterApi}');
      print('Other Recommendation Letter API Response: $response');
    }
    return response;
  }
}
