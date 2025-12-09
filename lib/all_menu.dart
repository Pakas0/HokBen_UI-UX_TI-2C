import 'package:flutter/material.dart';

class AllMenuPage extends StatelessWidget {
  const AllMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // --- FAB (Tas Belanja Merah) ---
      // Posisinya tetap di kanan atas navbar
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0), // Naikkan sedikit biar gak numpuk navbar
        child: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFFED1C24),
            shape: const CircleBorder(),
            elevation: 4,
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // --- Custom Navbar yang Timbul ---
      bottomNavigationBar: _buildCustomNavBar(context),

      // --- BODY ---
      body: Column(
        children: [
          // 1. HEADER MERAH
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            color: const Color(0xFFED1C24),
            child: const Text(
              'All Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 2. SEARCH & KATEGORI
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Menu',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(Icons.search, color: Colors.red),
                    filled: true,
                    fillColor: const Color(0xFFE0E0E0),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryTab('Hoka Bento', isActive: true),
                      const VerticalDivider(color: Colors.black, thickness: 1, indent: 5, endIndent: 5),
                      _buildCategoryTab('Dessert', isActive: false),
                      const VerticalDivider(color: Colors.black, thickness: 1, indent: 5, endIndent: 5),
                      _buildCategoryTab('Drink', isActive: false),
                    ],
                  ),
                ),
                const Divider(thickness: 1, height: 1), 
              ],
            ),
          ),

          // 3. LIST MENU
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: 15,
              itemBuilder: (context, index) {
                return _buildMenuItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==================== WIDGET NAVBAR BARU ====================
  
  Widget _buildCustomNavBar(BuildContext context) {
    // Kita pakai SizedBox tinggi 100 agar ada ruang buat tombolnya 'nimbul' ke atas
    return SizedBox(
      height: 100, 
      child: Stack(
        clipBehavior: Clip.none, // Izinkan widget keluar dari batas
        alignment: Alignment.bottomCenter,
        children: [
          // A. Latar Belakang Hijau (Tinggi 70)
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFF7CB342), // Hijau Navbar
            ),
          ),

          // B. Barisan Icon
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 70, // Samakan dengan tinggi container hijau
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Home
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.home_outlined, color: Colors.white, size: 32)
                ),

                // 2. MENU (TOMBOL TIMBUL)
                // Kita pakai Transform untuk menggeser dia ke atas secara paksa
                Transform.translate(
                  offset: const Offset(0, -25), // Geser ke atas 25 pixel
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7CB342), // Warna Hijau sama dengan navbar
                      shape: BoxShape.circle, // Bentuk bulat
                      border: Border.all(
                        color: Colors.white, // Pinggiran Putih Tebal
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]
                    ),
                    child: const Icon(Icons.grid_view, color: Colors.white, size: 30),
                  ),
                ),

                // 3. QR Code
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 32)
                ),

                // 4. Favorite
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.favorite_border, color: Colors.white, size: 32)
                ),

                // 5. Profile
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.person_outline, color: Colors.white, size: 32)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== WIDGET LAINNYA ====================

  Widget _buildCategoryTab(String title, {required bool isActive}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFFED1C24) : Colors.black,
            ),
          ),
        ),
        if (isActive)
          Container(height: 3, width: 60, color: const Color(0xFFED1C24))
        else
          const SizedBox(height: 3),
      ],
    );
  }

  Widget _buildMenuItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage('https://placehold.co/150x150/png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0, left: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomLeft: Radius.circular(12)),
                  ),
                  child: const Icon(Icons.rice_bowl, size: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                const Text(
                  'HOKA HEMAT 1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp 28.000,00',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const Icon(Icons.favorite, color: Color(0xFFED1C24)), 
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF7CB342), 
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '+ Add',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}