import 'package:famto_admin_app/firebase_options.dart';
import 'package:famto_admin_app/views/delivery_person_registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'  hide DatePickerTheme;
import 'package:get/get.dart';

import 'controller/registration_controller.dart';
import 'views/admin_dashboard_home.dart';
import 'views/create_task_screen.dart';
import 'views/delivery_person_dashboard.dart';
import 'views/home_screen.dart';
import 'views/login_screen.dart';
import 'views/login_with_phone_number.dart';
import 'views/map_view_agent_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    title: 'Famto Admin App',
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // _registrationController.getDeliveryPersonRegistrationDetailsAll();
    // TODO: implement initState
    super.initState();
  }

  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginWithPhone()),
              );
            },
            child: Text('Welcome Admin')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDashBoardHome(),

              // DeliveryAgentDashboard(
              //   itemFreePersonList: _registrationController.freeDeliveryPerson,
              //   itemBusy: _registrationController.busyDeliveryPerson,
              // ),
            ),
          );
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
