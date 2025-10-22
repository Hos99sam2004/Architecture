import 'package:learn_clean_architecture/Core/databases/Api/end_points.dart';
import 'package:learn_clean_architecture/Features/Users/data/models/sub_models/Geo_model.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/Sub_Entities/Address_ent.dart';

class AdressModel extends AddressEntity {
  AdressModel({
    required super.city,
    required super.street,
    required super.suite,
    required super.zipcode,
    required super.geo,
  });

  factory AdressModel.fromJson(Map<String, dynamic> json) {
    return AdressModel(
      city: json[ApiKey.city],
      street: json[ApiKey.street],
      suite: json[ApiKey.suite],
      zipcode: json[ApiKey.zipcode],
      geo: GeoModel.fromJson(json[ApiKey.geo]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.city: city,
      ApiKey.street: street,
      ApiKey.suite: suite,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: geo,
    };
  }
}

