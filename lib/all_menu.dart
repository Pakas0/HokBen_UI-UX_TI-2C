import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'order_status.dart';
import 'qr.dart';

class AllMenuPage extends StatefulWidget {
  const AllMenuPage({super.key});

  @override
  State<AllMenuPage> createState() => _AllMenuPageState();
}

class _AllMenuPageState extends State<AllMenuPage> {
  int selectedCategoryIndex = 0;
  
  // 1. TAMBAHAN: Variabel untuk menyimpan teks pencarian
  String _searchQuery = "";

  // --- DATA MENU (15 Item per Kategori) ---
  final List<Map<String, String>> menuBento = List.generate(
    15,
    (index) => {
      'name': 'HOKA HEMAT ${index + 1}',
      'price': 'Rp 28.000,00',
      'icon': 'rice_bowl'
    },
  );

  final List<Map<String, String>> menuDessert = List.generate(
    15,
    (index) => {
      'name': 'MANGO PUDING ${index + 1}',
      'price': 'Rp 19.000,00',
      'icon': 'icecream' 
    },
  );

  final List<Map<String, String>> menuDrink = List.generate(
    15,
    (index) => {
      'name': 'COLD OCHA ${index + 1}',
      'price': 'Rp 10.000,00',
      'icon': 'local_drink'
    },
  );

  @override
  Widget build(BuildContext context) {
    // A. Pilih List Menu Mentah berdasarkan Tab
    List<Map<String, String>> rawMenu;
    if (selectedCategoryIndex == 1) {
      rawMenu = menuDessert;
    } else if (selectedCategoryIndex == 2) {
      rawMenu = menuDrink;
    } else {
      rawMenu = menuBento;
    }

    // B. LOGIKA FILTER PENCARIAN
    // Ambil menu mentah, lalu saring (filter) berdasarkan text search
    List<Map<String, String>> filteredMenu = rawMenu.where((item) {
      // Ambil nama menu, ubah ke huruf kecil biar pencarian tidak sensitif huruf besar/kecil
      final menuName = item['name']!.toLowerCase();
      final query = _searchQuery.toLowerCase();
      
      // Cek apakah nama menu mengandung kata kunci pencarian
      return menuName.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      // --- FAB ---
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 85.0),
        child: SizedBox(
          width: 55, height: 55,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderStatusPage()));
            },
            backgroundColor: const Color(0xFFED1C24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                "assets/icons/shopping-cart.svg",
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // --- Navbar ---
      bottomNavigationBar: _buildCustomNavBar(context),

      // --- BODY ---
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            color: const Color(0xFFED1C24),
            child: const Text(
              'All Menu',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Search & Kategori
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                // 2. TextField Search Dinamis
                TextField(
                  // Fungsi ini dipanggil setiap kali kita mengetik 1 huruf
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value; // Update variabel pencarian
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Menu',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(Icons.search, color: Colors.red),
                    filled: true,
                    fillColor: const Color(0xFFE0E0E0),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 15),
                
                // Tabs Kategori
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryTab('Hoka Bento', index: 0),
                      const VerticalDivider(color: Colors.black, thickness: 1, indent: 5, endIndent: 5),
                      _buildCategoryTab('Dessert', index: 1),
                      const VerticalDivider(color: Colors.black, thickness: 1, indent: 5, endIndent: 5),
                      _buildCategoryTab('Drink', index: 2),
                    ],
                  ),
                ),
                const Divider(thickness: 1, height: 1),
              ],
            ),
          ),

          // 3. Menampilkan List Menu Hasil Filter
          Expanded(
            child: filteredMenu.isEmpty
                // Tampilan kalau hasil pencarian tidak ketemu
                ? const Center(child: Text("Menu tidak ditemukan", style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: filteredMenu.length, // Pakai list yang sudah difilter
                    itemBuilder: (context, index) {
                      final item = filteredMenu[index];
                      return _buildMenuItem(
                        item['name']!, 
                        item['price']!, 
                        item['icon']!
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER (Sama seperti sebelumnya) ---

  Widget _buildCategoryTab(String title, {required int index}) {
    bool isActive = selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
          _searchQuery = ""; // Reset pencarian saat ganti kategori (Opsional)
          // Hapus baris di atas kalau mau teks pencariannya tetap ada saat pindah tab
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
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
            if (isActive) Container(height: 3, width: 60, color: const Color(0xFFED1C24))
            else const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String name, String price, String iconType) {
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
                width: 85, height: 85,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.image, color: Colors.grey, size: 30),
              ),
              Positioned(
                bottom: 0, left: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomLeft: Radius.circular(12)),
                  ),
                  child: Icon(
                    iconType == 'icecream' ? Icons.icecream : 
                    iconType == 'local_drink' ? Icons.local_drink : Icons.rice_bowl, 
                    size: 14, color: Colors.grey
                  ),
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
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(price, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCustomNavBar(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 70, decoration: const BoxDecoration(color: Color(0xFF7CB342))),
          Positioned(
            bottom: 0, left: 0, right: 0, height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  icon: SvgPicture.asset("assets/icons/home.svg", colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), width: 32, height: 32),
                ),
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: Container(
                    width: 75, height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7CB342),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset("assets/icons/bento-box.svg", color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QrPage())),
                  icon: SvgPicture.asset("assets/icons/scan-qr.svg", color: Colors.white, width: 32, height: 32),
                ),
                IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/favourites.svg", color: Colors.white, width: 32, height: 32)),
                IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/user.svg", color: Colors.white, width: 32, height: 32)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}