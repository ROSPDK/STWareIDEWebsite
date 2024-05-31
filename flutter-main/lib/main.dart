import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

 
class _MyAppState extends State<MyApp> { 
ThemeMode appThemeMode = ThemeMode.system;
 void changeAppTheme(ThemeMode themeMode) {
    setState(() {
      appThemeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STWare IDE',
      themeMode: appThemeMode,
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
       appBar: AppBar(
        title: Text("STWare IDE"),
        actions: <Widget>[
    PopupMenuButton<String>(
      icon: Icon(Icons.dark_mode_outlined),
      onSelected: (String value) {
        // Handle your action on selection here
      switch (value) {
      case 'System Theme':
        changeAppTheme(ThemeMode.system);
        break;
      case 'Light Theme':
        changeAppTheme(ThemeMode.light);
        break;
      case 'Dark Theme':
        changeAppTheme(ThemeMode.dark);
        break;
       }
      },
      itemBuilder: (BuildContext context) {
        return {'System Theme', 'Light Theme', 'Dark Theme'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    ),
  ],
      ),
      drawer: NavigationDrawer(children: [
          DrawerHeader(
          child: Container(
          child: SvgPicture.asset(
                    'assets/images/swpro.svg',
                     semanticsLabel: 'SW Pro Logo',
                  ),
            ),
       ),
          const SizedBox(height: 22),
          for (var i = 0; i < 4; i++)
            NavigationDrawerDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text('Home'),
            ),
        ]),
      body: Center(
      child: SingleChildScrollView(  
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         Container(
            height: 100,
            width: 100,
            child: SvgPicture.asset(
            'assets/images/sketchware.svg',
            height: 50,
            width: 50,
            semanticsLabel: 'Sketchware Logo',
          ),
        ),   
           Text(
              'STWare IDE',
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "No code, all awesome. Create epic apps with Sketchware Pro's magical blocks.",
              style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.normal,
              ),
             textAlign: TextAlign.center,
            ),
           Image.asset('assets/images/mockup.png'),
          ],
        ),
      ),
     ),
    ),
   );
  }
}
