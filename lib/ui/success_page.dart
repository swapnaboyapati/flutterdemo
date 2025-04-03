import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int _selectedIndex = 0;
  int _selectedTestCase = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 160,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/img.jpg', width: 80),
                const SizedBox(height: 20),
                _sidebarButton(0, Icons.bolt, "Fast Key"),
                _sidebarButton(1, Icons.category, "Categories"),
                _sidebarButton(2, Icons.add, "Add"),
                _sidebarButton(3, Icons.list_alt, "Orders"),
                const Spacer(),
                _sidebarButton(4, Icons.settings, "Settings"),
                _sidebarButton(5, Icons.logout, "Logout"),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Categories or menu...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Fast Keys Section
                  const Text(
                    "Fast Keys",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _fastKeyItem("Test Case (1)", 0),
                      _fastKeyItem("Test Case (2)", 1),
                      _fastKeyItem("Test Case (3)", 2),
                      _fastKeyItem("+", -1),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Products Section
                  const Text(
                    "Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _productItem("Bread Slices", "assets/img.png", "\$2.5"),
                      _productItem("Green Apple", "assets/greenapple.png", "\$4.0"),
                      _productItem("Vegetables", "assets/veg.png", "\$6.0"),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Right Sidebar
          Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment Bill Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _billItem("Fruits", "1 kg", 4, 3.5, "assets/greenapple.png"),
                _billItem("Vegetables", "0.5 lbs", 2, 6.0, "assets/veg.png"),
                _billItem("Bread Slices", "Small", 3, 4.0, "assets/img.png"),
                const Divider(),
                _billTotalRow("Sub Total", "\$38.0"),
                _billTotalRow("Tax", "\$3.0"),
                _billTotalRow("Discount", "-\$3.0", isDiscount: true),
                _billTotalRow("Total", "\$38.0", isBold: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Check Out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _sidebarButton(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: _selectedIndex == index ? 100 : double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _selectedIndex == index ? Colors.white : Colors.black, size: 22),
            const SizedBox(height: 3),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fast Key Items
  Widget _fastKeyItem(String title, int index) {
    bool isSelected = _selectedTestCase == index;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTestCase = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.red : Colors.black),
          ),
        ),
      ),
    );
  }

  // Product Items
  Widget _productItem(String title, String imgPath, String price) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Column(
          children: [
            Image.asset(imgPath, height: 70),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billItem(String name, String desc, int qty, double price, String imgPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // Item Image
          Image.asset(imgPath, width: 40, height: 40, fit: BoxFit.cover),
          const SizedBox(width: 10),

          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(desc, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),

          // Price
          Text("\$${(price * qty).toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Bill Total Rows
  Widget _billTotalRow(String label, String amount, {bool isDiscount = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount, style: TextStyle(color: isDiscount ? Colors.green : Colors.black, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}