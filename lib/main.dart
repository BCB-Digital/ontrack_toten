import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrack_toten/app/modules/home/home_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const Main({Key? key}) : super(key: key);

  static const locale = Locale('pt', 'BR');

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  void initState() {
    super.initState();

    // BackendCall.defaultUrl = getBackendUrl();
    // BackendCall.defaultSubPackage = "adm";
  }

  // String getBackendUrl() {
  //   // Se web
  //   if (kIsWeb) {
  //     // Busca caminho relativo ao front
  //     Uri uri = Uri.base.resolve("/api/backend");
  //     if (uri.host != "localhost" && uri.host != "127.0.0.1") {
  //       // Se não for localhost (não for dev) -> retorna caminho relativo
  //       return uri.toString();
  //     }
  //   }
  //   // Usa defaultUrl do arquivo de config
  //   return EnvironmentAppConfig.defaultUrl;
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ontrack',
      debugShowCheckedModeBanner: false,
      // navigatorKey: Main.navigatorKey,
      theme: ThemeData(
        tooltipTheme: TooltipTheme.of(context).copyWith(
          waitDuration: const Duration(milliseconds: 1000),
          triggerMode: TooltipTriggerMode.manual,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: GoogleFonts.comfortaaTextTheme(),
      ),
      home: const HomePage(),
      locale: Main.locale,
      supportedLocales: const [Main.locale],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }


}

