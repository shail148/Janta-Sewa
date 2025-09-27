import 'package:get/get.dart';
import '../models/ticket_model.dart';

class TicketController extends GetxController {
  var tickets = <Ticket>[].obs;
  void addTicket(Ticket ticket) {
    tickets.add(ticket);
  }
}







