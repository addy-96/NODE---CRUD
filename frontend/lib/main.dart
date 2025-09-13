import 'package:flutter/material.dart';
import 'package:flutter_node/service.dart';

enum ActionType {get,delete}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper());
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int index = 0;

  void _decreament() {
    if (index == 0) {
      return;
    }
    setState(() {
      index -= 1;
    });
  }

  void _increament() {
    if (index == 3) {
      return;
    }
    setState(() {
      index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(child: MainBody(index: index)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decreament,
                  icon: Icon(Icons.arrow_left, color: Colors.white),
                ),
                IconButton(
                  onPressed: _increament,
                  icon: Icon(Icons.arrow_right, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({super.key, required this.index});

  final int index;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> with SingleTickerProviderStateMixin {
  late Animation<Offset> cardAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    final initialUpAni = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutBack));

    final sideAni = Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

    cardAnimation = widget.index == 0 ? initialUpAni : sideAni;

    animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.index != widget.index) {
      // Update animation based on new index
      cardAnimation = widget.index == 0
          ? Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutBack))
          : Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

      animationController.reset();
      animationController.forward();
    }
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
        maxLength: 20,
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
    switch (widget.index) {
      case 0:
        return _creatOrUpdateuser('Create User');
      case 1:
        return _getOrDelete(ActionType.get,'Get User');
      case 2:
        return _creatOrUpdateuser('Update User');
      case 3:
        return _getOrDelete(ActionType.delete,'Delete User');
      default:
        return _creatOrUpdateuser('none');
    }
  }

  Widget _creatOrUpdateuser(String sectionTitle) {
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
               Text(
                sectionTitle,
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
                  child: Text(sectionTitle, style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getOrDelete(ActionType action, String sectionTitle) {
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
               Text(
                sectionTitle,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              _buildTextField("Name", false, TextInputType.text),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AppServices.getHome();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child:  Text(sectionTitle, style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
