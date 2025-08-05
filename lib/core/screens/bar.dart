import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/core/bloc/language_cubit.dart';

import '../../main.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: DelayedDisplay(
        fadingDuration: const Duration(milliseconds: 800),
        child: Padding(
          padding: EdgeInsets.only(right: 0.02.sw),
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(width: 0.1.sw, height: 0.032.sh, 'assets/icons/email.svg', color: Colors.white),
                      SizedBox(width: 0.01.sw),
                      Text("Mersad@gmail.com", style: GoogleFonts.poppins(fontSize: 5.sp, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: 1.3)),
                    ],
                  ),
                  SizedBox(width: 0.02.sw),
                  Row(
                    children: [
                      SvgPicture.asset(width: 0.1.sw, height: 0.03.sh, 'assets/icons/phone-call.svg', color: Colors.white),
                      SizedBox(width: 0.01.sw),
                      Text(
                        "011-34772558",
                        style: TextStyle(fontSize: 4.5.sp, fontWeight: FontWeight.w500, color: Colors.white, letterSpacing: 2),
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(width: 0.02.sw),
                  Row(
                    children: [
                      SvgPicture.asset(width: 0.2.sw, height: 0.0325.sh, 'assets/icons/map.svg', color: Colors.white),
                      SizedBox(width: 0.01.sw),
                      Text(AppLocalizations.of(context)!.helloWorld, style: GoogleFonts.poppins(fontSize: 5.sp, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: 4)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(width: 0.2.sw, height: 0.0325.sh, 'assets/icons/globe.svg', color: Colors.white),
                  SizedBox(width: 0.025.sw),
                  Row(
                    children: [
                      TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(languageLocal == "en" ? Colors.blue : Colors.transparent)),
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context).setLanguage('default', 'en');
                          },
                          child: Text("En", style: GoogleFonts.poppins(fontSize: 4.5.sp, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: 2.3))),
                      SizedBox(width: 0.006.sw),
                      TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(languageLocal == "ar" ? Colors.blueAccent : Colors.transparent)),
                          child: Text("Ar", style: GoogleFonts.poppins(fontSize: 4.5.sp, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: 2.3)),
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context).setLanguage('Badr', 'ar');
                          }),
                      SizedBox(width: 0.006.sw),
                      TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(languageLocal == "fa" ? Colors.blueAccent : Colors.transparent)),
                          child: Text("Fa", style: GoogleFonts.poppins(fontSize: 4.5.sp, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: 2.3)),
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context).setLanguage('Vazir', 'fa');
                          })
                    ],
                  ),
                  //   ],
                  // )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
