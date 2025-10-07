// ticket_controller.dart
import 'package:get/get.dart';
import 'package:janta_sewa/views/bottomTabs/tabPages/main_news_dashboard.dart';

class Passenger {
  String name;
  int age;
  String gender;

  Passenger({required this.name, required this.age, required this.gender});
}

class TicketController2 extends GetxController {
  var passengers = <Passenger>[
    Passenger(name: 'Adnan Nayyar', age: 20, gender: 'M'),
    Passenger(name: 'Shailender Sahani', age: 20, gender: 'M'),
    Passenger(name: 'Faiz Ahmed', age: 20, gender: 'M'),
    Passenger(name: 'Yunus Ali', age: 20, gender: 'M'),
    Passenger(name: 'Adnan Nayyar', age: 20, gender: 'M'),
    Passenger(name: 'Adnan Nayyar', age: 20, gender: 'M'),
  ].obs;

  void removePassenger(int index) {
    passengers.removeAt(index);
  }

  void addPassenger() {
    passengers.add(Passenger(name: 'New Passenger', age: 20, gender: 'M'));
  }

  void submit() {
    // You can handle submission logic here (API call, validation, etc.)
    //Get.snackbar('Submitted', 'Tickets have been submitted!');
     Get.to(() => MainNewsDashboard());
  }
}
