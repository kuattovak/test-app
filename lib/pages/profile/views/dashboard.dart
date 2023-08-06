import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_event.dart';
import '../../../bloc/auth_state.dart';
import '../../../constants/colors/colors.dart';
import '../../../constants/textstyles/textstyles.dart';
import '../../../constants/widgets/containers.dart';
import '../../auth/view/signin.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignIn()),
              (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile', style: Texts.title),
              const SizedBox(height: 20),
              profileContainer('Dev P', '${user.email}'),
              const SizedBox(height: 20),
              containerChoice(name: 'Language', onTap: () {}),
              const SizedBox(height: 10),
              Container(
                width: 336,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: AppColors.fill,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequested());
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyDarker),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
