import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionViewModel extends GetxController {
  //final _api = ConstructionRepository();

  //new work demand controller
  final workName = TextEditingController().obs;
  final workDetails = TextEditingController().obs;
  final tentativeAmount = TextEditingController().obs;
  final remark = TextEditingController().obs;
  final demandedPerson = TextEditingController().obs;
  final demandedPersonMobileNumber = TextEditingController().obs;

  //location details
  final district = TextEditingController().obs;
  final block = TextEditingController().obs;
  final village = TextEditingController().obs;
  final constituency = TextEditingController().obs;
  final message = TextEditingController().obs;

  // void newWorkDemandApi()async{
  //   try{
  //     var value = await _api.newWorkDemandApi(data);
  //     if(value['error'] != null){
  //       Utils.showErrorSnackBar("Error", value['error'].toString());
  //     }else{
  //       Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
  //       Get.offAll(()=>const BottomNav());
  //     }
  //   }catch(e){
  //     Utils.showErrorSnackBar("Error", e.toString());
  //   }
  // }

  //pending work demand
  final pendingWorkName = TextEditingController().obs;
  final pendingWorkDetails = TextEditingController().obs;
  final actualAmount = TextEditingController().obs;

  // void pendingWorkDemandApi()async{
  //   try{
  //     var value = await _api.pendingWorkDemandApi(data);
  //     if(value['error'] != null){
  //       Utils.showErrorSnackBar("Error", value['error'].toString());
  //     }else{
  //       Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
  //       Get.offAll(()=>const BottomNav());
  //     }
  //   }catch(e){
  //     Utils.showErrorSnackBar("Error", e.toString());
  //   }
  // }

  //beneficiary oriented
  final beneficiaryName = TextEditingController().obs;
  final amount = TextEditingController().obs;
  final remarks = TextEditingController().obs;
  final demandedPersonName = TextEditingController().obs;
  final demandedPersonMobile = TextEditingController().obs;
  //location details :

  //beneficiary oriented api
  void beneficiaryOrientedApi(var data) async {
    // try{
    //     var value = await _api.beneficiaryOrientedApi(data);
    //     if(value['error'] != null){
    //       Utils.showErrorSnackBar("Error", value['error'].toString());
    //     }else{
    //       Utils.showSuccessSnackBar("Saved", "Saved Successfully 🎉");
    //       Get.offAll(()=>const BottomNav());
    //     }
    // }catch(e){
    //       Utils.showErrorSnackBar("Error", e.toString());
    // }
  }
}
