import 'package:bot_toast/bot_toast.dart';

showMessage(String text){
  BotToast.showText(text: text, duration: const Duration(seconds: 3));
}