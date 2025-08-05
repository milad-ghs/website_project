import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:website/core/screens/featured/sliderpicture.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FutureProject extends StatelessWidget {
  const FutureProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(211, 210, 209, 1.0),
          border: Border.all(width: 0, color: Colors.white)),
      height: 1.2.sh,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.only(top: 20.sp, bottom: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.featured,
                style: TextStyle(
                    color: const Color.fromRGBO(56, 75, 112, 1),
                    fontSize: 12.sp)),
            const SizedBox(height: 50),
            const Expanded(child: SliderPicture()),
          ],
        ),
      ),
    );
  }
}
