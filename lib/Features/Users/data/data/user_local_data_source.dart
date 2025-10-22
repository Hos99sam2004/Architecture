import 'dart:convert';

import 'package:learn_clean_architecture/Core/databases/Cache/cacheHelper.dart';
import 'package:learn_clean_architecture/Core/errors/execptions.dart';
import 'package:learn_clean_architecture/Features/Users/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedUser";
  UserLocalDataSource({required this.cache});
  cacheUser(UserModel? userToCache) async {
    if (userToCache != null) {
      /// save to cache
      /// value مينفعش تكون model 
      /// هحولها json و بعدها اعمله encode to be String 
      /// لانها مينفعش تكون model
      /// وبعد ماخذنة هرجعه model وانابستدعى اليوزر موديل
      /// 
      cache.saveData(key: key, value:json.encode(userToCache.toJson(),) );
    }else{
      throw CacheExeption(errorMessage: 'مفيش اتصل بالانترنت');
    }
  }
  Future<UserModel> getlastUser() async{
    final jsonString = cache.getDataString(key: key);
    if(jsonString != null){
      // jsonString عبارة عن String
      /// return model
      /// وبعد ماخذنة هرجعه model وانابستدعى اليوزر موديل
      /// String To Model 
      /// json.Decode  
      return Future.value(UserModel.fromJson(json.decode(jsonString))) ;
    }
    else{
      throw CacheExeption(errorMessage: 'مفيش اتصل بالانترنت');
    }
  }

}
