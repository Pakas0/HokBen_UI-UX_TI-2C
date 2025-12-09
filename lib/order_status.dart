import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. HEADER MERAH (AppBar Custom)
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000), // Warna Merah HokBen
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        title: const Text(
          'Order Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // 2. BAGIAN ISI (Bisa discroll)
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- STATUS PESANAN ---
                  const Text(
                    'Status Pesanan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusIcon(Icons.edit_note, true), // Icon Aktif
                      _buildLine(),
                      _buildStatusIcon(Icons.soup_kitchen, true),
                      _buildLine(),
                      _buildStatusIcon(Icons.local_shipping, true),
                      _buildLine(),
                      _buildStatusIcon(Icons.home, true),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 1),

                  // --- ITEM DETAILS ---
                  const SizedBox(height: 10),
                  const Text('Item Details', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  
                  // Item 1
                  _buildItemRow(
                    'HOKA HEMAT 1', 
                    'Rp 28.000,00', 
                    'https://placehold.co/100x100/png' // Placeholder gambar
                  ),
                  const SizedBox(height: 15),
                  
                  // Item 2
                  _buildItemRow(
                    'SOFT MANGO PUDING', 
                    'Rp 19.000,00', 
                    'https://placehold.co/100x100/png'
                  ),

                  const SizedBox(height: 20),
                  
                  // --- FINANCIAL SUMMARY ---
                  _buildSummaryRow('Subtotal (2 menu)', 'Rp 47.000,00'),
                  _buildSummaryRow('Voucher Diskon', '-Rp 13.000,00'),
                  _buildSummaryRow('Biaya Pengiriman', 'Rp 7.000,00'),

                  const SizedBox(height: 20),
                  const Divider(thickness: 1),

                  // --- ORDER INFO ---
                  const SizedBox(height: 10),
                  const Text(
                    'Order Info',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoRow('No. Pesanan', '48820307183'),
                  _buildInfoRow('Waktu Pemesanan', '10 Okt 2025 13:45'),
                  _buildInfoRow('Pembayaran', 'Transfer Bank'),
                  
                  // Baris Bukti Pengiriman (ada panahnya)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Bukti Pengiriman', style: TextStyle(fontSize: 14)),
                        Row(
                          children: const [
                            Text('Lihat foto', style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- TOMBOL ---
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Penilaian', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Pesan lagi', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          
          // 3. FOOTER HIJAU
          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0xFF7CB342), // Hijau Lumut
          ),
        ],
      ),
    );
  }

  // --- Widget Pembantu (Biar kodingan rapi) ---

  Widget _buildStatusIcon(IconData icon, bool isActive) {
    return Icon(
      icon,
      size: 32,
      color: isActive ? Colors.black : Colors.grey,
    );
  }

  Widget _buildLine() {
    return const Expanded(
      child: Divider(
        color: Colors.black,
        thickness: 2,
        indent: 5,
        endIndent: 5,
      ),
    );
  }

  Widget _buildItemRow(String name, String price, String imageUrl) {
    return Row(
      children: [
        // Gambar Makanan
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Mengambil gambar dari internet
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        // Nama & Jumlah
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              // Icon Jempol kecil (hiasan)
              const Icon(Icons.thumb_up_alt_outlined, size: 14, color: Colors.grey), 
            ],
          ),
        ),
        // Jumlah x1
        const Text('X 1', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 20),
        // Harga
        Text(price, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}