

import 'package:learn_clean_architecture/Features/Users/domain/entities/Sub_Entities/geo_ent.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({
    required this.city,
    required this.street,
    required this.suite,
    required this.zipcode,
    required this.geo,
  });
}