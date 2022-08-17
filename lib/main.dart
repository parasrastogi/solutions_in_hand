import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:solutions_in_hand/core/ui/widgets/receiver_item_tile.dart';
import 'core/model/item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
enum TtsState { playing, stopped, paused, continued }
Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{
  late final AnimationController _controller;
  List<Item> itemList = [];
  FlutterTts flutterTts = FlutterTts();


  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;
  int? _inputLength;
  @override
  void initState(){
    super.initState();
    initTts();
    _controller = AnimationController(vsync: this);
   // getAllComplaints();
    registerEvent();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    body:
    ListView.builder(itemBuilder: (context , index){
      return ReceiverItemTile(
         itemList[index]
      );
    },
    itemCount: itemList.length,
    ));

  }

  void getAllComplaints() async{
    final querySnapshot = FirebaseFirestore.instance;
    final itemSnap = await querySnapshot.collection("items").withConverter(fromFirestore: Item.fromFirestore, toFirestore: (Item item, _) => item.toFirestore()).get();
    final itemList = itemSnap.docs;

     this.itemList =  itemList.map((item) => item.data()).toList();
     print(itemList);
  }

  initTts() {
    flutterTts = FlutterTts();

  //  _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS || isWindows) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  void registerEvent(){
    final querySnapshot = FirebaseFirestore.instance;
    querySnapshot
        .collection("items").withConverter(fromFirestore: Item.fromFirestore, toFirestore: (Item item, _) => item.toFirestore())
        .snapshots()
        .listen((event) {
          final list =  event.docs;
          itemList.clear();
          setState(() {
            itemList =  list .map((item) => item.data()).toList();

              _newVoiceText = "Attention Please";
              _speak();

          });

    });
  Future<dynamic> _getLanguages() => flutterTts.getLanguages;

  Future<dynamic> _getEngines() => flutterTts.getEngines;
    getFloorEvents();
  }

  void getFloorEvents(){
    final querySnapshot = FirebaseFirestore.instance;
     var docSnapShot =  querySnapshot.collection("Floors").doc("f_1");
      print("--> ${docSnapShot}");

  //  docSnapShot.collection("f1_entity_group").doc("entity_washroom").

    var entityWashRoomDoc = docSnapShot.collection("f1_entity_group").doc("entity_washroom");

    entityWashRoomDoc.get().then(
          (res) {
            print("Successfully completed");

            var map =  res.data();
             var issues = map!['issues'] as DocumentReference;

            issues.get().then((value) {
              print("issues get -->${value.data()}");
              print("issues ref -->${value.reference}");
            });


            querySnapshot.collection("${entityWashRoomDoc.path}/${issues.path}/washroom_options").get().then((value) {
              value.docs.map((e) {
                print("issues list --> ${e.data()}");
              });
            },  onError: (e) => print("Error completing: $e"),);
          },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }


  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

}
