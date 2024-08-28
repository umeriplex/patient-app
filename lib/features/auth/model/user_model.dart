class UserModel{
  final String fullName;
  final String phoneNumber;
  final String email;

  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}