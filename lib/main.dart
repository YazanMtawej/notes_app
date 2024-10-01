import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  
  runApp( DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>const NotesApp() , // Wrap your app
  ),);
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}