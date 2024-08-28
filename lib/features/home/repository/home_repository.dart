import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patient_app/features/home/model/appointment_model.dart';
import 'package:patient_app/utils/messages.dart';

import '../../../core/errors/api_error_handler.dart';

class HomeRepository{
  final FirebaseFirestore _firestore;

  HomeRepository(this._firestore);

  Future<AppointmentModel?> bookAppointment(AppointmentModel model) async {
    try {
      String id = _firestore.collection('appointments').doc().id;
      model.id = id;
      await _firestore.collection('appointments').doc(id).set(model.toMap());
      return model;
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
      return null;
    }
  }

}