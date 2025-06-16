import 'package:ai_recommend_gift/core/widgets/logo.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/custom_checkbox_page.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/custom_radio_page.dart';
import 'package:ai_recommend_gift/feature/results/presention/results.dart';
import 'package:ai_recommend_gift/feature/theme/presention/theme_toggle.dart';
import 'package:flutter/material.dart';

class GiftForm extends StatelessWidget {
  GiftForm({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // Variables to hold the selected options
    // These will be used to pass data to the Results page
    String? gender;
    String? age;
    String? relationship;
    String? budget;
    String? occasion;
    List<String>? interests;

    return Scaffold(
      appBar: AppBar(
        title: logo(context),
        actions: [ThemeToggle()],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          CustomRadioPage(
            title: 'Gender',
            options: [
              ['assets/images/male.png', 'male'],
              ['assets/images/female.png', 'female'],
            ],
            onOptionSelected: (string) => gender = string,
          ), //gender page
          CustomRadioPage(
            title: 'Age Group',
            options: [
              ['assets/images/child.png', 'child'],
              ['assets/images/teenagers.png', 'teenager'],
              ['assets/images/adults.png', 'adult'],
              ['assets/images/senior-citzen.png', 'senior'],
            ],
            onOptionSelected: (string) => age = string,
          ), //age page
          CustomRadioPage(
            title: 'Relationship',
            options: [
              ['assets/images/friends.png', 'friend'],
              ['assets/images/familt.png', 'family'],
              ['assets/images/colugaess.png', 'colleague'],
              ['assets/images/lovers.png', 'partner'],
            ],
            onOptionSelected: (string) => relationship = string,
          ), //relationship page
          CustomRadioPage(
            title: 'Budget',
            options: [
              ['assets/images/low-price.png', '>500'],
              ['assets/images/high-price.png', '<500'],
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
              ['assets/images/art.png', 'Art'],
              ['assets/images/sports.png', 'Sports'],
              ['assets/images/music.png', 'Music'],
              ['assets/images/tech.png', 'Tech'],
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
                  } else if (pageController.page == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Results(
                          gender: gender!,
                          age: age!,
                          relationship: relationship!,
                          budget: budget!,
                          occasion: occasion!,
                          interests: interests!,
                        ),
                      ),
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
