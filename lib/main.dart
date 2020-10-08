import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shimmer/shimmer.dart';

import './screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/route.dart';
import 'util/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/Lang/', apiKeyGoogle: '<Key>', // NOT YET TESTED
  );
  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryo Class',
      theme: themeData(ThemeConfig.lightTheme),
      // darkTheme: themeData(ThemeConfig.darkTheme),
      home: Language(),
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(),
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0XFF076585),
          end: Color(0XFFfff),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      /* 
   TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
  */
    ],
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            // backgroundColor: Color(0XFF121212),
            body: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: background
                      .evaluate(AlwaysStoppedAnimation(_controller.value)),
                  //   gradient: LinearGradient(

                  //     colors: [
                  //       Color(0XFF076585),
                  //       Color(0XFFfff),
                  //     ],
                  //     begin: Alignment.topRight,
                  //     end: Alignment.bottomLeft,
                  //     tileMode: TileMode.clamp,
                  //   ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translator.translate('language'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      highlightColor: Colors.white,
                      highlightElevation: 8,
                      elevation: 7,
                      color: Colors.cyan,
                      child: Text(
                        translator.translate('arabic'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'ar',
                          remember: true,
                          restart: false,
                        );
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: Loading(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      elevation: 7,
                      highlightColor: Colors.white,
                      highlightElevation: 8,
                      color: Colors.blueAccent,
                      child: Text(
                        translator.translate('english'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'en',
                          remember: true,
                          restart: false,
                        );
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: Loading(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

/*
 
       
*/
