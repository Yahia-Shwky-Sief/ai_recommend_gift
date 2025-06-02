import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/custom_checkbox_page.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/custom_radio_page.dart';
import 'package:ai_recommend_gift/feature/theme/presention/theme_toggle.dart';
import 'package:flutter/material.dart';

class GiftForm extends StatelessWidget {
  GiftForm({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    String? gender;
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
          CustomRadioPage(
            options: ['1', '2'],
            onOptionSelected: (string) => gender = string,
          ), //gender page
          CustomRadioPage(
            options: ['1', '2'],
            onOptionSelected: (string) {},
          ), //age page
          CustomRadioPage(
            options: ['1', '2'],
            onOptionSelected: (string) {},
          ), //relationship page
          CustomRadioPage(
            options: ['1', '2'],
            onOptionSelected: (string) {},
          ), //budget page
          CustomRadioPage(
            options: ['1', '2'],
            onOptionSelected: (string) {},
          ), //occasion page
          CustomCheckboxPage(options: ['1', '2']), //interests/hobbies page
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  if (gender == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select')),
                    );
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
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
