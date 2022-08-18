import 'package:flutter/material.dart';
import 'package:solutions_in_hand/main.dart';

class ServiceLandingScreen extends StatefulWidget {
  const ServiceLandingScreen({Key? key}) : super(key: key);

  @override
  State<ServiceLandingScreen> createState() => _ServiceLandingScreenState();
}

class _ServiceLandingScreenState extends State<ServiceLandingScreen> {

  var dropdownValue = 'Select Floor';
  var selectedCategoryValue = 'Select Category';
  String? selectedRoomCategory;
  String? selectedRoom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ex2 Solutions'),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Floor'),
                DropdownButton<String>(
                  value: dropdownValue,
                //  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Select Floor','Ground Floor', 'First Floor', 'Second Floor']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category'),
                DropdownButton<String>(
                  value: selectedCategoryValue,
                  //  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategoryValue = newValue!;
                      selectedRoomCategory = newValue;
                    });
                  },
                  items: <String>['Select Category', 'Washroom', 'Conference room', 'Floor area']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Visibility(
              visible: selectedRoomCategory != null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedRoomCategory ?? ''),
                  DropdownButton<String?>(
                    alignment: AlignmentDirectional.topStart,
                    value: selectedRoom,
                    //  icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRoom = newValue!;
                      });
                    },
                    items: <String>['Select $selectedRoomCategory', 'Boy\'s Washroom', 'Girl\'s Washroom']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            
            Visibility(child: ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => MyHomePage(title: selectedRoom ?? '')));
            }, child: const Text('Register'),))
          ],),
      ),
    );
  }
}
