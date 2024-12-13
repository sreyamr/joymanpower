class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? designation;
  String? dateOfBirth;

  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.designation,
    this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'phone_number': phoneNumber,
      'designation': designation ?? '',
      'dateOfBirth': dateOfBirth ?? '',
    };
  }


  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirm_password'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      designation: json['designation'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
    );
  }
}
