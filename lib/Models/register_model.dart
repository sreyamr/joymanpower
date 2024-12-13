class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;

  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'phone_number': phoneNumber,
    };
  }


  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirm_password'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
    );
  }
}
