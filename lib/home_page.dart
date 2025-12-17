import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'all_menu.dart';
import 'order_status.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Brand colors
  final Color brandRed = const Color(0xFFED1C24);
  final Color brandGreen = const Color(0xFF7CB342);
  final Color chipColor = const Color(0xFFFFE0B2);

  // Dropdown data
  String? _selectedLocation;
  final List<String> _locations = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Semarang',
    'Yogyakarta',
    'Bali',
    'Medan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom Information Header
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  color: brandRed,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Halo, Bagas!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Logo
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/hokben-seeklogo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Location Dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedLocation,
                            hint: const Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            isExpanded: true,
                            icon: _buildSvgIcon(
                              'assets/icons/drop-down.svg',
                              color: Colors.black,
                              size: 24,
                            ),
                            items: _locations.map((String location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(
                                  location,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLocation = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Body Content
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Chips Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildChip("Points", chipColor),
                          _buildChip("My Order", chipColor),
                          _buildChip("Vouchers", chipColor),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Banner Placeholder
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text("Banner Placeholder"),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Slider Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.chevron_left),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: index == 2
                                      ? brandRed
                                      : brandRed.withAlpha(100),
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Services Grid
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildServiceItem(
                            "Delivery",
                            "assets/icons/scooter-delivery.svg",
                            brandRed,
                            55,
                          ),
                          _buildServiceItem(
                            "Dine In",
                            "assets/icons/dine-in.svg",
                            brandRed,
                            55,
                          ),
                          _buildServiceItem(
                            "Take Away",
                            "assets/icons/shopping-bag.svg",
                            brandRed,
                            55,
                          ),
                          _buildServiceItem(
                            "Drive Thru",
                            "assets/icons/drive-thru.svg",
                            brandRed,
                            55,
                          ),
                          _buildServiceItem(
                            "Large Order",
                            "assets/icons/truck-delivery.svg",
                            brandRed,
                            55,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      // News & Promo
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "News",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text("News Image"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Promo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text("Promo Image"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 100), // Space for bottom nav
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 100, // Total height for stack
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Green Bar
                  Container(
                    height: 70,
                    decoration: BoxDecoration(color: brandGreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 60), // Space for Big Home Button
                        _buildNavIcon(
                          "assets/icons/bento-box.svg",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllMenuPage(),
                              ),
                            );
                          },
                        ),
                        _buildNavIcon("assets/icons/scan-qr.svg"),
                        _buildNavIcon("assets/icons/favourites.svg"),
                        _buildNavIcon("assets/icons/user.svg"),
                      ],
                    ),
                  ),
                  // Big Home Button
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.all(4), // White border effect
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: brandGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: brandGreen, width: 2),
                        ),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          splashColor: Colors.black12,
                          hoverColor: Colors.black26, // Darker hover
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: _buildSvgIcon(
                              "assets/icons/home.svg",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Red Basket Button (Floating above nav)
          Positioned(
            bottom: 85, // Adjust to float above the green bar
            right: 20,
            child: Material(
              color: brandRed,
              borderRadius: BorderRadius.circular(8),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderStatusPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                hoverColor: Colors.black26, // Darker hover
                child: Container(
                  height: 55,
                  width: 55,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: _buildSvgIcon(
                    "assets/icons/shopping-cart.svg",
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        hoverColor: Colors.black26, // Darker on hover
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(
    String label,
    String assetPath,
    Color color,
    double size,
  ) {
    return Column(
      children: [
        Material(
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            hoverColor: Colors.black26, // Darker on hover
            child: SizedBox(
              height: size,
              width: size,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: _buildSvgIcon(assetPath, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 60,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildNavIcon(String assetPath, {VoidCallback? onPressed}) {
    return IconButton(
      icon: _buildSvgIcon(assetPath, color: Colors.white, size: 37),
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.black26; // Darker hover
          }
          if (states.contains(WidgetState.pressed)) {
            return Colors.black.withAlpha(100);
          }
          return null;
        }),
      ),
    );
  }

  Widget _buildSvgIcon(String assetPath, {Color? color, double? size}) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
