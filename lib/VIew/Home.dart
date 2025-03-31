import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedCategory;
  String? selectedSubCategory;
  var amount = TextEditingController();
  var seller = TextEditingController();
  String sellername = "";
  String Amount = "";
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String time = DateFormat('HH:mm:ss').format(DateTime.now());

  Future<void> adddata() async {
    final Map<String, dynamic> data = {
      "Category": selectedCategory.toString(),
      "SubCategory": selectedSubCategory.toString(),
      "Date": date,
      "Time": time,
    };
    print(data);
  }

  final List<String> categories = [
    'Housing',
    'Transportation',
    'Food & Dining',
    'Health & Fitness',
    'Entertainment',
    'Loan',
    'Billing',
  ];

  final Map<String, List<String>> subCategories = {
    'Housing': ['Rent', 'Mortgage', 'Utilities'],
    'Transportation': ['Fuel', 'Public Transport', 'Car Maintenance'],
    'Food & Dining': ['Groceries', 'Dining Out', 'Takeout'],
    'Health & Fitness': ['Gym', 'Medical', 'Supplements'],
    'Entertainment': ['Movies', 'Concerts', 'Subscriptions'],
    'Loan': [
      'Personal Loan',
      'Home Loan',
      'Student Loan',
      'Auto Loan',
      'Business Loan',
      'Medical Loan',
    ],
    'Billing': [
      'Electricity Bill',
      'Water Bill',
      'Internet Bill',
      'Phone Bill',
      'Insurance Bill',
      'Subscription Services Bill',
      'Property Tax Bill',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Manage Your Expenses",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.pie_chart),
                  title: Text("Show Expense Chart"),
                  onTap: () {
                    Navigator.pushNamed(context, '/expenseChart');
                  },
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text("Show Expense List"),
                  onTap: () {
                    Navigator.pushNamed(context, '/expenseList');
                  },
                ),
                SizedBox(height: 8),

                Divider(),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About"),
                  onTap: () {
                    showAboutDialog(context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat content.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Category Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      hint: Text('Select Category'),
                      dropdownColor: Colors.purple,
                      value: selectedCategory,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                          selectedSubCategory = null;
                        });
                      },
                      items:
                          categories.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Sub-Category Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      hint: Text('Select Sub-Category'),
                      dropdownColor: Colors.purple,
                      value: selectedSubCategory,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSubCategory = newValue;
                        });
                      },
                      items:
                          selectedCategory != null
                              ? subCategories[selectedCategory]!
                                  .map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  })
                                  .toList()
                              : [],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: seller,
                      onChanged: ((value) {
                        setState(() {
                          sellername = seller.text.toString();
                        });
                      }),

                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Seller Name",
                        hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Amount TextField
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: amount,
                      onChanged: ((value) {
                        setState(() {
                          Amount = amount.text.toString();
                        });
                      }),
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Amount",
                        hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Summary",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Date: $date",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Time: ${DateFormat('HH:mm:ss').format(DateTime.now())}",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${selectedCategory ?? "None"}",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sub-Category: ${selectedSubCategory ?? "None"}",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Seller-Name: $sellername",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Amount: $Amount",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add Expense',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
