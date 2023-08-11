import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_bloc/bloc/user_bloc.dart';
import 'package:rest_bloc/model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => _userBloc,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserError) {
                return Center(
                  child: Text(state.error!),
                );
              } else if (state is UserInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is USerLoaded) {
                return ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    UserModel userModel = state.userList[index];
                    return ListTile(
                      title: Text(userModel.title.toString()),
                      subtitle: Text(userModel.id.toString()),
                      trailing: Text(userModel.userId.toString()),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
