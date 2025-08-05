import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class Textbox extends StatefulWidget {
  const Textbox({super.key});

  @override
  State<Textbox> createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  /// controller for text field
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController messageEditingController = TextEditingController();
  TextEditingController numberEditingController = TextEditingController();

  /// focus node for text field
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: languageLocal == "en" ? TextDirection.ltr : TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(56, 75, 112, 1),
          border: Border.all(width: 0, color: Colors.white),
        ),
        height: 1.35.sh,
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 0.2.sh),
            Text(AppLocalizations.of(context)!.connect,
                style: const TextStyle(
                  // fontFamily: "BTraffic",
                  fontSize: 30,
                  color: Color.fromRGBO(211, 210, 209, 1.0),
                )),
            SizedBox(height: 0.01.sh),
            Divider(height: 2, color: const Color.fromRGBO(211, 210, 209, 1.0), thickness: 0.5, endIndent: 0.425.sw, indent: 0.425.sw),
            SizedBox(height: 0.016.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
                    child: SvgPicture.asset(
                      'assets/icons/eitaalogo.svg',
                      height: 40,
                      width: 40,
                    )),
                SizedBox(width: 0.02.sw),
                SvgPicture.asset(
                  'assets/icons/instagramlogo.svg',
                  height: 45,
                  width: 45,
                ),
                SizedBox(width: 0.02.sw),
                SvgPicture.asset(
                  'assets/icons/telegram.com.svg',
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 0.02.sw),
                SvgPicture.asset(
                  'assets/icons/whatsapplogo.svg',
                  height: 40,
                  width: 40,
                )
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.3.sw),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                maxLength: 30,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z a-z _ . @ \u0600-\u06FF]'))],
                minLines: 1,
                cursorColor: Colors.blueAccent,
                controller: nameEditingController,
                onEditingComplete: () => f2.requestFocus(),
                focusNode: f1,
                cursorHeight: 4.sp,
                cursorOpacityAnimates: true,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.blue.s,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      )),
                  contentPadding: EdgeInsets.all(3.7.sp),
                  counterText: "",
                  label: Text(AppLocalizations.of(context)!.name),
                  labelStyle: const TextStyle(color: Color.fromRGBO(211, 210, 209, 1.0), fontFamily: "Vazir"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.3.sw),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.  + @ a-zA-Z0-9]'))],
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(
                //       RegExp(r'^[@]+[a-zA-Z0-9._%+-]{2,}')
                //   )
                // ],
                maxLength: 30,
                minLines: 1,
                cursorHeight: 4.sp,
                cursorOpacityAnimates: true,
                enableInteractiveSelection: false,
                cursorColor: Colors.blueAccent,
                controller: emailEditingController,
                onEditingComplete: () => f3.requestFocus(),
                focusNode: f2,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(3.7.sp),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      )),
                  counterText: "",
                  label: Text(AppLocalizations.of(context)!.email),
                  labelStyle: const TextStyle(color: Color.fromRGBO(211, 210, 209, 1.0), fontFamily: "Vazir"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.3.sw),
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.characters,
                maxLength: 30,
                minLines: 1,
                cursorColor: Colors.blueAccent,
                controller: numberEditingController,
                onEditingComplete: () => f4.requestFocus(),
                focusNode: f3,
                cursorHeight: 4.sp,
                cursorOpacityAnimates: true,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.phone_android_outlined,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(3.7.sp),
                  counterText: "",
                  label: Text(AppLocalizations.of(context)!.phone),
                  // suffixIcon:IconButton(
                  //   onPressed: (){
                  //     numberEditingController.clear();
                  //   },
                  //   icon: const Icon(Icons.clear,color: Colors.red,),
                  // ) ,
                  labelStyle: const TextStyle(color: Color.fromRGBO(211, 210, 209, 1.0), fontFamily: "Vazir"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.3.sw),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                maxLength: 1000,
                maxLines: 5,
                cursorHeight: 4.sp,
                cursorOpacityAnimates: true,
                mouseCursor: MouseCursor.defer,
                cursorColor: Colors.blueAccent,
                controller: messageEditingController,
                focusNode: f4,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(4.sp),
                  // suffixIcon:IconButton(
                  //   onPressed: (){
                  //     messageEditingController.clear();
                  //   },
                  //   icon: const Icon(Icons.clear,color: Colors.red,),
                  // ) ,
                  counterText: "",
                  label: Text(AppLocalizations.of(context)!.message),
                  labelStyle: const TextStyle(color: Color.fromRGBO(211, 210, 209, 1.0), fontFamily: "Vazir"),
                  // contentPadding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text(
                AppLocalizations.of(context)!.send,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
