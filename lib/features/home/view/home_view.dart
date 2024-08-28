import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/routes/names.dart';
import 'package:patient_app/core/session/user_session.dart';
import 'package:patient_app/features/auth/controller/auth_controller.dart';
import 'package:patient_app/features/home/model/appointment_model.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_dimensions.dart';
import 'package:patient_app/utils/app_fonts.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/app_text_styles.dart';
import 'package:patient_app/utils/components/custom_button.dart';
import 'package:patient_app/utils/extensions/magins.dart';
import 'package:patient_app/utils/extensions/texts.dart';
import 'package:patient_app/utils/messages.dart';

import '../../../utils/components/custom_expandable_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool itemOne = true;
  bool itemTwo = false;
  bool itemThree = false;
  String selectedChild = 'Kevin Backer';
  String selectedGender = "Male";
  List<String> childList = ['Kevin Backer', 'Another Child'];
  List<String> genderList = ["Male","Female","Child"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: AD.of(context).w45, vertical: AD.of(context).h45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AD.of(context).h20.ph,
                Image.asset(AppImages.hye, height: AD.of(context).h30,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hye ${UserSession().user?.fullName ?? "N/A"},".cp,
                            style: TextStyles.headline1.copyWith(color: AppColors.white100, fontSize: 36, fontFamily: AppFonts.tiroKannada, fontStyle: FontStyle.italic, letterSpacing: 1.5),
                          ),
                          Text(
                            "How we can help you today?",
                            style: TextStyles.subtitle2.copyWith(color: AppColors.white100,),
                          ),
                        ],
                      ),
                    ),

                    AD.of(context).w30.pw,

                    InkWell(
                      onTap: () async {
                        Future.wait([
                          UserSession().clearUserDetails(),
                          Get.find<AuthController>().signOut(),
                        ]);
                        showMessage("Logged out successfully.");
                        Get.offNamedUntil(Names.login, (route) => false);
                      },
                      child: Image.asset(AppImages.notification, height: AD.of(context).h45,)),
                  ],
                ),
                
                AD.of(context).h20.ph,
                CustomButton(
                  text: 'Seek Care Now',
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric( vertical: AD.of(context).h20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Your Appointments", style: TextStyles.headline2,).paddingSymmetric(horizontal: AD.of(context).w45),

                    AD.of(context).h20.ph,
                    Container(
                      margin: EdgeInsets.only(left: AD.of(context).w45),
                      width: double.maxFinite,
                      height: AD.of(context).h45*3.0,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: AD.of(context).w20),
                            padding: EdgeInsets.symmetric(horizontal: AD.of(context).w30, vertical: AD.of(context).h20),
                            decoration: BoxDecoration(
                              color: AppColors.white100,
                              borderRadius: BorderRadius.circular(AD.of(context).r10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppImages.timer, height: AD.of(context).h24,),
                                    Text("You're number 3 in queue.", style: TextStyles.headline2.copyWith(color: AppColors.primaryColor),),
                                  ],
                                ),

                                5.0.ph,
                                const Text("Please wait for your call", style: TextStyles.subtitle2,),

                                5.0.ph,
                                const Text("December 23, 2023 - 12:33 AM", style: TextStyles.subtitle1,),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    AD.of(context).h20.ph,
                    const Text("Frequently asked questions", style: TextStyles.headline2,).paddingSymmetric(horizontal: AD.of(context).w45),

                    AD.of(context).h20.ph,
                    ExpandableContainer(
                      title: "What is the cost of the service?",
                      desc: "The cost of the service is \$100.00",
                      isExpanded: itemOne,
                      onTap: () {
                        setState(() {
                          itemOne = !itemOne;
                        });
                      },
                    ),

                    AD.of(context).h10.ph,
                    ExpandableContainer(
                      title: "What is Healthcare?",
                      desc: "Healthcare is the maintenance or improvement of health via the prevention, diagnosis, treatment, recovery, or cure of disease, illness, injury, and other physical and mental impairments in people.",
                      isExpanded: itemTwo,
                      onTap: () {
                        setState(() {
                          itemTwo = !itemTwo;
                        });
                      },
                    ),

                    AD.of(context).h10.ph,
                    ExpandableContainer(
                      title: "What is the cost of the service?",
                      desc: "The cost of the service is \$100.00",
                      isExpanded: itemThree,
                      onTap: () {
                        setState(() {
                          itemThree = !itemThree;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white100,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.black500,
        selectedLabelStyle: TextStyles.bodyText2,
        unselectedLabelStyle: TextStyles.bodyText2,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.home, height: AD.of(context).h24,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.chats, height: AD.of(context).h24,),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.profile, height: AD.of(context).h24,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: AppColors.black500.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AD.of(context).r20)),
      ),
      showDragHandle: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AD.of(context).w45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Type',
                    style: TextStyles.subtitle1.copyWith(fontSize: 24),
                  ),
                ),

                AD.of(context).h20.ph,
                Text(
                  'Select Child',
                  style: TextStyles.subtitle1.copyWith(fontSize: 24),
                ),

                5.0.ph,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AD.of(context).w20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.white100,
                    borderRadius: BorderRadius.circular(AD.of(context).r10),
                    border: Border.all(color: AppColors.black300.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedChild,
                          icon: const Icon(Icons.arrow_drop_down, size: 0,),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (newValue) {
                            print(newValue);
                            setState(() {
                              selectedChild = newValue ?? 'Kevin Backer';
                            });
                          },
                          items: childList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.bodyText1.copyWith(color: AppColors.black100),),
                            );
                          }).toList(),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, size: 24, color: AppColors.black100),
                    ],
                  ),
                ),

                AD.of(context).h20.ph,
                Text(
                  'Select Gender',
                  style: TextStyles.subtitle1.copyWith(fontSize: 24),
                ),

                5.0.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == "Male" ? AppColors.buttonColor : AppColors.white100,
                        foregroundColor: AppColors.black100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: selectedGender == "Male" ? const BorderSide(color: AppColors.buttonColor, width: 2) : BorderSide(color: AppColors.black300.withOpacity(0.2), width: 1.5),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedGender = "Male";
                        });
                      },
                      child: Text(
                        'Male',
                        style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                      ),
                    ),

                    AD.of(context).w30.pw,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == "Female" ? AppColors.buttonColor : AppColors.white100,
                        foregroundColor: AppColors.black100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: selectedGender == "Female" ? const BorderSide(color: AppColors.buttonColor, width: 2) : BorderSide(color: AppColors.black300.withOpacity(0.2), width: 1.5),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedGender = "Female";
                        });
                      },
                      child: Text(
                        'Female',
                        style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                      ),
                    ),

                    AD.of(context).w30.pw,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == "Child" ? AppColors.buttonColor : AppColors.white100,
                        foregroundColor: AppColors.black100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: selectedGender == "Child" ? const BorderSide(color: AppColors.buttonColor, width: 2) : BorderSide(color: AppColors.black300.withOpacity(0.2), width: 1.5),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedGender = "Child";
                        });
                      },
                      child: Text(
                        'Child',
                        style: TextStyles.bodyText1.copyWith(color: AppColors.black100),
                      ),
                    ),
                  ],
                ),

                AD.of(context).h20.ph,
                CustomButton(
                  text: 'Confirm',
                  onPressed: (){
                    AppointmentModel model = AppointmentModel('', UserSession().user?.fullName ?? "N/A", UserSession().user?.email ?? "N/A", UserSession().user?.phoneNumber ?? "N/A", selectedChild, selectedGender, Timestamp.now());
                    Get.toNamed(Names.appointmentDone, arguments: model);
                  },
                ),

                AD.of(context).h20.ph,

              ],
            ),
          );
        });
      },
    );
  }
}

