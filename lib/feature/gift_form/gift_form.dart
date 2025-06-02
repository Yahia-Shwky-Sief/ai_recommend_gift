import 'package:ai_recommend_gift/feature/theme/presention/theme_toggle.dart';
import 'package:flutter/material.dart';

class GiftForm extends StatelessWidget {
  GiftForm({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('AI Recommend Gift'),
        actions: [ThemeToggle()],
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          // First Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('What is the occasion?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Birthday', child: Text('Birthday')),
                    DropdownMenuItem(value: 'Anniversary', child: Text('Anniversary')),
                    DropdownMenuItem(value: 'Graduation', child: Text('Graduation')),
                    DropdownMenuItem(value: 'Holiday', child: Text('Holiday')),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Occasion',
                  ),
                ),
              ],
            ),
          ),
          // Second Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Who is the gift for?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Recipient Name',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (pageController.page! > 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Back'),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
