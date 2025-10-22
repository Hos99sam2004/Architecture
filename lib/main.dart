import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/Core/databases/Cache/cacheHelper.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/Screens/user_Screen.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/cubit/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}
// clean architecture
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
