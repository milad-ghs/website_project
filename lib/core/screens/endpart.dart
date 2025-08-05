import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EndPart extends StatelessWidget {
  const EndPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color.fromRGBO(211, 210, 209, 1.0), border: Border.all(width: 0, color: Colors.white)),
        height: 1.02.sh,
        width: 1.sw,
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.127.sw),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Text("mersaad.studio@gmail.com", style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(56, 75, 112, 1), letterSpacing: 1.1)),
                  Divider(height: 2, color: Colors.grey, thickness: 0.5, endIndent: 0.05.sw, indent: 0.05.sw),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text(AppLocalizations.of(context)!.iran, style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(56, 75, 112, 1))),
                        Text("+98-543165884", style: GoogleFonts.poppins(fontSize: 6.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(138, 153, 138, 1)))
                      ]),
                      Column(children: [
                        Text(AppLocalizations.of(context)!.qatar, style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(56, 75, 112, 1))),
                        Text("+972-545651", style: GoogleFonts.poppins(fontSize: 6.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(138, 153, 138, 1)))
                      ]),
                      Column(children: [
                        Text(AppLocalizations.of(context)!.germany, style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(56, 75, 112, 1))),
                        Text("+49-354686431", style: GoogleFonts.poppins(fontSize: 6.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(138, 153, 138, 1)))
                      ]),
                    ],
                  ),
                  Divider(height: 2, color: Colors.grey, thickness: 0.5, endIndent: 0.05.sw, indent: 0.05.sw),
                  Text("Iran - mazandaran - babol - khorshidkola - meraj 2", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.sp, color: const Color.fromRGBO(56, 75, 112, 1))),
                  Divider(height: 2, color: Colors.grey, thickness: 0.5, endIndent: 0.05.sw, indent: 0.05.sw),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("MERSAD CO", style: GoogleFonts.poppins(fontSize: 5.sp, fontWeight: FontWeight.w500, color: const Color.fromRGBO(56, 75, 112, 1), letterSpacing: 1.2)),
                        Text("All rights of this site belong to Mersad Group", style: TextStyle(fontSize: 3.sp, color: Colors.black))
                      ],
                    ),
                  ])
                ]))));
  }
}
