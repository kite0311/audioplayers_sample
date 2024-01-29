import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Button Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sound Button Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  final audioSourceUrl = 'assets/lib/audio/service-bell-ring-14610.mp3';

  void playSound() async {
    await player.setSource(AssetSource(audioSourceUrl));
  }

  void pauseSound() async{
    await player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => AudioPlayer().play(
                AssetSource('lib/audio/service-bell-ring-14610.mp3'),
              ),
              child: Text('Play'),
            ),
            ElevatedButton(
                onPressed: () {
                  pauseSound();
                },
                child: Text('Pause')),
          ],
        ),
      ),
    );
    // Here we take the value from the MyHomePage object that was created by
  }
}
