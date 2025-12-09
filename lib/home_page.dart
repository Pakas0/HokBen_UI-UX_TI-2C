import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define brand colors
    const Color brandRed = Color(0xFFED1C24);
    const Color brandGreen = Color(0xFF7CB342); // Approximate green
    const Color chipColor = Color(0xFFFFE0B2); // Approximate beige

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
                          // Logo Placeholder (Yellow Circle)
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "HokBen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Location Dropdown Placeholder
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down),
                          ],
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
                            Icons.delivery_dining,
                            brandRed,
                          ),
                          _buildServiceItem(
                            "Dine In",
                            Icons.restaurant,
                            brandRed,
                          ),
                          _buildServiceItem(
                            "Take Away",
                            Icons.shopping_bag,
                            brandRed,
                          ),
                          _buildServiceItem(
                            "Drive Thru",
                            Icons.drive_eta,
                            brandRed,
                          ),
                          _buildServiceItem(
                            "Large Order",
                            Icons.local_shipping,
                            brandRed,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),

                      // News & Promo
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "News",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 150,
                                  color: Colors.grey[300],
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 150,
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Text("Promo Image"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                        IconButton(
                          icon: const Icon(
                            Icons.grid_view,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
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
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: brandGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: brandGreen, width: 2),
                        ),
                        child: const Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: 35,
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
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: brandRed,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildServiceItem(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
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
}
