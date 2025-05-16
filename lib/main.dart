import 'package:flutter/material.dart';
import 'package:movie2/custom_nav_bar.dart';
// import 'package:movie2/firebase/auth_service.dart';
import 'package:movie2/route.dart';
// import 'package:flutter/services.dart';
import 'package:movie2/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
 // Khởi tạo Flutter bindings
 WidgetsFlutterBinding.ensureInitialized();


 // Khởi tạo Firebase
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );


 // Chạy ứng dụng
 runApp(
   ChangeNotifierProvider(
     create: (_) => ThemeProvider(),
     child: const MyApp(),
   ),
 );
 // runApp(MyApp());
}


class MyApp extends StatefulWidget {
 const MyApp({super.key});


 @override
 State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
 // @override
 // void initState(){
 //   //Ẩn thanh trạng thái và nút bên dưới
 //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);


 //   super.initState();
 // }


 @override
 Widget build(BuildContext context) {
   // final themeProvider = Provider.of<ThemeProvider>(context);
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       // Define the default brightness and colors.
       colorScheme: ColorScheme.fromSeed(
         seedColor: Colors.red,
       ),
     ),
     routes: routes,
     home: CustomNavBar(),
   );
 }
}


class ThemeProvider extends ChangeNotifier {
 bool _isDarkMode = false;


 bool get isDarkMode => _isDarkMode;


 void toggleDarkMode() {
   _isDarkMode = !_isDarkMode;
   notifyListeners();
 }
}
