import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:learn_clean_architecture/Core/connection/network_info.dart';
import 'package:learn_clean_architecture/Core/databases/Api/dio_consumer.dart';
import 'package:learn_clean_architecture/Core/databases/Cache/cacheHelper.dart';
import 'package:learn_clean_architecture/Core/params/parames.dart';
import 'package:learn_clean_architecture/Features/Users/data/data/user_local_data_source.dart';
import 'package:learn_clean_architecture/Features/Users/data/data/user_remote_data_source.dart';
import 'package:learn_clean_architecture/Features/Users/data/repo/user_repo_imple.dart';
import 'package:learn_clean_architecture/Features/Users/domain/entities/user_entity.dart';
import 'package:learn_clean_architecture/Features/Users/domain/usecases/get_user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final failureOrUser = await GetUser(
      /// usecase
      /// لازم استخدم singleton Design pattern
      /// علشان كل اما استدعى الدالة كده هانشاء object من كل class
      userrepo: UserRepoImple(
        RemoteDataSource: UserRemoteDataSource(api: DioConsumer(dio: Dio())),
        LocalDataSource: UserLocalDataSource(cache: CacheHelper()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).call(parames: UserParames(id: id.toString()));
    failureOrUser.fold(
      (failure) => emit(GetUserFailure( errMessage: failure.errmessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
