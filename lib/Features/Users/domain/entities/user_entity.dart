import 'package:learn_clean_architecture/Features/Users/domain/entities/Sub_Entities/Address_ent.dart';

class UserEntity {
  final String name;
  final String phone;
  final String email;
  final AddressEntity address;

  UserEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}

