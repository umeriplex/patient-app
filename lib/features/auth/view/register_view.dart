import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/session/user_session.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_dimensions.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/app_text_styles.dart';
import 'package:patient_app/utils/extensions/magins.dart';
import '../../../core/routes/names.dart';
import '../../../utils/components/custom_button.dart';
import '../../../utils/components/custom_text_field.dart';
import '../../../utils/messages.dart';
import '../controller/auth_controller.dart';
import '../model/user_model.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String countryCode = '+92';

  bool passwordVisible = false;

  bool isAgree = false;

  bool loading = false;

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AD.of(context).w45, vertical: AD.of(context).h10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.appLogo,
                  height: AD.of(context).h45*2,
                  fit: BoxFit.cover,
                ),

                AD.of(context).h20.ph,
                const Text(
                  'Register Now!',
                  style: TextStyles.headline2,
                ),

                .7.ph,
                Text(
                  'Please register to explore amazing features.',
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
                  labelText: 'Full Name',
                  hintText: 'your full name',
                  controller: fullNameController,
                  focusNode: nameFocusNode,
                  inputAction: TextInputAction.next,
                  onSubmitted: (value) {
                    nameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(phoneFocusNode);
                  },
                ),

                AD.of(context).h20.ph,
                CustomTextField(
                  labelText: 'Phone Number',
                  hintText: '3456364646',
                  controller: phoneNumberController,
                  prefixIcon: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: countryCode,
                      items: [
                        DropdownMenuItem(
                          value: countryCode,
                          child: Row(
                            children: [
                              AD.of(context).w10.pw,
                              Image.asset(
                                AppImages.pakistan, // Your country flag image path
                                width: 22,
                              ),
                              AD.of(context).w10.pw,
                              Text(countryCode, style: TextStyles.subtitle2,),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                      },
                    ),
                  ),
                  focusNode: phoneFocusNode,
                  inputAction: TextInputAction.next,
                  onSubmitted: (value) {
                    phoneFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
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

                AD.of(context).h20.ph,
                Row(
                  children: [
                    Checkbox(
                      value: isAgree,
                      onChanged: (value) {
                        isAgree = value!;
                        setState(() {});
                      },
                      activeColor: AppColors.primaryColor,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'I agree to all ',
                        style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
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
                  text: 'Continue',
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    await _registerUser();
                    setState(() {
                      loading = false;
                    });
                  },
                ),


                .8.ph,
                TextButton(
                  onPressed: () {
                    Get.toNamed(Names.login);
                  },
                  child: Text(
                    'Already have an Account? Login',
                    style: TextStyles.subtitle2.copyWith(color: AppColors.termsAndConditions),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    if(fullNameController.text.isEmpty){
      showMessage('Please enter your full name');
      return;
    }
    if(phoneNumberController.text.isEmpty){
      showMessage('Please enter your phone number');
      return;
    }
    if(emailController.text.isEmpty){
      showMessage('Please enter your email');
      return;
    }
    if(passwordController.text.isEmpty){
      showMessage('Please enter your password');
      return;
    }
    if(!isAgree){
      showMessage('Please agree to the terms and conditions');
      return;
    }

    // Call the registerUser method from the AuthController
    await Get.find<AuthController>().registerUser(emailController.text, passwordController.text).then((value) async {
      if(value){
        await _saveUserDetails();
        showMessage('User registered successfully');
        Get.offNamedUntil(Names.login, (route) => false);
      }
    });
  }

  Future<void> _saveUserDetails () async {
    await Get.find<AuthController>().saveUserDetails(UserModel(
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
    )).then((value) {
      if(value){
        print("User details saved successfully");
      }else{
        print('Error saving user details');
      }
    });
  }
}