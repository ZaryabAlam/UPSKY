import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  @override
  State<ChangeThemeButtonWidget> createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // return Switch.adaptive(
    //   activeColor: Colors.blueGrey,
    //   value: themeProvider.isDarkMode,
    //   onChanged: (value) {
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },
    // );
    //////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    // return Container(
    //   padding: EdgeInsets.all(4.0),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20.0),
    //     color: themeProvider.isDarkMode ? Colors.blueGrey : Colors.blue,
    //   ),
    //   child: CupertinoSwitch(
    //     activeColor: Colors.blueGrey,
    //     value: themeProvider.isDarkMode,
    //     onChanged: (value) {
    //       final provider = Provider.of<ThemeProvider>(context, listen: false);
    //       provider.toggleTheme(value);
    //     },
    //   ),
    // );

    return Column(
      children: [
        Container(
          width: 120,
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: themeProvider.isDarkMode ? Colors.blueGrey : Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sunny, // Sun icon
                color: Colors.yellow, // Customize sun icon color
              ),
              CupertinoSwitch(
                activeColor: Colors.black.withOpacity(0.09),
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  provider.toggleTheme(value);
                },
              ),
              Icon(
                Icons.nights_stay, // Moon icon
                color: Colors.white, // Customize moon icon color
              ),
            ],
          ),
        ),
      ],
    );
  }
}
