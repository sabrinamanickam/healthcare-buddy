import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:healthcare_buddy/Welcome/Screens/Login/components/background.dart';
import 'package:healthcare_buddy/Welcome/Screens/Signup/signup_screen.dart';
import 'package:healthcare_buddy/Welcome/components/already_have_an_account_acheck.dart';
import 'package:healthcare_buddy/Welcome/components/rounded_button.dart';
import 'package:healthcare_buddy/Welcome/components/rounded_input_field.dart';
import 'package:healthcare_buddy/Welcome/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_buddy/homeScreen/homescreen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                );
              }
            ),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
