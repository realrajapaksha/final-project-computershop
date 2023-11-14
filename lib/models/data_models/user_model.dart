class UserModel {
  final String id;
  final String email;
  final String image;
  final String fullName;
  final int age;
  final String gender;
  final String tele1;
  final String tele2;
  final String city;
  final String address;
  final String country;
  final String type;
  final String status;

  const UserModel(
      {required this.id,
      required this.email,
      required this.image,
      required this.fullName,
      required this.age,
      required this.gender,
      required this.tele1,
      required this.tele2,
      required this.city,
      required this.address,
      required this.country,
      required this.type,
      required this.status});

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "email": email,
      "image": image,
      "fullName": fullName,
      "age": age,
      "gender": gender,
      "tele1": tele1,
      "tele2": tele2,
      "city": city,
      "address": address,
      "country": country,
      "type": type,
      "status": status,
    };
  }

  Map<String, dynamic> toUpdateFireStore() {
    return {
      "fullName": fullName,
      "age": age,
      "gender": gender,
      "tele1": tele1,
      "tele2": tele2,
      "city": city,
      "address": address,
      "country": country
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      image: json["image"],
      fullName: json["fullName"],
      age: json["age"],
      tele1: json["tele1"],
      tele2: json["tele2"],
      city: json["city"],
      address: json["address"],
      country: json["country"],
      gender: json['gender'],
      type: json['type'],
      status: json['status']);
}
