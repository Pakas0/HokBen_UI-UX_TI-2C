import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // <--- 1. Import library SVG
import 'all_menu.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  // Variabel state: true = MyQR, false = Scan QR
  bool isMyQrActive = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // --- FAB (Tas Belanja) ---
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFFED1C24),
            shape: const CircleBorder(),
            elevation: 4,
            // Menggunakan SVG untuk Tas Belanja
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                "assets/icons/shopping-cart.svg",
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // --- Navbar Khusus ---
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
              'QR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 2. TOGGLE BUTTON (MyQR / Scan QR)
          const SizedBox(height: 20),
          Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0xFF7CB342), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMyQrActive = true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMyQrActive ? const Color(0xFF7CB342) : Colors.transparent,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(29), bottomLeft: Radius.circular(29)),
                      ),
                      alignment: Alignment.center,
                      child: Text('MyQR', style: TextStyle(color: isMyQrActive ? Colors.white : const Color(0xFF7CB342), fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMyQrActive = false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: !isMyQrActive ? const Color(0xFF7CB342) : Colors.transparent,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(29), bottomRight: Radius.circular(29)),
                      ),
                      alignment: Alignment.center,
                      child: Text('Scan QR', style: TextStyle(color: !isMyQrActive ? Colors.white : const Color(0xFF7CB342), fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 3. ISI KONTEN
          Expanded(
            child: isMyQrActive ? _buildMyQrView() : _buildScanQrView(),
          ),
        ],
      ),
    );
  }

  // --- WIDGET 1: My QR ---
  Widget _buildMyQrView() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 250, height: 250,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(
            'https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=HokBenClone',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 250,
          alignment: Alignment.centerRight,
          // Menggunakan Icon standar download (karena biasanya tidak ada svg khusus download di aset kamu)
          // Kalau ada svg-nya, bisa diganti SvgPicture.asset
          child: const Icon(Icons.file_download_outlined, color: Color(0xFF7CB342), size: 28),
        ),
      ],
    );
  }

  // --- WIDGET 2: Scan QR ---
  Widget _buildScanQrView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: double.infinity, height: double.infinity, color: Colors.black),
        Container(
          width: 250, height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(width: 230, height: 2, color: Colors.red),
        const Positioned(
          bottom: 100,
          child: Text("Arahkan kamera ke QR Code", style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }

  // --- NAVBAR BARU (Semua Icon pakai SVG) ---
  Widget _buildCustomNavBar(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Background Hijau
          Container(height: 70, decoration: const BoxDecoration(color: Color(0xFF7CB342))),
          
          // Icon Bar
          Positioned(
            bottom: 0, left: 0, right: 0, height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 1. Home (SVG)
                IconButton(
                  onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 32, height: 32,
                  ),
                ),
                
                // 2. Menu (SVG)
                IconButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllMenuPage()),
                      );
                  },
                  // Ganti Icon(Icons.grid_view) dengan SVG Bento Box
                  icon: SvgPicture.asset(
                    "assets/icons/bento-box.svg",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 32, height: 32,
                  ),
                ),
                
                // 3. QR BUTTON (TIMBUL - SVG)
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: Container(
                    width: 75, height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7CB342),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    // Ganti Icon(Icons.qr_code) dengan SVG Scan QR
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding biar ikon tidak kekecilan/kegedean
                      child: SvgPicture.asset(
                        "assets/icons/scan-qr.svg",
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),

                // 4. Favorites (SVG)
                IconButton(
                  onPressed: (){}, 
                  icon: SvgPicture.asset(
                    "assets/icons/favourites.svg",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 32, height: 32,
                  ),
                ),

                // 5. User (SVG)
                IconButton(
                  onPressed: (){}, 
                  icon: SvgPicture.asset(
                    "assets/icons/user.svg",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 32, height: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}