import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Color brandRed = const Color(0xFFED1C24);
  final Color brandYellow = const Color(
    0xFFFFC107,
  ); // Approximation for the yellow
  final Color brandGreen = const Color(0xFF7CB342);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Navigate to HomePage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Pattern
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              color: brandRed,
              child: CustomPaint(painter: PatternPainter()),
            ),
          ),

          // Bottom Pattern
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              color: brandRed,
              child: CustomPaint(painter: PatternPainter()),
            ),
          ),

          // Main Content centered
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: brandYellow,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          'assets/icons/hokben-seeklogo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Email Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Input your email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "example@email.com",
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Password Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Input your password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // OR Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.black, thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "or",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.black, thickness: 1),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Social Login Placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        Icons.g_mobiledata,
                        Colors.red,
                      ), // Google placeholder
                      const SizedBox(width: 15),
                      _buildSocialButton(
                        Icons.facebook,
                        Colors.blue,
                      ), // Facebook placeholder
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}

// Simple Painter to simulate the background pattern
class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    // Just drawing some random abstract lines to simulate pattern
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height,
    );
    path.moveTo(size.width * 0.5, 0);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.5, size.width, 0);

    // Circles
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.5),
      10,
      paint..style = PaintingStyle.fill,
    );
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.5), 20, paint);

    // Abstract L shape
    canvas.drawLine(
      Offset(size.width * 0.3, 10),
      Offset(size.width * 0.3, 50),
      paint..style = PaintingStyle.stroke,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 50),
      Offset(size.width * 0.35, 50),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
