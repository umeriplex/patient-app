import 'package:get/get.dart';
import 'package:patient_app/features/home/model/appointment_model.dart';
import 'package:patient_app/features/home/repository/home_repository.dart';

class HomeController extends GetxController{
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);


  // book an appointment
  Future<AppointmentModel?> bookAppointment(AppointmentModel model) async {
    return await _homeRepository.bookAppointment(model);
  }

}