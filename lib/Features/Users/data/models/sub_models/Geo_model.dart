import 'package:learn_clean_architecture/Core/databases/Api/end_points.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/Sub_Entities/geo_ent.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json[ApiKey.lat], lng: json[ApiKey.lng]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.lat: lat, ApiKey.lng: lng};
  }
}
