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
    String? age;
    String? relationship;
    String? budget;
    String? occasion;
    List? interests;
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
            title: 'Gender',
            options: [
              ['assets/images/male_9416212.png', 'male'],
              ['assets/images/mother_15762415.png', 'female'],
            ],
            onOptionSelected: (string) => gender = string,
          ), //gender page
          CustomRadioPage(
            title: 'Age',
            options: [
              ['assets/images/rocking-horse_5822325.png', 'child'],
              ['assets/images/family_2640920.png', 'adult'],
            ],
            onOptionSelected: (string) => age = string,
          ), //age page
          CustomRadioPage(
            title: 'Relationship',
            options: [
              ['assets/images/meet_7851717.png', 'Close'],
              ['assets/images/employee_2245072.png', 'Acquaintance'],
            ],
            onOptionSelected: (string) => relationship = string,
          ), //relationship page
          CustomRadioPage(
            title: 'Budget',
            options: [
              ['assets/images/low-price.png', '>500'],
              ['assets/images/price-tag_17002238.png', '<500'],
            ],
            onOptionSelected: (string) => budget = string,
          ), //budget page
          CustomRadioPage(
            title: 'Occasion',
            options: [
              ['assets/images/birthday-cake.png', 'birthday'],
              ['assets/images/celebrating-eid.png', 'el-eid'],
            ],
            onOptionSelected: (string) => occasion = string,
          ), //occasion page
          CustomCheckboxPage(
            title: 'interests/hobbies',
            options: [
              ['assets/images/birthday-cake.png', 'birthday'],
              ['assets/images/celebrating-eid.png', 'el-eid'],
            ],
            onOptionSelected: (list) => interests = list,
          ), //interests/hobbies page
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
                  if (pageController.page == 0 && gender == null ||
                      pageController.page == 1 && age == null ||
                      pageController.page == 2 && relationship == null ||
                      pageController.page == 3 && budget == null ||
                      pageController.page == 4 && occasion == null ||
                      pageController.page == 5 && interests == null) {
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
