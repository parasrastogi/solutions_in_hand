import 'package:flutter/material.dart';
import 'package:solutions_in_hand/screens/service_landing_screen/service_landing_screen.dart';

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({Key? key}) : super(key: key);

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ex2 Solutions'),),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ElevatedButton(onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const ServiceLandingScreen()));
          }, child: const Text('Service Room')),
          ElevatedButton(onPressed: () {}, child: const Text('Staff')),
        ],),
      ),
    ),
    );
  }
}
