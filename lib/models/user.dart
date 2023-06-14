import 'address.dart';
import 'company.dart';

class User {
  int? id;
  String name;
  String username;
  String email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      name: data["name"],
      username: data["username"],
      email: data["email"],
      address:
          data["address"] != null ? Address.fromJson(data['address']) : null,
      phone: data["phone"],
      website: data["website"],
      company:
          data["company"] != null ? Company.fromJson(data['company']) : null,
    );
  }
}
