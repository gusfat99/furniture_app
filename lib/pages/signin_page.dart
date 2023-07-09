import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/button.dart';
import 'package:space/widgets/textInput.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:space/widgets/toastContainer.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late FToast fToast;

  final emailController = TextEditingController(text: '');
  final passController = TextEditingController(text: '');
  bool isCheckedRemember = false;
  bool isLoading = false;
  bool isVisiblePassword = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  void handleLogin() {
    setState(() {
      isLoading = true;
    });
    const email = 'fatwanbagus.99@gmail.com';
    const pw = '1234';
    Future.delayed(Duration(seconds: 2), () {
      if ((email == emailController.text && passController.text == pw)) {
        fToast.showToast(
            child: ToastContainer(
                type: 'success',
                message: 'awesome, you have sucessfully loged!'),
            toastDuration: Duration(seconds: 3),
            gravity: ToastGravity.BOTTOM);
        Navigator.pushNamed(context, '/home');
      } else {
        fToast.showToast(
            child: ToastContainer(
                type: 'error', message: 'Invalid email or password!'),
            toastDuration: Duration(seconds: 3),
            gravity: ToastGravity.BOTTOM);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            const SizedBox(height: 48),
            Column(
              children: [
                TextInput(
                  hintText: "Email",
                  autoFocus: true,
                  controller: emailController,
                ),
                TextInput(
                    margin: const EdgeInsets.only(top: 32),
                    hintText: "Password",
                    controller: passController,
                    autoFocus: true,
                    obscureText: isVisiblePassword ? false : true,
                    adornmentRight: Container(
                      padding: EdgeInsets.zero,
                      height: 18,
                      width: 18,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          isVisiblePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisiblePassword = !isVisiblePassword;
                          });
                        },
                      ),
                    )),
                checkboxRemember(),
                Button(
                  margin: EdgeInsets.only(top: 32),
                  onPressed: () {
                    handleLogin();
                  },
                  text: 'Login',
                  color: 'black',
                  isLoading: isLoading,
                ),
                SizedBox(
                  height: 23,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: greyTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
                Button(
                  margin: EdgeInsets.only(top: 23),
                  onPressed: () {},
                  text: 'Login with Google',
                  color: 'accent',
                  variant: 'text',
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: blueTextStyle.copyWith(fontSize: 16),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget checkboxRemember() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Checkbox(
              value: isCheckedRemember,
              onChanged: (val) {
                setState(() {
                  isCheckedRemember = val!;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Remember me',
            style: accentTextStyle.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          'Login to your\naccount',
          style: accentTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 87,
              height: 4,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  color: kBlackColor, borderRadius: BorderRadius.circular(4)),
            ),
            Container(
              width: 8,
              height: 4,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  color: kBlackColor, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ],
    );
  }
}
