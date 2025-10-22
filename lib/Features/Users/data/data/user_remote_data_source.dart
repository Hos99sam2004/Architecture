import 'package:learn_clean_architecture/Core/databases/Api/Api_consumer.dart';
import 'package:learn_clean_architecture/Core/databases/Api/end_points.dart';
import 'package:learn_clean_architecture/Core/params/parames.dart';
import 'package:learn_clean_architecture/Features/Users/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
 Future<UserModel> getUser(UserParames parames)async{
   final response = await api.get("${EndPoints.user}/${parames.id}");
  return UserModel.fromJson(response);
  }
}