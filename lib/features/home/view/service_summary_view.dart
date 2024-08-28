import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:patient_app/features/home/controller/home_controller.dart';
import 'package:patient_app/features/home/model/appointment_model.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_dimensions.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/app_text_styles.dart';
import 'package:patient_app/utils/components/custom_button.dart';
import 'package:patient_app/utils/components/custom_payment_button.dart';
import 'package:patient_app/utils/extensions/magins.dart';
import 'package:patient_app/utils/messages.dart';

import '../../../utils/components/custom_appbar.dart';
import '../../../utils/date_utils.dart';

class ServiceSummary extends StatefulWidget {
  final AppointmentModel appointment;
  const ServiceSummary({super.key, required this.appointment});

  @override
  State<ServiceSummary> createState() => _ServiceSummaryState();
}

class _ServiceSummaryState extends State<ServiceSummary> {

  String selectedPaymentMethod = 'Visa';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: myAppbar(context: context, title: 'Service Summary',),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AD.of(context).w45, vertical: AD.of(context).h20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AD.of(context).w24, vertical: AD.of(context).h15),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.white100,
                        borderRadius: BorderRadius.circular(AD.of(context).r10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(AppImages.loveHeart, height: AD.of(context).h45,),

                              AD.of(context).w24.pw,
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Healthcare Consultation', style: TextStyles.subtitle1,),
                                    Text('Service ID: 01BC1GEFF', style: TextStyles.bodyText2,),
                                  ],
                                ),
                              ),

                              AD.of(context).w24.pw,
                              const Text('\$500.00', style: TextStyles.headline2,),


                            ],
                          ),

                          const Divider(height: 30,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text('Lorem ipsum dolor ist amet?', style: TextStyles.subtitle1,)),
                              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,),
                            ],
                          ),

                          const Divider(height: 30,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text('Lorem ipsum dolor ist amet?', style: TextStyles.subtitle1,)),
                              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,),
                            ],
                          ),

                          const Divider(height: 30,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text('Lorem ipsum dolor ist amet?', style: TextStyles.subtitle1,)),
                              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,),
                            ],
                          ),

                          const Divider(height: 30,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text('Phone Number', style: TextStyles.subtitle1,)),
                              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,),
                            ],
                          ),

                        ],
                      ),
                    ),

                    AD.of(context).h20.ph,

                    Text("Service Summary", style: TextStyles.headline2.copyWith(fontSize: 24),),

                    AD.of(context).h20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(child: Text('Date of Consultation', style: TextStyles.bodyText1,)),
                        Text(formatDate(widget.appointment.date.toDate()), style: TextStyles.bodyText1,),
                      ],
                    ),

                    AD.of(context).h20.ph,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Text('Service Charges', style: TextStyles.bodyText1,)),
                        Text("\$0.00", style: TextStyles.bodyText1,),
                      ],
                    ),

                    AD.of(context).h20.ph,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Text("Tax", style: TextStyles.bodyText1,)),
                        Text("\$0.00", style: TextStyles.bodyText1,),
                      ],
                    ),

                    AD.of(context).h20.ph,
                    Text("Payment Method", style: TextStyles.subtitle1.copyWith(fontSize: 24),),

                    AD.of(context).h20.ph,
                    PaymentButton(
                      image: AppImages.visa,
                      name: 'Visa xxx 3301',
                      isSelected: selectedPaymentMethod == "Visa",
                      onPressed: (){
                        setState(() {
                          selectedPaymentMethod = "Visa";
                        });
                      },
                      imagePadding: 16,
                      desc: 'Expires 12/23',
                    ),

                    AD.of(context).h20.ph,
                    PaymentButton(
                      image: AppImages.payPal,
                      name: 'PayPal',
                      isSelected: selectedPaymentMethod == "PayPal",
                      onPressed: (){
                        setState(() {
                          selectedPaymentMethod = "PayPal";
                        });
                      },
                      imagePadding: 10,
                    ),

                    AD.of(context).h20.ph,
                    PaymentButton(
                      image: AppImages.apple,
                      name: 'Apple Pay',
                      isSelected: selectedPaymentMethod == "Apple Pay",
                      onPressed: (){
                        setState(() {
                          selectedPaymentMethod = "Apple Pay";
                        });
                      },
                      imagePadding: 10,
                    ),

                    AD.of(context).h30.ph,
                  ],
                ),
              )
            ),

            loading ?
            const CircularProgressIndicator() :
            CustomButton(
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white100,
              text: 'Confirm',
              onPressed: () async {
                loading = true;
                setState(() {});
                var result = await Get.find<HomeController>().bookAppointment(widget.appointment);
                if(result == null){
                  showMessage("Error, Something went wrong, please try again later.");
                  loading = false;
                  setState(() {});
                  return;
                }
                loading = false;
                setState(() {});
                context.mounted ? _showPaymentDoneDialog(context) : null;
              },
            ),
          ],
        ),
      ),
    );
  }

  // show payment done dialog
  void _showPaymentDoneDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white100,
          surfaceTintColor: AppColors.white100,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AD.of(context).r10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.bookedCheck, height: AD.of(context).h45 * 4,),
              AD.of(context).h20.ph,
              const Text('Booked Successful!', style: TextStyles.headline1, textAlign: TextAlign.center,),
              AD.of(context).h20.ph,
              const Text('We will give you a short call for confirmation and then we will schedule a booking call with you.', style: TextStyles.bodyText1, textAlign: TextAlign.center,),
              AD.of(context).h20.ph,
              CustomButton(
                text: 'Done',
                onPressed: (){
                  Navigator.of(context)
                    ..pop()
                    ..pop()
                    ..pop();
                },
              ),
            ],
          )
        );
      },
    );
  }
}

