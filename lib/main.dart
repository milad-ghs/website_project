import 'dart:ui';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:website/core/bloc/language_cubit.dart';
import 'package:website/core/screens/bar.dart';
import 'package:website/core/screens/division.dart';
import 'core/screens/endpart.dart';
import 'core/screens/featured/futureproject.dart';
import 'core/screens/products/product.dart';
import 'core/screens/textbox.dart';

String languageFont = "Vazir";
String languageLocal = "fa";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => LanguageCubit(),
            child: BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                if (state is LanguageSetState) {
                  languageFont = state.languageFont;
                  languageLocal = state.languageLocal;
                }

                return MaterialApp(
                  // key: UniqueKey(),
                    theme: ThemeData(fontFamily: languageFont),
                    scrollBehavior: const MaterialScrollBehavior().copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.stylus,
                          PointerDeviceKind.unknown
                        }),
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    locale: Locale(languageLocal, ""),
                    supportedLocales: const [
                      Locale("en", ""),
                      Locale("fa", ""),
                      Locale("ar", ""),
                    ],
                    home: const MyHomePage());
              },
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool backToTop = false;
  ScrollController scrollController = ScrollController(
      initialScrollOffset: 0.sh);
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset > 1.sh) {
        backToTop = true;
      } else {
        backToTop = false;
      }
      setState(() {});
    });

    videoPlayerController =
        VideoPlayerController.asset('assets/video/purpleglo.mp4');
    _initializeVideoPlayerFuture = videoPlayerController.initialize();

    videoPlayerController.addListener(() {
      setState(() {});
    });
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.0);
    videoPlayerController.play();
  }

  @override
  void dispose() {
    scrollController.removeListener;
    scrollController.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  bool isMusicOn = false;

  soundToggle() {
    setState(() {
      isMusicOn == false
          ? videoPlayerController.setVolume(1.0)
          : videoPlayerController.setVolume(0.0);
      isMusicOn = !isMusicOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: const Color.fromRGBO(56, 75, 112, 1),
                  child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.right,
                      thumbVisibility: true,
                      controller: scrollController,
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                      height: 1.sh,
                                      width: 1.sw,
                                      child: Stack(children: [ FutureBuilder(
                                          future: _initializeVideoPlayerFuture,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return ClipRRect(
                                                child: SizedBox.expand(
                                                  child: FittedBox(
                                                    alignment: Alignment.center,
                                                    fit: BoxFit.cover,
                                                    child: SizedBox(
                                                      height: videoPlayerController
                                                          .value.size.height,
                                                      width: videoPlayerController
                                                          .value.size.width,
                                                      child: VideoPlayer(
                                                          videoPlayerController),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                  child: CircularProgressIndicator());
                                            }
                                          }),

                                        /// top

                                        const Bar(),

                                        /// lottie Animation

                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 0.3.sh),
                                            child: GestureDetector(
                                              onTap: () {
                                                scrollController.animateTo(
                                                    1.15.sh,
                                                    duration: const Duration(
                                                        milliseconds: 1000),
                                                    curve: Curves.ease);
                                              },
                                              child: DelayedDisplay(
                                                fadingDuration: const Duration(
                                                    milliseconds: 800),
                                                child: RotatedBox(
                                                    quarterTurns: 2,
                                                    child: Lottie.asset(
                                                        'assets/animation/a1.json',
                                                        height: 200,
                                                        width: 200,
                                                        reverse: false)),
                                              ),
                                            ),
                                          ),
                                        ),

                                        /// icon for video

                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                                padding: EdgeInsets.all(
                                                    0.02.sw),
                                                child: IconButton(
                                                    onPressed: () {
                                                      soundToggle();
                                                    },
                                                    icon: Icon(isMusicOn == true
                                                        ? Icons.volume_up
                                                        : Icons.volume_off,
                                                        color: Colors.white,
                                                        size: 6.sp)))),

                                        /// Logo

                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 32.0,
                                                right: 32.0,
                                                bottom: 32.0,
                                                left: 0.02.sw),
                                            child: SizedBox(
                                              width: 200,
                                              height: 200,
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/logo_white.png',
                                                      height: 200, width: 200),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomLeft,
                                                      child: Padding(
                                                          padding: const EdgeInsets
                                                              .only(left: 12.0),
                                                          child: Text('MERSAD',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily: 'Vazir',
                                                                  fontSize: 4
                                                                      .sp,
                                                                  letterSpacing: 2))))
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ])),
                                  const Division(),
                                  const Products(),
                                  const FutureProject(),
                                  const Textbox(),
                                  const EndPart(),
                                ],
                              )
                            ],
                          )))),
              Padding(
                  padding: backToTop ? const EdgeInsets.only(
                      left: 15.0, bottom: 90) : const EdgeInsets.all(44.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                          onTap: () {},
                          child: DelayedDisplay(
                              fadingDuration: const Duration(milliseconds: 400),
                              child: Container(
                                  decoration: BoxDecoration(boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 4.0)
                                  ],
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Tooltip(
                                          verticalOffset: -15,
                                          margin: const EdgeInsets.only(
                                              left: 93),
                                          showDuration: const Duration(
                                              milliseconds: 50),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius
                                                  .circular(10)),
                                          message: "Chat with us",
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          child: const Icon(Icons.message,
                                              color: Colors.white,
                                              size: 30))))))))
            ],
          ),
          floatingActionButton: Visibility(
            visible: backToTop,
            child: Tooltip(
              showDuration: const Duration(milliseconds: 50),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              message: 'Back to top',
              textStyle: const TextStyle(color: Colors.white),
              child: FloatingActionButton(
                // tooltip: 'Back to top',
                heroTag: 'back to top',
                mini: true,
                backgroundColor: const Color.fromRGBO(138, 153, 138, 1),
                onPressed: () {
                  scrollController.animateTo(
                      0.0, duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                },
                child: const Icon(
                    Icons.vertical_align_top, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
