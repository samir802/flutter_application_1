import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Field extends StatefulWidget {
  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  late SharedPreferences prefs;

  late String name = '';
  late String phone = '';
  late String email = '';
  // late String password = '';

  TextEditingController nameConttroller = TextEditingController();
  TextEditingController phoneConttroller = TextEditingController();
  TextEditingController emailConttroller = TextEditingController();
  TextEditingController passwordConttroller = TextEditingController();

  void clearText() {
    nameConttroller.clear();
    phoneConttroller.clear();
    emailConttroller.clear();
    passwordConttroller.clear();
  }

  @override
  void initState() {
    intializePref();
    super.initState();
  }

  void intializePref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("ram") ?? '';
      phone = prefs.getString('phone') ?? '';
      email = prefs.getString("email") ?? '';
      // password = prefs.getString("password") ?? '';
    });
  }

  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Form(
                  key: keys,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: TextFormField(
                          controller: nameConttroller,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.man),
                            // suffixIcon: const Icon(Icons.man),
                            label: const Text("Full Name"),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: ('Enter your full name..'),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(top: 10, left: 30, right: 30),
                        child: TextFormField(
                          controller: phoneConttroller,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            label: const Text("Phone Number"),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: ('Enter your phone number..'),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: TextFormField(
                          controller: emailConttroller,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            label: const Text("Email Address"),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: ('Enter your email address'),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: TextFormField(
                          controller: passwordConttroller,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            label: const Text("Password"),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: ('Enter your password..'),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: const Text(
                          'Your Details:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Full Name: $name"),
                            Text("Phone Number: $phone"),
                            Text("Email Address: $email"),
                            // Text("Password: $password"),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 46, 83),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    if (keys.currentState!.validate()) {
                      setState(() {
                        name = nameConttroller.text;
                        phone = phoneConttroller.text;
                        email = emailConttroller.text;
                        // password = passwordConttroller.text;
                      });
                      clearText();
                      prefs.setString("ram", name);
                      prefs.setString("phone", phone);
                      prefs.setString("email", email);
                      // prefs.setString("password", password);
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
