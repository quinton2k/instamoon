import 'package:flutter/material.dart';
import 'package:instamoon/utils/colors.dart';
import 'package:instamoon/widgets/text_field_input.dart';
import 'package:instamoon/resources/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Image.asset('assets/instamoon.png',
                  color: primaryColor, height: 64),
              const SizedBox(height: 64),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg"),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 77,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: "Enter your username",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  String response = await AuthMethods().signUpUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                      username: _usernameController.text);
                  print(response);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    color: Color.fromARGB(255, 214, 106, 98),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () async {
                    //   String response = await AuthMethods().signUpUser(
                    //       email: _emailController.text,
                    //       password: _passwordController.text,
                    //       username: _usernameController.text);
                    // },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        " Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
