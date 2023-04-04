import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Models/user.dart';
import 'package:insta_clone/Provider/user_provider.dart';
import 'package:insta_clone/Screens/login_Screen.dart';
import 'package:insta_clone/Screens/sign_up_screen.dart';
import 'package:insta_clone/responsive/mobile_screen_layout.dart';
import 'package:insta_clone/responsive/responsive_screen_layout.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // initialise app based on platform- web or mobile
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyCZ-xrXqD5D19Snauto-Fx_nLD7PLrBXGM",
//           appId: "1:585119731880:web:eca6e4b3c42a755cee329d",
//           messagingSenderId: "585119731880",
//           projectId: "instagram-clone-4cea4",
//           storageBucket: 'instagram-clone-4cea4.appspot.com'),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: //   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
// theme: ThemeData.dark().copyWith(
//   scaffoldBackgroundColor: mobileBackgroundColor,
// ),
//       debugShowCheckedModeBanner: false,
//       // home: const ResponsiveLayout(
//       //     webScreenLayout: WebScreenLayout(),
//       //     mobileScreenLayout: MobileScreenLayout()),
//       home: SignUpScreen(),
//     );
//       debugShowCheckedModeBanner: false,
//       // home: const ResponsiveLayout(
//       //     webScreenLayout: WebScreenLayout(),
//       //     mobileScreenLayout: MobileScreenLayout()),
//       home: SignUpScreen(),
//     );
//   }
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: mobileBackgroundColor,
//       ),
//       home: const MobileScreenLayout(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: mobileBackgroundColor,
//       ),
//       home: FutureBuilder(
//         future: Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform,
//         ),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               return const ResponsiveLayout(
//                 webScreenLayout: WebScreenLayout(),
//                 mobileScreenLayout: MobileScreenLayout(),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             }
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(color: primaryColor),
//             );
//           }
//           return const LoginScreen();
//         },
//       ),
//     );
//   }
// }

// class MyApps extends StatelessWidget {
//   const MyApps({super.key});

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserProvider()),
//       ],
//       child: FutureBuilder(
//         future: Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform,
//         ),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               return const ResponsiveLayout(
//                   webScreenLayout: WebScreenLayout(),
//                   mobileScreenLayout: MobileScreenLayout());
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             }
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(color: primaryColor),
//             );
//           }
//           return LoginScreen();
//         },
//       ),
//     );
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => UserProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Instagram Clone',
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: mobileBackgroundColor,
//         ),
//         home: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.active) {
//               // Checking if the snapshot has any data or not
//               FirebaseAuth.instance.signOut();
//               if (snapshot.hasData) {
//                 //if (user != null) {
//                 // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
//                 return const ResponsiveLayout(
//                   mobileScreenLayout: MobileScreenLayout(),
//                   webScreenLayout: WebScreenLayout(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('hhhhhhhhhhhh${snapshot.error}'),
//                 );
//               }
//             }

//             // means connection to future hasnt been made yet
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             return const LoginScreen();
//           },
//         ),
//       ),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCZ-xrXqD5D19Snauto-Fx_nLD7PLrBXGM",
          appId: "1:585119731880:web:eca6e4b3c42a755cee329d",
          messagingSenderId: "585119731880",
          projectId: "instagram-clone-4cea4",
          storageBucket: 'instagram-clone-4cea4.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //FirebaseAuth.instance.signOut();
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
