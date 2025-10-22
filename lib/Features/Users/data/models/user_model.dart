import 'package:learn_clean_architecture/Core/databases/Api/end_points.dart';
import 'package:learn_clean_architecture/Features/Users/data/models/sub_models/Adress_model.dart';
import 'package:learn_clean_architecture/Features/Users/data/models/sub_models/company_model.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
   required  this.username,
   required  this.website,
    required this.company,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required  this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      address: AdressModel.fromJson(json[ApiKey.address]), // json[ApiKey.address],
      company: CompanyModel.fromJson(json[ApiKey.company]), // json[ApiKey.company],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.email: email,
     ApiKey.company: company,
      ApiKey.address: address,
    };
  }
}
