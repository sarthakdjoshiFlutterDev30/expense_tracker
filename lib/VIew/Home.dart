import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedCategory;
  String? selectedSubCategory;

  final List<String> categories = [
    'Housing',
    'Transportation',
    'Food & Dining',
    'Health & Fitness',
    'Entertainment',
  ];

  final Map<String, List<String>> subCategories = {
    'Housing': ['Rent', 'Mortgage', 'Utilities'],
    'Transportation': ['Fuel', 'Public Transport', 'Car Maintenance'],
    'Food & Dining': ['Groceries', 'Dining Out', 'Takeout'],
    'Health & Fitness': ['Gym', 'Medical', 'Supplements'],
    'Entertainment': ['Movies', 'Concerts', 'Subscriptions'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
                  hint: Text('Select Category'),
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                      selectedSubCategory = null;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  hint: Text('Select Sub-Category'),
                  value: selectedSubCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSubCategory = newValue;
                    });
                  },
                  items:
                      selectedCategory != null
                          ? subCategories[selectedCategory]!
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                              .toList()
                          : [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
