import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🤍', '❄️', '🤍', '❄️'];
  final images = [
  "https://images.unsplash.com/photo-1698949171619-a55804ef6ac1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TG9uZy10YWlsZWQlMjBUaXR8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1746440256483-264b37b4bb2a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8TG9uZy10YWlsZWQlMjBUaXR8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1640374577565-4cd9da10bb80?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8TG9uZy10YWlsZWQlMjBUaXR8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1640374577083-5682b1c9dc40?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fExvbmctdGFpbGVkJTIwVGl0fGVufDB8fDB8fHww",

  ];

  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
      n = Random().nextInt(images.length);
      loading = false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFEAF7FF),
    appBar: AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: const Text('❄️シマエナガ❄️'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🎰', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),   
  );
}
