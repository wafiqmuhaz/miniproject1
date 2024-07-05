import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is UserLoaded) {
            final user = state.user;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text('${user.name.firstname} ${user.name.lastname}'),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(user.email),
                ),
                ListTile(
                  title: const Text('Phone'),
                  subtitle: Text(user.phone),
                ),
                ListTile(
                  title: const Text('Address'),
                  subtitle: Text('${user.address.street}, ${user.address.city}, ${user.address.zipcode}'),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
