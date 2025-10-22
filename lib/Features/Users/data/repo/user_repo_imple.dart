import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture/Core/connection/network_info.dart';
import 'package:learn_clean_architecture/Core/errors/execptions.dart';
import 'package:learn_clean_architecture/Core/errors/failure.dart';
import 'package:learn_clean_architecture/Core/params/parames.dart';
import 'package:learn_clean_architecture/Features/Users/data/data/user_local_data_source.dart';
import 'package:learn_clean_architecture/Features/Users/data/data/user_remote_data_source.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/user_entity.dart';
import 'package:learn_clean_architecture/Features/Users/domain/repo/User_repo.dart';

class UserRepoImple extends UserRepo {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource RemoteDataSource;
  final UserLocalDataSource LocalDataSource;
  UserRepoImple({ required this.LocalDataSource, required this.RemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> getUsers({
    required UserParames parames,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUSer = await RemoteDataSource.getUser(parames);
        LocalDataSource.cacheUser(remoteUSer);
        return Right(remoteUSer);
      } on ServerException catch (e) {
        return Left(Failure(errmessage: e.errorModel.errorMessage));
      }
    } else {
      try {
  final localUSer = await LocalDataSource.getlastUser();
  return Right(localUSer);
} on CacheExeption catch (e) {
   return Left(Failure(errmessage: e.errorMessage));
}
    }
  }
}
