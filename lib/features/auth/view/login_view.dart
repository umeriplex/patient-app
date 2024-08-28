import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/routes/names.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_dimensions.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/app_text_styles.dart';
import 'package:patient_app/utils/extensions/magins.dart';
import '../../../core/session/user_session.dart';
import '../../../utils/components/custom_button.dart';
import '../../../utils/components/custom_text_field.dart';
import '../../../utils/messages.dart';
import '../controller/auth_controller.dart';

class LoginView extends StatefulWidget {

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String countryCode = '+92';

  bool passwordVisible = false;

  bool isRememberMe = false;

  bool loading = false;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AD.of(context).w45, vertical: AD.of(context).h10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Image.asset(
                        AppImages.appLogo,
                        height: AD.of(context).h45*2,
                        fit: BoxFit.cover,
                      ),

                      AD.of(context).h20.ph,
                      const Text(
                        'Welcome Back!',
                        style: TextStyles.headline2,
                      ),

                      .7.ph,
                      Text(
                        'Please enter your credentials to continue',
                        style: TextStyles.bodyText1.copyWith(color: AppColors.black300),
                        textAlign: TextAlign.center,
                      ),

                      AD.of(context).h20.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                AppImages.goole,
                                width: 22,
                              ),
                              label: const Text('Google', style: TextStyles.subtitle1,),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.black100,
                                backgroundColor: AppColors.white100,
                                side: const BorderSide(color: AppColors.white100),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                surfaceTintColor: AppColors.white100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                          AD.of(context).w30.pw,
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.apple, color: AppColors.black100),
                              label: const Text('Apple', style: TextStyles.subtitle1,),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.black100,
                                backgroundColor: AppColors.white100,
                                side: const BorderSide(color: AppColors.white100),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                surfaceTintColor: AppColors.white100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),

                      AD.of(context).h20.ph,
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('or', style: TextStyles.bodyText1,),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      AD.of(context).h20.ph,
                      CustomTextField(
                        labelText: 'Email Address',
                        hintText: 'your email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        inputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          emailFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(passwordFocusNode);
                        },
                      ),

                      AD.of(context).h20.ph,
                      CustomTextField(
                        labelText: 'Create Password',
                        hintText: 'your password',
                        controller: passwordController,
                        isPassword: !passwordVisible,
                        suffixIcon: TextButton(
                          onPressed: () {
                            passwordVisible = !passwordVisible;
                            setState(() {});
                          },
                          child: Text(
                            passwordVisible ? 'hide' : 'show',
                            style: TextStyles.subtitle1.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        focusNode: passwordFocusNode,
                        inputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          passwordFocusNode.unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),


              AD.of(context).h20.ph,
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    onChanged: (value) {
                      isRememberMe = value!;
                      setState(() {});
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                      children: [
                        TextSpan(
                          text: 'Remember me',
                          style: TextStyles.subtitle2.copyWith(color: AppColors.termsAndConditions),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              .6.ph,
              loading ?
              const CircularProgressIndicator() :
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  await _loginUser();
                  setState(() {
                    loading = false;
                  });
                },
              ),

              .8.ph,
              TextButton(
                onPressed: () {
                  Get.toNamed(Names.signUp);
                },
                child: Text(
                  'Don\'t have an Account? Register',
                  style: TextStyles.subtitle2.copyWith(color: AppColors.termsAndConditions),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUser() async {
    if(emailController.text.isEmpty){
      showMessage('Please enter your email');
      return;
    }
    if(passwordController.text.isEmpty){
      showMessage('Please enter your password');
      return;
    }

    // Call the registerUser method from the AuthController
    await Get.find<AuthController>().loginUser(emailController.text, passwordController.text).then((value) async {
      if(value){

        var user = await Get.find<AuthController>().getUser(emailController.text);
        if(user == null){
          showMessage('User not found');
          return;
        }
        var savedUser = await UserSession().saveUserDetails(user);
        if(savedUser == null){
          showMessage('Error saving user details');
          return;
        }

        showMessage('User logged in successfully');
        Get.offNamedUntil(Names.home, (route) => false);
      }
    });
  }


}