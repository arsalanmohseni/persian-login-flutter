import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(const Loginpage());
}

const Color primaryColor = Colors.blue;
const Color secondryColor = Colors.white;
const Color textColor = Colors.black;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isChecked = false;
  // ignore: unused_field
  final TextEditingController _textEditingController = TextEditingController();
  final _valueKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Form(
            key: _valueKey,
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor,
                      secondryColor,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 150,
                        color: Colors.blue,
                      ),
                    ),
                    Image.asset(
                      'assets/images/feedback.png',
                      width: 350,
                      height: 350,
                    ),
                    inputField("نام کاربری", Icons.person_outline),
                    const SizedBox(height: 20),
                    inputField("شماره تماس", Icons.phone_outlined),
                    const SizedBox(height: 20),
                    inputField("ایمیل", Icons.person_outline),
                    const SizedBox(height: 20),
                    inputField("کلمه عبور", Icons.lock_outline),
                    CheckboxListTile(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue.shade400,
                      title: const Text(
                        "با شرایط و قوانین موافقم",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontFamily: "Vazirmatn"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_valueKey.currentState!.validate() &&
                            isChecked == true) {
                          // Add your code here
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => errorDialog(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        foregroundColor: secondryColor,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 30, 45),
                      ),
                      child: const Text(
                        'ورود',
                        style: TextStyle(fontSize: 20, fontFamily: 'Vazirmatn'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Directionality errorDialog() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text("خطا",
            style: TextStyle(
                fontFamily: "Vazirmatn", fontWeight: FontWeight.bold)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "تایید",
              style: TextStyle(
                color: secondryColor,
                fontFamily: "Vazirmatn",
              ),
            ),
          ),
        ],
        content: const Text(
          "لطفا تمام فیلد هارا پر کنید و گزینه با شرایط و قوانین موافقم را انتخاب کنید",
        ),
      ),
    );
  }

  Padding inputField(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (String? value) {
          // Update the type to String?
          if (value == null || value.isEmpty) {
            return 'پر کردن این فیلد الزامی است';
          }
          return null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: text,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: secondryColor,
          labelStyle: const TextStyle(
            color: textColor,
            fontFamily: 'Vazirmatn',
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
