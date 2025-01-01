class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String phone;

  User({required this.id, required this.name, required this.email, required this.role, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
    );
  }
}
