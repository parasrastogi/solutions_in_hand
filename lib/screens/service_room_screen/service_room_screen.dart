import 'package:flutter/material.dart';

class ServiceRoomScreen extends StatefulWidget {
  const ServiceRoomScreen({Key? key}) : super(key: key);

  @override
  State<ServiceRoomScreen> createState() => _ServiceRoomScreenState();
}

class _ServiceRoomScreenState extends State<ServiceRoomScreen> {
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
              ElevatedButton(onPressed: () {}, child: const Text('Service Room')),
              ElevatedButton(onPressed: () {}, child: const Text('Staff')),
            ],),
        ),
      ),
    );
  }
}
