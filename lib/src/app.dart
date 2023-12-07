import 'package:flutter/material.dart';
import 'modules/trending_videos/views/trending_video_screen.dart';

class MahfilApp extends StatelessWidget {
  const MahfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahfil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TrendingVideosScreen(),
    );
  }
}
