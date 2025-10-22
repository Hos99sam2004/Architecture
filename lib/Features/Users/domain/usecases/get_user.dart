import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture/Core/errors/failure.dart';
import 'package:learn_clean_architecture/Core/params/parames.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/user_entity.dart' show UserEntity;
import 'package:learn_clean_architecture/Features/Users/domain/repo/User_repo.dart';

class GetUser {
   final UserRepo userrepo;
  GetUser({required this.userrepo});
  Future<Either<Failure, UserEntity>> call({required UserParames parames}) {
    return userrepo.getUsers(parames: parames);
  }
}