import 'package:flutter/material.dart';
import '../widgets/bill_item.dart';
import '../widgets/bill_total_row.dart';
import '../widgets/sidebar_button.dart';
import '../widgets/fast_key_item.dart';
import '../widgets/product_item.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int _selectedIndex = 0;
  int _selectedTestCase = -1;

  void _updateSelectedTestCase(int index) {
    setState(() {
      _selectedTestCase = index;
    });
  }

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
                Image.asset('assets/pinaka.png', width: 80),
                const SizedBox(height: 20),
                SidebarButton(index: 0,
                    selectedIndex: _selectedIndex,
                    icon: Icons.bolt,
                    label: "Fast Key",
                    onTap: () => setState(() => _selectedIndex = 0)),
                SidebarButton(index: 1,
                    selectedIndex: _selectedIndex,
                    icon: Icons.category,
                    label: "Categories",
                    onTap: () => setState(() => _selectedIndex = 1)),
                SidebarButton(index: 2,
                    selectedIndex: _selectedIndex,
                    icon: Icons.add,
                    label: "Add",
                    onTap: () => setState(() => _selectedIndex = 2)),
                SidebarButton(index: 3,
                    selectedIndex: _selectedIndex,
                    icon: Icons.list_alt,
                    label: "Orders",
                    onTap: () => setState(() => _selectedIndex = 3)),
                const Spacer(),
                SidebarButton(index: 4,
                    selectedIndex: _selectedIndex,
                    icon: Icons.settings,
                    label: "Settings",
                    onTap: () => setState(() => _selectedIndex = 4)),
                SidebarButton(index: 5,
                    selectedIndex: _selectedIndex,
                    icon: Icons.logout,
                    label: "Logout",
                    onTap: () => setState(() => _selectedIndex = 5)),
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
                      FastKeyItem(title: "Test Case (1)",
                          index: 0,
                          selectedTestCase: _selectedTestCase,
                          onSelect: _updateSelectedTestCase),
                      FastKeyItem(title: "Test Case (2)",
                          index: 1,
                          selectedTestCase: _selectedTestCase,
                          onSelect: _updateSelectedTestCase),
                      FastKeyItem(title: "Test Case (3)",
                          index: 2,
                          selectedTestCase: _selectedTestCase,
                          onSelect: _updateSelectedTestCase),
                      FastKeyItem(title: "+",
                          index: -1,
                          selectedTestCase: _selectedTestCase,
                          onSelect: _updateSelectedTestCase),
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
                      ProductItem(
                        title: "Bread Slices",
                        imgPath: "assets/img.png",
                        price: "\$2.5",
                        onAddToCart: () {
                          // Handle add to cart action
                        },
                      ),
                      ProductItem(
                        title: "Green Apple",
                        imgPath: "assets/greenapple.png",
                        price: "\$4.0",
                        onAddToCart: () {
                          // Handle add to cart action
                        },
                      ),
                      ProductItem(
                        title: "Vegetables",
                        imgPath: "assets/veg.png",
                        price: "\$6.0",
                        onAddToCart: () {
                          // Handle add to cart action
                        },
                      ),
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

                // Using the new BillItem widget
                const BillItem(
                    name: "Fruits",
                    desc: "1 kg",
                    qty: 4,
                    price: 3.5,
                    imgPath: "assets/greenapple.png"),
                const BillItem(
                    name: "Vegetables",
                    desc: "0.5 lbs",
                    qty: 2,
                    price: 6.0,
                    imgPath: "assets/veg.png"),
                const BillItem(
                    name: "Bread Slices",
                    desc: "Small",
                    qty: 3,
                    price: 4.0,
                    imgPath: "assets/img.png"),

                const Divider(),
                const BillTotalRow(label: "Sub Total", amount: "\$38.0"),
                const BillTotalRow(label: "Tax", amount: "\$3.0"),
                const BillTotalRow(label: "Discount", amount: "-\$3.0", isDiscount: true),
                const BillTotalRow(label: "Total", amount: "\$38.0", isBold: true),
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
}