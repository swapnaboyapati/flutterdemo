import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(width: 30),
            // Logo
            Image.asset('assets/Pinaka.png', height: 40),

            SizedBox(width: 40),

            /// Search Box
            Container(
              width: screenWidth * 0.38,
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFECEBEB)),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xFFA19999), size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xFFA19999),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search item or short code....',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 75),

            // Buttons
            _buildTopBarButton('+ Reserved table'),
            SizedBox(width: 25),
            _buildTopBarButton('Transfer table'),
            SizedBox(width: 25),
            _buildTopBarButton('Merge table'),

            SizedBox(width: 60),

            // Profile + Notifications
            _buildProfileSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBarButton(String label) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/loginname.png'),
                    radius: 16,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mohan Krishna",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text("I am manager",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none_outlined,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _statusDot(Colors.red, "Dine In"),
            SizedBox(width: 10),
            _statusDot(Color(0xFFC4C4C4), "Available"),
            SizedBox(width: 10),
            _statusDot(Colors.green, "Reserve"),
          ],
        ),
      ],
    );
  }

  Widget _statusDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}