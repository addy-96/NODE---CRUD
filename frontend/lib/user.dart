class User {
  final String name;
  final String email;
  final String phone;

  User({required this.email, required this.phone, required this.name});

 Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
    };
  }
}
