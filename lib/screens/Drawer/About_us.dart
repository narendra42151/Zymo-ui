import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Image.asset('assets/zymoo.png', height: 55),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Go back to the previous screen (Home Screen)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey),
              const SizedBox(height: 20),
              Text(
                "Welcome to Zymo, India's largest aggregator for self-drive car rentals. With over 30,000 cars listed on our platform, we are the go-to destination for individuals looking for an exceptional self-drive rental experience in over 50 cities.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Our goal is to be a lifestyle brand that is trusted by millions of Indians, and we strive to become the most beloved brand in the country.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "At Zymo, we understand that building trust is critical to our success. Therefore, we focus on two key areas: transparent pricing and excellent customer service. Our pricing is always upfront, so you never have to worry about hidden fees or surprises.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Our commitment to exceptional customer service ensures that every interaction you have with us is pleasant and hassle-free. Whether you need a self-drive car for a minimum of 8 hours or several months, we have you covered.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Our vast collection of cars includes hatchbacks, sedans, SUVs, and luxury vehicles. No matter what your needs or preferences are, you can find the perfect car for your next adventure on our platform.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "What sets us apart from other rental platforms is our price comparison feature, which allows you to choose from the maximum options at the best prices. Our platform makes it easy to compare rental options, so you can make an informed decision that meets your needs and budget.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "We take pride in providing a seamless, stress-free rental experience, from the moment you book your car to the end of your rental period. Our app is the highest rated in the category on both platforms, reflecting our commitment to providing the best service possible.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "At Zymo, we are more than just a rental platform. We are your partner in adventure, here to help you explore the beauty of India on your own terms.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "With our vast collection of cars, transparent pricing, and exceptional customer service, you can trust us to deliver a self-drive rental experience that exceeds your expectations.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Thank you for choosing Zymo. We look forward to serving you soon.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
