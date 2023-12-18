// ignore: unused_import
import "dart:ffi";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = Locale('en');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color surfaceColor = Color.fromARGB(32, 255, 255, 255);
    // ignore: unused_local_variable
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfing.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfing.light().getTheme('fa'),
      home: MyHomePage(
        toggleThemeMOde: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
        selectedLanguageChanged: (_Languge newSelectedByUser) {
        setState(() {
            _locale=newSelectedByUser==_Languge.en?
          Locale('en'):
          Locale('fa');
        });
        },
      ),
    );
  }
}

class MyAppThemeConfing {
  static const String faprimaryFontFamiy = 'Yekan';
  final Color primaryTextColor;
  final Color primaryColor = Colors.pink.shade400;
  final Color secondrayTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appColor;
  final Brightness brightness;

  MyAppThemeConfing.dark()
      : primaryTextColor = Colors.white,
        secondrayTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfing.light()
      : primaryTextColor = Colors.grey.shade900,
        secondrayTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a blue toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      brightness: brightness,
      dividerTheme: (DividerThemeData(color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor)),
      ),
      dividerColor: surfaceColor,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:TextStyle(fontSize: 14,fontWeight:FontWeight.normal) ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: surfaceColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appColor),
      textTheme: languageCode == 'en' ? enPrimaryTextTheme : faprimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
        bodyText1: TextStyle(fontSize: 15, color: secondrayTextColor),
        bodyText2: TextStyle(fontSize: 16, color: primaryTextColor),
        headline6:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
        subtitle1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor),
      ));
  TextTheme get faprimaryTextTheme => TextTheme(
        bodyText1: TextStyle(
          fontSize: 15,
          height: 1.5,
          color: secondrayTextColor,
          fontFamily: faprimaryFontFamiy,
        ),
        caption: TextStyle(fontFamily: faprimaryFontFamiy),
        bodyText2: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faprimaryFontFamiy),
        headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faprimaryFontFamiy),
        subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faprimaryFontFamiy),
            button: TextStyle(fontFamily:faprimaryFontFamiy)
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMOde;
  final Function(_Languge _languge) selectedLanguageChanged;

  const MyHomePage({super.key, required this.toggleThemeMOde,required this.selectedLanguageChanged});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType {
  photoShop,
  xd,
  illuStrator,
  afterEffect,
  lightRoom,
}

enum _Languge {
  en,
  fa,
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoShop;
  _Languge _languge = _Languge.fa;
  void _updateSelectSkill(_SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  void _updateSelectedLanguage(_Languge languge) {
    widget.selectedLanguageChanged(languge);
    setState(() {
      _languge = languge;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(localization.profileTitle),
          actions: [
            SizedBox(
              width: 8,
            ),
            Icon(CupertinoIcons.chat_bubble),
            InkWell(
              onTap: widget.toggleThemeMOde,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(CupertinoIcons.ellipsis_vertical),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/profile_image.png',
                          width: 60,
                          height: 60,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            localization.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(localization.job),
                          SizedBox(
                            height: 4,
                          ),
                          Row(children: [
                            Icon(
                              size: 16,
                              CupertinoIcons.location,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              localization.location,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ]),
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  localization.summary,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(localization.selectedLanguage),
                    CupertinoSlidingSegmentedControl<_Languge>(
                        groupValue: _languge,
                        thumbColor: Theme.of(context).colorScheme.primary,
                        children: {
                          _Languge.en: Text(
                            localization.enLanguage,
                            style: TextStyle(fontSize: 14),
                          ),
                          _Languge.fa: Text(
                            localization.faLanguage,
                            style: TextStyle(fontSize: 14),
                          ),
                        },
                        onValueChanged: (value) {
                          if (value != null) _updateSelectedLanguage(value);
                        })
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localization.skills,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skills(
                      title: 'Photoshop',
                      path: 'assets/app_icon_01.png',
                      shodowcolor: Colors.blue,
                      isActivite: _skill == _SkillType.photoShop,
                      type: _SkillType.photoShop,
                      onTap: () {
                        _updateSelectSkill(_SkillType.photoShop);
                      },
                    ),
                    Skills(
                      title: 'Adobe XD',
                      path: 'assets/app_icon_05.png',
                      shodowcolor: Colors.pink,
                      isActivite: _skill == _SkillType.xd,
                      type: _SkillType.xd,
                      onTap: () {
                        _updateSelectSkill(_SkillType.xd);
                      },
                    ),
                    Skills(
                      title: 'lilustrator',
                      path: 'assets/app_icon_04.png',
                      shodowcolor: Colors.orange,
                      isActivite: _skill == _SkillType.illuStrator,
                      type: _SkillType.illuStrator,
                      onTap: () {
                        _updateSelectSkill(_SkillType.illuStrator);
                      },
                    ),
                    Skills(
                      title: 'After Effect',
                      path: 'assets/app_icon_03.png',
                      shodowcolor: Colors.blue.shade800,
                      isActivite: _skill == _SkillType.afterEffect,
                      type: _SkillType.afterEffect,
                      onTap: () {
                        _updateSelectSkill(_SkillType.afterEffect);
                      },
                    ),
                    Skills(
                      title: 'Lightroom',
                      path: 'assets/app_icon_02.png',
                      shodowcolor: Colors.blue,
                      isActivite: _skill == _SkillType.lightRoom,
                      type: _SkillType.lightRoom,
                      onTap: () {
                        _updateSelectSkill(_SkillType.lightRoom);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localization.personalInformation,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText:localization.email,
                        prefixIcon: Icon(CupertinoIcons.at),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: localization.password,
                        prefixIcon: Icon(CupertinoIcons.lock),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(localization.save),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Skills extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String path;
  final Color shodowcolor;
  final bool isActivite;
  final Function() onTap;
  const Skills({
    super.key,
    required this.title,
    required this.path,
    required this.shodowcolor,
    required this.isActivite,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defulltborderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defulltborderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActivite
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: defulltborderRadius,
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: shodowcolor, blurRadius: 12),
                ]),
                child: Image.asset(path, height: 40, width: 40)),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
