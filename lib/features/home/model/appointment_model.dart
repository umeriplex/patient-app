import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel{
  String id;
  String accountHolderName;
  String email;
  String phone;
  String childName;
  String gender;
  Timestamp date;

  AppointmentModel(this.id, this.accountHolderName, this.email, this.phone, this.childName, this.gender, this.date);


  factory AppointmentModel.fromMap(Map<String, dynamic> data){
    return AppointmentModel(
        data['id'] ?? '',
        data['accountHolderName'] ?? '',
        data['email'] ?? '',
        data['phone'] ?? '',
        data['childName'] ?? '',
        data['gender'] ?? '',
        data['date'] ?? Timestamp.now());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accountHolderName': accountHolderName,
      'email': email,
      'phone': phone,
      'childName': childName,
      'gender': gender,
      'date': date
    };
  }
}