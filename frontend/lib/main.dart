import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper());
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CreateUser(),
      floatingActionButton: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            FloatingActionButton(onPressed: () {
              
            },child: Icon(Icons.arrow_left),),
            FloatingActionButton(onPressed: () {
              
            },child: Icon(Icons.arrow_right),),
          ],
        ),
      ),
    );
  }
}

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> with SingleTickerProviderStateMixin {
  late Animation<Offset> cardAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    cardAnimation = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutBack));

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget _buildTextField(String label, bool obscure, TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: label,
          filled: true,

          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Center(
      child: SlideTransition(
        position: cardAnimation,
        child: Container(
          width: isWide ? 500 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black12, offset: Offset(0, 10))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              _buildTextField("Name", false, TextInputType.text),
              _buildTextField("Email", false, TextInputType.emailAddress),
              _buildTextField("Phone Number", true, TextInputType.number),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Create User", style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
