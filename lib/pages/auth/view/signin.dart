import 'package:email_validator/email_validator.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_authorization/constants/widgets/buttons.dart';
import 'package:firebase_authorization/pages/options/view/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_event.dart';
import '../../../bloc/auth_state.dart';
import '../../../constants/colors/colors.dart';
import '../../../constants/textstyles/textstyles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => OptionsPage()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text('Welcome Back 👋', style: Texts.title),
                              const SizedBox(height: 30),
                              SizedBox(
                                  width: 336,
                                  height: 48,
                                  child: Text(
                                      'I am happy to see you again. You can continue where you left off by logging in',
                                      style: TextStyle(
                                          color: AppColors.greyPrimary))),
                              SizedBox(height: 30),
                            ]),
                        Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    prefixIcon: const Icon(FeatherIcons.mail),
                                    filled: true,
                                    fillColor: AppColors.fill,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? 'Enter a valid email'
                                        : null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    prefixIcon: const Icon(FeatherIcons.lock),
                                    filled: true,
                                    fillColor: AppColors.fill,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null && value.length < 6
                                        ? "Enter min. 6 characters"
                                        : null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MainButton(
                                    title: Text(
                                      'Sign In',
                                      style: Texts.buttonsTitle,
                                    ),
                                    color: AppColors.main,
                                    border: Border(),
                                    route: () {
                                      _authenticateWithEmailAndPassword(
                                          context);
                                    })
                              ],
                            ),
                          ),
                        ),
                        const Center(child: Text('or')),
                        MainButton(
                            route: () {},
                            border: Border.all(
                                color: AppColors.greyLighter, width: 3),
                            title: Text(
                              'Sign In with Google',
                              style: TextStyle(color: AppColors.greyDarker),
                            ),
                            color: Colors.white),
                        MainButton(
                            route: () {},
                            border: Border.all(color: AppColors.greyLighter),
                            title: Text(
                              'Sign In with FaceBook',
                              style: TextStyle(color: AppColors.greyDarker),
                            ),
                            color: Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButtons(
                              title: 'SignUp',
                              onPressed: () {
                                Navigator.pushNamed(context, 'signUpPage');
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
