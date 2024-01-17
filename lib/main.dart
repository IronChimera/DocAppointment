// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:s_medi/firebase_options.dart';
import 'package:s_medi/general/consts/consts.dart';
import 'app/auth/view/login_page.dart';
import 'app/home/view/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor\'s Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 237, 193, 244), Color.fromARGB(255, 181, 229, 227)], // Replace with your gradient colors
            ),
          ),
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'We are always ready for \n your health care',
              style: TextStyle(
                fontSize: 32,
                color:Color.fromARGB(255, 93, 46, 202),
                fontWeight:FontWeight.w900,
                letterSpacing:0.2,
                ),
              textAlign: TextAlign.center,
            ),
            const Text(
              '\nContacting a doctor now is ',
              style: TextStyle(
                fontSize:16,
                color:Color.fromARGB(255, 124, 91, 199),
                fontWeight:FontWeight.w900,
                letterSpacing:0.2,
                ),
              textAlign: TextAlign.center,
            ),
             const Text(
              'easy and quick ? ',
              style: TextStyle(
                fontSize:18,
                color:Color.fromARGB(255, 184, 80, 153),
                fontWeight:FontWeight.w900,
                letterSpacing:0.2,
                ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:20),
          Container(
                width: 200, // Adjust the width as needed
                height: 300, // Adjust the height as needed
                child: Image.asset(
                  'assets/images/report.png', // Replace with the actual file path
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
          SizedBox(height:20),
           ElevatedButton(
             onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App()),
                );
              },
           style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 195, 164, 208), 
            padding:EdgeInsets.symmetric(horizontal:20,vertical:17),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
            
              ),
            child: const Text(
            'Get Started',
           style: TextStyle(
            fontSize: 21,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w900,
             ),
              ),

            ),
          ],
        ),
      ),
      ),
    );
  }
}

class UserTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => App()),
    );
  },
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 162, 150, 226),
          Color.fromARGB(255, 153, 207, 205),
        ],
      ),
    ),
    child: Center(
      child: Text(
        "I'm a Patient",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    ),
  ),
),
 
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App()),
                );
              },
              child: Text('I am a Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}




class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _MyAppState();
}


class _MyAppState extends State<App> {
  var isLogin = false;
  var auth = FirebaseAuth.instance;
  chekIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    chekIfLogin();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smadical',
      theme: ThemeData(
        primaryColor: AppColors.primeryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4B2EAD)),
        useMaterial3: true,
      ),
      home: isLogin ? const Home() : const LoginView(),
    );
  }
}
