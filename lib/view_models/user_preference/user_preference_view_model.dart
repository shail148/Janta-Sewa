import 'package:get/get.dart';
import 'package:janta_sewa/models/login/login_with_email_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  
  Future<bool> saveUser(LoginWithEmailModel loginWithEmailModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('email', loginWithEmailModel.email);
    sp.setString('password', loginWithEmailModel.password);
    return true;
  }

  //return user data
  Future<LoginWithEmailModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String email = sp.getString('email') ?? '';
    String password = sp.getString('password') ?? '';
    return LoginWithEmailModel(email: email, password: password);
  }

  //remove user data
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.clear();
    return true;
  }
}
