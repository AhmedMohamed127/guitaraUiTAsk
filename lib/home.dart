import 'package:flutter/material.dart';

class BikeShoppingScreen extends StatelessWidget {
  const BikeShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Choose Your Bike',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/BG.png',),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      // Featured E-bike Card
                      // Bike Image
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/TopCard.png',
                                // Replace with your asset
                                width: double.infinity,
                                height: 500,
                                fit: BoxFit.fitHeight,
                              ),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                          ],
                        ),
                      ),
                      // Filter Chips
                      Row(
                        children: [
                          _buildFilterChip(
                            true,
                            'All',
                            Image.asset('assets/images/Bicycle.png', width: 0),
                          ),
                          const SizedBox(width: 12),
                          _buildFilterChip(
                            false,
                            '',
                            Image.asset('assets/images/batt.png'),
                          ),
                          const SizedBox(width: 12, height: 30),
                          _buildFilterChip(
                            false,
                            '',
                            Image.asset('assets/images/batt.png'),
                          ),
                          const SizedBox(width: 12),
                          _buildFilterChip(
                            false,
                            '',
                            Image.asset('assets/images/batt.png'),
                          ),
                          const SizedBox(width: 12),
                          _buildFilterChip(
                            false,
                            '',
                            Image.asset('assets/images/batt.png'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Products Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: [
                          _buildProductCard(
                              'Road Bike',
                              'PEUGEOT - LR01',
                              '\$ 1,999.99',
                              'assets/road_bike.png',
                              Color(0xFF222834),
                              Image.asset('assets/images/bike.png'),
                              true
                          ),
                          _buildProductCard(
                              'Road Helmet',
                              'SMITH - Trade',
                              '\$ 120',
                              'assets/helmet.png',
                              const Color(0xFF222834),
                              Image.asset('assets/images/Image.png'),
                              false
                          ),
                          _buildProductCard(
                              'Mountain Bike',
                              'TREK - X1',
                              '\$ 2,499.99',
                              'assets/mountain_bike.png',
                              const Color(0xFF222834),
                              Image.asset('assets/images/bike.png'),
                              true
                          ),
                          _buildProductCard(
                              'Bike Accessories',
                              'Various Items',
                              '\$ 99.99',
                              'assets/accessories.png',
                              const Color(0xFF222834),
                              Image.asset('assets/images/bike.png'),
                              false
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2E),
          border: Border(top: BorderSide(color: Color(0xFF2D2D4A), width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(Icons.directions_bike, true),
            _buildBottomNavItem(Icons.map_outlined, false),
            _buildBottomNavItem(Icons.shopping_cart_outlined, false),
            _buildBottomNavItem(Icons.person_outline, false),
            _buildBottomNavItem(Icons.description_outlined, false),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(bool isSelected, String? label, Widget icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: isSelected
                  ? [Color(0xFF4A9EFF), Color(0xFF4E4AF2)]
                  : [Color(0xFF222834), Color(0xFF353F54)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
        icon,
      ],
    );
  }

  Widget _buildProductCard(
      String category,
      String title,
      String price,
      String imagePath,
      Color cardColor,
      Widget image,
      bool check,
      ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [cardColor, cardColor.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  category,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Heart icon
          Positioned(
            top: 20,
            right: 12,
            child:  Icon(Icons.favorite_border,  color: check ? Colors.white70 : Colors.blue, size: 20),
          ),
          // Product image placeholder
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: image,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4A9EFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white54,
        size: 24,
      ),
    );
  }
}
