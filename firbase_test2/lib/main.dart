// import 'package:firebase_core/firebase_core.dart';




import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:firbase_test2/veiws/splach_screan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'screan/login.dart';
import 'firebase_options.dart';
//import 'veiws/auth/screan/login.dart';
//
// import 'package:firebase_core/firebase_core.dart';

// //
// import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(
      create: (context) =>AuthProvider()
      ),
      ChangeNotifierProvider<FirestoreProvider>(
      create: (context) =>FirestoreProvider()
      ),
  ],child:MyApp()));} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        navigatorKey: AppRouter.navKey,
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        home:Builder(
          builder: (context) {
            return SplachScrean();
          }
        ),// LoginScreen MyStatefulWidget
      
    );
  }
}