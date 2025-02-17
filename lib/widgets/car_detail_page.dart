import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; // For icons

const Color appColor = Color(0xFFedff8d); // Define the app color

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Car Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CarDetailsScreen(),
//     );
//   }
// }

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: const Text(
          "Car Details",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image Placeholder
              Card(
                color: appColor, // Use appColor here
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: const Center(
                    child:
                        Icon(Icons.camera_alt, size: 50, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Car Title & Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MERCEDES",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Benz C Class 200d",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: appColor, size: 24), // Use appColor here
                      const SizedBox(width: 5),
                      const Text(
                        "4.5",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Car Features
              _buildFeatureTile("Seats", "7 Seats", LucideIcons.sofa),
              _buildFeatureTile("Trips", "257", LucideIcons.car),
              _buildFeatureTile("Fuel Type", "Petrol", LucideIcons.fuel),
              _buildFeatureTile("Transmission", "Manual", LucideIcons.joystick),
              const SizedBox(height: 16),

              // Specifications
              const Text(
                "Specifications",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSpecRow("Car Brand", "Maruti Suzuki"),
              _buildSpecRow("Car Name", "Ertiga 2017"),
              _buildSpecRow("Hourly Amount", "₹131/hr"),
              _buildSpecRow("Seats", "7 Seats"),
              _buildSpecRow("Fuel Type", "Petrol"),
              _buildSpecRow("Transmission", "Manual"),
              const SizedBox(height: 16),

              // Booking Details
              Card(
                color: Colors.grey[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      _buildBookingRow("Start Date", "16 February 2025",
                          LucideIcons.calendar),
                      _buildBookingRow("City", "Mumbai", LucideIcons.mapPin),
                      _buildBookingRow(
                          "End Date", "20 February 2025", LucideIcons.calendar),
                      _buildBookingRow(
                          "Drive Type", "Self Drive", LucideIcons.car),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // About the Car Container
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: appColor, width: 2), // App color border
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  color: Colors.transparent, // Transparent background
                ),
                padding:
                    const EdgeInsets.all(16), // Padding inside the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About Mercedes Benz C200d",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Space between title and content
                    const Text(
                      "The Mercedes Benz C Class 200d is a luxury sedan that combines elegance with performance. It features a powerful diesel engine, advanced safety systems, and a spacious interior designed for comfort. With its sleek design and cutting-edge technology, the C Class 200d offers an exceptional driving experience for both city and highway journeys.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Booking Price & Button
              Card(
                color: Colors.grey[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "₹12,268",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColor,
                            foregroundColor: Colors.grey[900],
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            _showLoginDialog(context); // Show login dialog
                          },
                          child: const Text("Book",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the login dialog
  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Login", style: TextStyle(color: Colors.white)),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
          content: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: appColor), // App color border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: appColor), // App color border when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: appColor), // App color border when focused
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: appColor), // App color border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: appColor), // App color border when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: appColor), // App color border when focused
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle login logic here
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    minimumSize: Size(double.infinity,
                        48), // Make the button as wide as the email box
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to sign-up page or handle sign-up logic
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparent background
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Don't have an account? Sign Up",
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle Google sign-in logic
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparent background
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Sign in with Google",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Feature Tile Widget
  Widget _buildFeatureTile(String title, String value, IconData icon) {
    return Card(
      color: Colors.grey[800], // Tile color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 18), // Updated text color
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  // Specification Row Widget
  Widget _buildSpecRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  // Booking Details Row Widget
  Widget _buildBookingRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          const Spacer(),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
