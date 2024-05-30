import 'package:flutter/material.dart';
import 'package:quiz_1/question_2/models/categories_data.dart';
import 'package:quiz_1/question_2/models/languages_data.dart';
import 'package:quiz_1/question_2/models/venues_data.dart';
import 'package:quiz_1/widgets/default_button.dart';

class Question2Screen extends StatefulWidget {
  const Question2Screen({super.key});

  @override
  State<Question2Screen> createState() => _Question2ScreenState();
}

class _Question2ScreenState extends State<Question2Screen> {
  List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      label: 'Categories',
                      onPressed: () {
                        setState(() {
                          items = CategoriesData().categories;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefaultButton(
                      label: 'Venues',
                      onPressed: () {
                        setState(() {
                          items = VenuesData().venues;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefaultButton(
                      label: 'Languages',
                      onPressed: () async {
                        List<String> languages =
                            await LanguagesData().languages;
                        setState(() {
                          items = languages;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(items[index]),
                  itemCount: items.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
