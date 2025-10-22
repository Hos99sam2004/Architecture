import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/Widgets/custom_search_bar.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/Widgets/landing_widget.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/Widgets/user_data_widget.dart';
import 'package:learn_clean_architecture/Features/Users/presentation/cubit/user_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState> (
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body:
              state is GetUserSuccessfully
                  ? ListView(
                    children: [
                      const LandingWidget(),
                      UserData(user: state.user),
                      const CustomSearchBar(),
                    ],
                  )
                  : state is GetUserFailure
                  ? Text(state.errMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
