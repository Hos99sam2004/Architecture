import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture/Core/errors/failure.dart';
import 'package:learn_clean_architecture/Core/params/parames.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUsers({ required UserParames parames});
}