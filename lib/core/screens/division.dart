import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Division extends StatelessWidget {
  const Division({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(6, 1, 27, 1.0),
        gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [Color.fromRGBO(6, 1, 27, 1.0), Color.fromRGBO(40, 6, 106, 1.0), Color.fromRGBO(56, 35, 97, 1.0)]),
      ),
      height: 1.3.sh,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.06.sh),
            child: Text(AppLocalizations.of(context)!.products, style: TextStyle(color: const Color.fromRGBO(138, 153, 138, 1), fontSize: 16.sp, letterSpacing: 1.5)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(child: SizedBox(height: 0.80.sh, width: 0.4.sw)),
                  Positioned(
                    top: 0.075.sh,
                    right: 0.135.sw,
                    child: Container(height: 0.65.sh, width: 0.145.sw, decoration: const BoxDecoration(border: GradientBoxBorder(gradient: LinearGradient(colors: [Colors.transparent, Colors.pink]), width: 4))),
                  ),
                  Positioned(
                    left: 0,
                    top: 0.1.sh,
                    child: SizedBox(
                      height: 0.60.sh,
                      width: 0.25.sw,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: const AssetImage('assets/images/amoozesh.jpg'), colorFilter: ColorFilter.mode(Colors.grey[500]!, BlendMode.modulate))),
                        child: Text(
                          AppLocalizations.of(context)!.educational,
                          style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(child: SizedBox(height: 0.80.sh, width: 0.4.sw)),
                  Positioned(
                      top: 0.034.sh, left: 0.08.sw, child: Container(height: 0.73.sh, width: 0.175.sw, decoration: const BoxDecoration(border: GradientBoxBorder(gradient: LinearGradient(colors: [Colors.greenAccent, Colors.transparent]), width: 4)))),
                  Positioned(
                    right: 0,
                    top: 0.064.sh,
                    child: SizedBox(
                      height: 0.67.sh,
                      width: 0.30.sw,
                      child: Container(
                        // margin: const EdgeInsets.only(bottom: 7.5, top: 7.5, left: 7.5),
                        alignment: Alignment.center,
                        foregroundDecoration: const BoxDecoration(color: Colors.white24),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: const AssetImage('assets/images/namayesh.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.modulate)),
                          color: const Color.fromRGBO(39, 57, 72, 1),
                        ),
                        child: Text(AppLocalizations.of(context)!.exhibitive, style: TextStyle(fontSize: 13.sp, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
