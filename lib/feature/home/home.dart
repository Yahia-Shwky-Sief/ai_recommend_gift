import 'package:ai_recommend_gift/feature/gift_form/gift_form.dart';
import 'package:ai_recommend_gift/feature/theme/presention/theme_toggle.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Recommend Gift'),
        actions: [ThemeToggle()],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/download.png', width: 400, height: 400),
            const Text(
              'Let AI Help You Choose the Perfect Gift',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GiftForm()));
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
