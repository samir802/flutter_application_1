import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  late String name = '';
  late String email = '';

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    intializePref();
    super.initState();
  }

  void intializePref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('namePref') ?? '';
      email = prefs.getString('emailPref') ?? '';
    });
  }

  final keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Form(
            key: keys,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(),
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        hintText: ("Name"),
                        label: Text("Name")),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(),
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        hintText: ("Email"),
                        label: Text("Email")),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("The text you have saves $name"),
                  Text(name),
                  Text(email),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(double.infinity, 70),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                if (keys.currentState!.validate()) {
                  setState(() {
                    name = nameController.text;
                    email = emailController.text;
                  });
                  prefs.setString('namePref', name);
                  prefs.setString('emailPref', email);
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}