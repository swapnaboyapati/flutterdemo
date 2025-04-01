import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int _selectedIndex = 0; // For sidebar selection
  int _selectedTestCase = -1; // For selected test case (no selection initially)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 180,
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
                      _fastKeyItem("+", -1), // For "Add" button or other use cases
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

          // Right Sidebar (Payment Summary)
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
                _billItem("King Fisher", "350ml", 4, 3.5),
                _billItem("Vegetables", "0.5 lbs", 2, 6.0),
                _billItem("Bread Slices", "Small", 3, 4.0),
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
                  child: const Text("Check Out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _sidebarButton(int index, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
        child: Container(
          width: 80, // Set a fixed width for consistency
          height: 70, // Set a fixed height for consistency
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.red.shade100 : Colors.transparent, // Change background color when selected
            border: Border.all(
              color: _selectedIndex == index ? Colors.red : Colors.grey, // Border color based on selection
              width: 2, // Border width
            ),
            borderRadius: BorderRadius.circular(8), // Rounded corners for the border
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: _selectedIndex == index ? Colors.red : Colors.grey, size: 30),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: _selectedIndex == index ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fast Key Items (Test Case Selection)
  Widget _fastKeyItem(String title, int index) {
    bool isSelected = _selectedTestCase == index;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTestCase = index; // Update selected test case
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }

  // Bill Item Row
  Widget _billItem(String name, String desc, int qty, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(desc, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            ],
          ),
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