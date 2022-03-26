import 'package:flutter/material.dart';
import 'package:portofolio_flutter/game_gallery/di_container.dart';
import 'package:portofolio_flutter/game_gallery/presentation/game_gallery.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: const GameGallery(),
    );
  }
}

