import 'package:QuickNotes/routes/routes.dart';
import 'package:QuickNotes/utils/theme.dart';
import 'package:QuickNotes/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Services/LocalStorage/CRUDNotes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDB();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = theme.light().textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme =
        createTextTheme(context, "Abhaya Libre", "Abhaya Libre");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 300),
      routerConfig: StartGoRoutes,
      debugShowCheckedModeBanner: false,
      title: "Quick Notes",
      // theme: FlexThemeData.light(
      //   lightIsWhite: true,
      //   colors: const FlexSchemeColor(
      //     primary: Color(0xff00296b),
      //     primaryContainer: Color(0xffa0c2ed),
      //     secondary: Color(0xffd26900),
      //     secondaryContainer: Color(0xffffd270),
      //     tertiary: Color(0xff5c5c95),
      //     tertiaryContainer: Color(0xffc8dbf8),
      //     appBarColor: Color(0xffc8dcf8),
      //     error: Color(0xffd32f2f),
      //   ),
      //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      //   blendLevel: 7,
      //   subThemesData: const FlexSubThemesData(
      //     blendOnLevel: 10,
      //     blendOnColors: false,
      //     useTextTheme: true,
      //     useM2StyleDividerInM3: true,
      //     alignedDropdown: true,
      //     useInputDecoratorThemeInDialogs: true,
      //   ),
      //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //   useMaterial3: true,
      //   swapLegacyOnMaterial3: true,
      // ),
      // darkTheme: FlexThemeData.dark(
      //   darkIsTrueBlack: true,
      //   colors: const FlexSchemeColor(
      //     primary: Color(0xffb1cff5),
      //     primaryContainer: Color(0xff3873ba),
      //     secondary: Color(0xffffd270),
      //     secondaryContainer: Color(0xffd26900),
      //     tertiary: Color(0xffc9cbfc),
      //     tertiaryContainer: Color(0xff535393),
      //     appBarColor: Color(0xff00102b),
      //     error: Color(0xffd32f2f),
      //   ),
      //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      //   blendLevel: 13,
      //   subThemesData: const FlexSubThemesData(
      //     blendOnLevel: 20,
      //     useTextTheme: true,
      //     useM2StyleDividerInM3: true,
      //     alignedDropdown: true,
      //     useInputDecoratorThemeInDialogs: true,
      //   ),
      //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //   useMaterial3: true,
      //   swapLegacyOnMaterial3: true,
      // ),
      // theme: ThemeData(
      //   dropdownMenuTheme: theme.light().dropdownMenuTheme,
      //   disabledColor: theme.light().disabledColor,
      //   badgeTheme: theme.light().badgeTheme,
      //   unselectedWidgetColor: theme.light().unselectedWidgetColor,
      //   elevatedButtonTheme: theme.light().elevatedButtonTheme,
      //   outlinedButtonTheme: theme.light().outlinedButtonTheme,
      //   brightness:theme.light().brightness,
      //
      //
      //   colorScheme: MaterialTheme.lightScheme(),
      //   textTheme: createTextTheme(context, 'Poppins', 'Poppins'),
      //   useMaterial3: true,
      //   listTileTheme: theme.light().listTileTheme,
      //   cardColor: theme.light().cardColor,
      //   canvasColor: theme.light().canvasColor,
      //   shadowColor: theme.light().shadowColor,
      //   dividerColor: theme.light().dividerColor,
      //   focusColor: theme.light().focusColor,
      //   hoverColor: theme.light().hoverColor,
      //   highlightColor: theme.light().highlightColor,
      //   splashColor: theme.light().splashColor,
      //   primaryColor: theme.light().primaryColor,
      //   pageTransitionsTheme: theme.light().pageTransitionsTheme,
      //   scrollbarTheme: theme.light().scrollbarTheme,
      //   snackBarTheme: theme.light().snackBarTheme,
      //   bottomAppBarTheme: theme.light().bottomAppBarTheme,
      //   bottomSheetTheme: theme.light().bottomSheetTheme,
      //   dialogTheme: theme.light().dialogTheme,
      //   floatingActionButtonTheme: theme.light().floatingActionButtonTheme,
      //   navigationRailTheme: theme.light().navigationRailTheme,
      //   popupMenuTheme: theme.light().popupMenuTheme,
      //   bannerTheme: theme.light().bannerTheme,
      //   buttonBarTheme: theme.light().buttonBarTheme,
      //   chipTheme: theme.light().chipTheme,
      //   dataTableTheme: theme.light().dataTableTheme,
      //   datePickerTheme: theme.light().datePickerTheme,
      //   hintColor: theme.light().hintColor,
      //   primaryColorDark: theme.light().primaryColorDark,
      //   primaryColorLight: theme.light().primaryColorLight,
      //   primaryIconTheme: theme.light().primaryIconTheme,
      //   progressIndicatorTheme: theme.light().progressIndicatorTheme,
      //   secondaryHeaderColor: theme.light().secondaryHeaderColor,
      //   searchBarTheme: theme.light().searchBarTheme,
      //   searchViewTheme: theme.light().searchViewTheme,
      //   sliderTheme: theme.light().sliderTheme,
      //   switchTheme: theme.light().switchTheme,
      //   segmentedButtonTheme: theme.light().segmentedButtonTheme,
      //   splashFactory: theme.light().splashFactory,
      //   tabBarTheme: theme.light().tabBarTheme,
      //   textButtonTheme: theme.light().textButtonTheme,
      //   textSelectionTheme: theme.light().textSelectionTheme,
      //   timePickerTheme: theme.light().timePickerTheme,
      //   toggleButtonsTheme: theme.light().toggleButtonsTheme,
      //   tooltipTheme: theme.light().tooltipTheme,
      //   typography: theme.light().typography,
      //   visualDensity: theme.light().visualDensity,
      //   bottomNavigationBarTheme: theme.light().bottomNavigationBarTheme,
      //   buttonTheme: theme.light().buttonTheme,
      //   cardTheme: theme.light().cardTheme,
      //   iconTheme: theme.light().iconTheme,
      //   applyElevationOverlayColor: true,
      //   actionIconTheme: theme.light().actionIconTheme,
      //   iconButtonTheme: theme.light().iconButtonTheme,
      //   indicatorColor: theme.light().indicatorColor,
      //   appBarTheme: theme.light().appBarTheme,
      //   inputDecorationTheme: theme.light().inputDecorationTheme,
      //
      // ),
      darkTheme: ThemeData(
        textTheme: createTextTheme(context, 'Poppins', 'Poppins'),
        brightness: theme.dark().brightness,
        cardColor: theme.dark().cardColor,
        canvasColor: theme.dark().canvasColor,
        shadowColor: theme.dark().shadowColor,
        dividerColor: theme.dark().dividerColor,
        focusColor: theme.dark().focusColor,
        hoverColor: theme.dark().hoverColor,
        highlightColor: theme.dark().highlightColor,
        splashColor: theme.dark().splashColor,
        primaryColor: theme.dark().primaryColor,
        pageTransitionsTheme: theme.dark().pageTransitionsTheme,
        scrollbarTheme: theme.dark().scrollbarTheme,
        snackBarTheme: theme.dark().snackBarTheme,
        bottomAppBarTheme: theme.dark().bottomAppBarTheme,
        bottomSheetTheme: theme.dark().bottomSheetTheme,
        dialogTheme: theme.dark().dialogTheme,
        floatingActionButtonTheme: theme.dark().floatingActionButtonTheme,
        navigationRailTheme: theme.dark().navigationRailTheme,
        popupMenuTheme: theme.dark().popupMenuTheme,
        bannerTheme: theme.dark().bannerTheme,
        buttonBarTheme: theme.dark().buttonBarTheme,
        chipTheme: theme.dark().chipTheme,
        dataTableTheme: theme.dark().dataTableTheme,
        datePickerTheme: theme.dark().datePickerTheme,
        hintColor: theme.dark().hintColor,
        primaryColorDark: theme.dark().primaryColorDark,
        primaryColorLight: theme.dark().primaryColorLight,
        primaryIconTheme: theme.dark().primaryIconTheme,
        progressIndicatorTheme: theme.dark().progressIndicatorTheme,
        secondaryHeaderColor: theme.dark().secondaryHeaderColor,
        searchBarTheme: theme.dark().searchBarTheme,
        searchViewTheme: theme.dark().searchViewTheme,
        sliderTheme: theme.dark().sliderTheme,
        switchTheme: theme.dark().switchTheme,
        segmentedButtonTheme: theme.dark().segmentedButtonTheme,
        splashFactory: theme.dark().splashFactory,
        tabBarTheme: theme.dark().tabBarTheme,
        textButtonTheme: theme.dark().textButtonTheme,
        textSelectionTheme: theme.dark().textSelectionTheme,
        timePickerTheme: theme.dark().timePickerTheme,
        toggleButtonsTheme: theme.dark().toggleButtonsTheme,
        tooltipTheme: theme.dark().tooltipTheme,
        typography: theme.dark().typography,
        visualDensity: theme.dark().visualDensity,
        bottomNavigationBarTheme: theme.dark().bottomNavigationBarTheme,
        buttonTheme: theme.dark().buttonTheme,
        cardTheme: theme.dark().cardTheme,
        iconTheme: theme.dark().iconTheme,
        applyElevationOverlayColor: true,
        actionIconTheme: theme.dark().actionIconTheme,
        iconButtonTheme: theme.dark().iconButtonTheme,
        indicatorColor: theme.dark().indicatorColor,
        appBarTheme: theme.dark().appBarTheme,
        inputDecorationTheme: theme.dark().inputDecorationTheme,
        fontFamily: 'Poppins',
        filledButtonTheme: theme.dark().filledButtonTheme,
        fontFamilyFallback: <String>['Poppins'],
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      //
      // // theme: theme.dark(),
      // darkTheme: theme.dark(),
      shortcuts: const <LogicalKeySet, Intent>{},
      actions: <Type, Action<Intent>>{},
    );
  }
}
