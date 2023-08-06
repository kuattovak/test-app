import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authorization/pages/auth/view/signup.dart';
import 'package:firebase_authorization/pages/home/views/bottom_nav_bar.dart';
import 'package:firebase_authorization/pages/home/views/informs_page.dart';
import 'package:firebase_authorization/pages/profile/views/dashboard.dart';
import 'package:firebase_authorization/pages/auth/view/signin.dart';
import 'package:firebase_authorization/pages/auth/data/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          routes: {
            'signInPage': (context) => SignIn(),
            'signUpPage': (context) => SignUp(),
            'homePage': (context) => MyBottomNavigationBarApp(),
            'informPage': (context) => InformPage()
          },
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                if (snapshot.hasData) {
                  return const Dashboard();
                }
                // Otherwise, they're not signed in. Show the sign in page.
                return SignIn();
              }),
        ),
      ),
    );
  }
}
