// import 'package:flutter/material.dart';

// class Car {
//   final String name;
//   final double price;
//   final int seats;
//   final String transmission;
//   final String fuelType;
//   final double distance;
//   final String imageUrl;
//   final String provider;

//   Car({
//     required this.name,
//     required this.price,
//     required this.seats,
//     required this.transmission,
//     required this.fuelType,
//     required this.distance,
//     required this.imageUrl,
//     required this.provider,
//   });
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Car> allCars = [
//     Car(
//       name: 'Citroen C3',
//       price: 18848,
//       seats: 5,
//       transmission: 'Manual',
//       fuelType: 'Petrol',
//       distance: 10.0,
//       imageUrl:
//           'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       provider: 'Zoomcar',
//     ),
//     Car(
//       name: 'Maruti Ertiga',
//       price: 10013,
//       seats: 7,
//       transmission: 'Automatic',
//       fuelType: 'Diesel',
//       distance: 5.0,
//       imageUrl:
//           'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       provider: 'Zoomcar',
//     ),
//     Car(
//       name: 'Bmw',
//       price: 188458,
//       seats: 5,
//       transmission: 'Hybrid',
//       fuelType: 'Petrol',
//       distance: 10.0,
//       imageUrl:
//           'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       provider: 'Zoomcar',
//     ),
//     Car(
//       name: 'Tesla',
//       price: 188548,
//       seats: 5,
//       transmission: 'Automatic',
//       fuelType: 'Petrol',
//       distance: 10.0,
//       imageUrl:
//           'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       provider: 'Zoomcar',
//     ),
//     Car(
//       name: 'Mercedes-Benz G-Wagon',
//       price: 1448848,
//       seats: 5,
//       transmission: 'Hybrid',
//       fuelType: 'Petrol',
//       distance: 10.0,
//       imageUrl:
//           'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       provider: 'Zoomcar',
//     ),
//   ];

//   List<Car> filteredCars = [];
//   Set<String> selectedTransmissions = {};
//   String priceSort = 'lowToHigh';
//   RangeValues seatRange = const RangeValues(3, 8);
//   Set<String> selectedFuelTypes = {};
//   String selectedPriceSort = 'Low to High';

//   @override
//   void initState() {
//     super.initState();
//     filteredCars = allCars;
//   }

//   void applyFilters() {
//     setState(() {
//       filteredCars = allCars.where((car) {
//         final transmissionMatch = selectedTransmissions.isEmpty ||
//             selectedTransmissions.contains(car.transmission);
//         final seatMatch =
//             car.seats >= seatRange.start && car.seats <= seatRange.end;
//         final fuelMatch = selectedFuelTypes.isEmpty ||
//             selectedFuelTypes.contains(car.fuelType);

//         return transmissionMatch && seatMatch && fuelMatch;
//       }).toList();

//       if (priceSort == 'lowToHigh') {
//         filteredCars.sort((a, b) => a.price.compareTo(b.price));
//       } else {
//         filteredCars.sort((a, b) => b.price.compareTo(a.price));
//       }
//     });
//   }

//   void _showTransmissionFilter() async {
//     Set<String> tempSelections = Set.from(selectedTransmissions);

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text('Select Transmission'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children:
//                       ['Manual', 'Automatic', 'Hybrid'].map((transmission) {
//                     return CheckboxListTile(
//                       title: Text(transmission),
//                       value: tempSelections.contains(transmission),
//                       onChanged: (value) {
//                         setState(() {
//                           if (value!) {
//                             tempSelections.add(transmission);
//                           } else {
//                             tempSelections.remove(transmission);
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     setState(() {
//                       selectedTransmissions = tempSelections;
//                     });
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showPriceSortFilter() async {
//     String tempPriceSort = priceSort;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text('Sort by Price'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   RadioListTile<String>(
//                     title: Text('Low to High'),
//                     value: 'lowToHigh',
//                     groupValue: tempPriceSort,
//                     onChanged: (value) {
//                       setState(() {
//                         tempPriceSort = value!;
//                       });
//                     },
//                   ),
//                   RadioListTile<String>(
//                     title: Text('High to Low'),
//                     value: 'highToLow',
//                     groupValue: tempPriceSort,
//                     onChanged: (value) {
//                       setState(() {
//                         tempPriceSort = value!;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     setState(() {
//                       priceSort = tempPriceSort;
//                       selectedPriceSort = tempPriceSort == 'lowToHigh'
//                           ? 'Low to High'
//                           : 'High to Low';
//                     });
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showSeatFilter() async {
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Select Seat Range'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             RangeSlider(
//               values: seatRange,
//               min: 3,
//               max: 8,
//               divisions: 5,
//               labels: RangeLabels(
//                 seatRange.start.toInt().toString(),
//                 seatRange.end.toInt().toString(),
//               ),
//               onChanged: (values) {
//                 setState(() => seatRange = values);
//               },
//             ),
//             Text('${seatRange.start.toInt()} - ${seatRange.end.toInt()} Seats'),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showFuelTypeFilter() async {
//     Set<String> tempSelections = Set.from(selectedFuelTypes);

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text('Select Fuel Type'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: ['Petrol', 'Diesel', 'Electric'].map((fuel) {
//                     return CheckboxListTile(
//                       title: Text(fuel),
//                       value: tempSelections.contains(fuel),
//                       onChanged: (value) {
//                         setState(() {
//                           if (value!) {
//                             tempSelections.add(fuel);
//                           } else {
//                             tempSelections.remove(fuel);
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     setState(() {
//                       selectedFuelTypes = tempSelections;
//                     });
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _resetFilters() {
//     setState(() {
//       selectedTransmissions.clear();
//       selectedFuelTypes.clear();
//       seatRange = const RangeValues(3, 8);
//       priceSort = 'lowToHigh';
//       selectedPriceSort = 'Low to High';
//       applyFilters();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         title: Text(
//           '4 Day(s) 21 Hour(s)',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.grey[900],
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.location_on,
//                             color: Color(0xFFedff8d), size: 20),
//                         SizedBox(width: 4),
//                         Text(
//                           'Mumbai, Maharashtra, Maharashtra',
//                           style: TextStyle(
//                             color: Color(0xFFedff8d),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 12),
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[800],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                         child: Text(
//                           '15 February 2025 - 20 February 2025',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[800],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'All',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.grey[900],
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     GridView.count(
//                       crossAxisCount: 2,
//                       shrinkWrap: true,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                       childAspectRatio: 3.5,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                         GestureDetector(
//                           onTap: _showTransmissionFilter,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 12),
//                                   child: Text(
//                                     'Transmission',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 Icon(Icons.arrow_drop_down,
//                                     color: Colors.white),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: _showPriceSortFilter,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 12),
//                                   child: Text(
//                                     'Price Range',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 Icon(Icons.arrow_drop_down,
//                                     color: Colors.white),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: _showSeatFilter,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 12),
//                                   child: Text(
//                                     'Seats',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 Icon(Icons.arrow_drop_down,
//                                     color: Colors.white),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: _showFuelTypeFilter,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 12),
//                                   child: Text(
//                                     'Fuel Type',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 Icon(Icons.arrow_drop_down,
//                                     color: Colors.white),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: _resetFilters,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Icon(Icons.refresh,
//                                   color: Colors.yellow, size: 24),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: applyFilters,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color(0xFFedff8d),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Apply',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 padding: EdgeInsets.all(16),
//                 itemCount: filteredCars.length,
//                 itemBuilder: (context, index) {
//                   final car = filteredCars[index];
//                   return Card(
//                     color: Colors.grey[800],
//                     margin: EdgeInsets.only(bottom: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(8)),
//                           child: Image.network(
//                             car.imageUrl,
//                             height: 180,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 car.name,
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 '${car.seats} Seats',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Image.asset('assets/z.png', height: 20),
//                                   SizedBox(width: 8),
//                                   // Text(
//                                   //   car.provider,
//                                   //   style: TextStyle(
//                                   //     color: Colors.green,
//                                   //     fontWeight: FontWeight.w500,
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 '${car.distance} km away',
//                                 style: TextStyle(color: Colors.green),
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Starts at',
//                                           style:
//                                               TextStyle(color: Colors.white)),
//                                       Text(
//                                         '₹${car.price.toStringAsFixed(0)}',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.arrow_forward,
//                                         color: Colors.grey),
//                                     onPressed: () {},
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:zymohome/widgets/car_detail_page.dart';

class Car {
  final String name;
  final double price;
  final int seats;
  final String transmission;
  final String fuelType;
  final double distance;
  final String imageUrl;
  final String provider;

  Car({
    required this.name,
    required this.price,
    required this.seats,
    required this.transmission,
    required this.fuelType,
    required this.distance,
    required this.imageUrl,
    required this.provider,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Car> allCars = [
    Car(
      name: 'Citroen C3',
      price: 18848,
      seats: 5,
      transmission: 'Manual',
      fuelType: 'Petrol',
      distance: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      provider: 'Zoomcar',
    ),
    Car(
      name: 'Maruti Ertiga',
      price: 10013,
      seats: 7,
      transmission: 'Automatic',
      fuelType: 'Diesel',
      distance: 5.0,
      imageUrl:
          'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      provider: 'Zoomcar',
    ),
    Car(
      name: 'Bmw',
      price: 188458,
      seats: 5,
      transmission: 'Hybrid',
      fuelType: 'Petrol',
      distance: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      provider: 'Zoomcar',
    ),
    Car(
      name: 'Tesla',
      price: 188548,
      seats: 5,
      transmission: 'Automatic',
      fuelType: 'Petrol',
      distance: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      provider: 'Zoomcar',
    ),
    Car(
      name: 'Mercedes-Benz G-Wagon',
      price: 1448848,
      seats: 5,
      transmission: 'Hybrid',
      fuelType: 'Petrol',
      distance: 10.0,
      imageUrl:
          'https://images.unsplash.com/photo-1704340142770-b52988e5b6eb?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      provider: 'Zoomcar',
    ),
  ];

  List<Car> filteredCars = [];
  Set<String> selectedTransmissions = {};
  String priceSort = 'lowToHigh';
  RangeValues seatRange = const RangeValues(3, 8);
  Set<String> selectedFuelTypes = {};
  String selectedPriceSort = 'Low to High';

  @override
  void initState() {
    super.initState();
    filteredCars = allCars;
  }

  void applyFilters() {
    setState(() {
      filteredCars = allCars.where((car) {
        final transmissionMatch = selectedTransmissions.isEmpty ||
            selectedTransmissions.contains(car.transmission);
        final seatMatch =
            car.seats >= seatRange.start && car.seats <= seatRange.end;
        final fuelMatch = selectedFuelTypes.isEmpty ||
            selectedFuelTypes.contains(car.fuelType);

        return transmissionMatch && seatMatch && fuelMatch;
      }).toList();

      if (priceSort == 'lowToHigh') {
        filteredCars.sort((a, b) => a.price.compareTo(b.price));
      } else {
        filteredCars.sort((a, b) => b.price.compareTo(a.price));
      }
    });
  }

  void _showTransmissionFilter() async {
    Set<String> tempSelections = Set.from(selectedTransmissions);

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select Transmission'),
              content: SingleChildScrollView(
                child: Column(
                  children:
                      ['Manual', 'Automatic', 'Hybrid'].map((transmission) {
                    return CheckboxListTile(
                      title: Text(transmission),
                      value: tempSelections.contains(transmission),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            tempSelections.add(transmission);
                          } else {
                            tempSelections.remove(transmission);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedTransmissions = tempSelections;
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPriceSortFilter() async {
    String tempPriceSort = priceSort;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Sort by Price'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Low to High'),
                    value: 'lowToHigh',
                    groupValue: tempPriceSort,
                    onChanged: (value) {
                      setState(() {
                        tempPriceSort = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('High to Low'),
                    value: 'highToLow',
                    groupValue: tempPriceSort,
                    onChanged: (value) {
                      setState(() {
                        tempPriceSort = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      priceSort = tempPriceSort;
                      selectedPriceSort = tempPriceSort == 'lowToHigh'
                          ? 'Low to High'
                          : 'High to Low';
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSeatFilter() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Seat Range'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RangeSlider(
              values: seatRange,
              min: 3,
              max: 8,
              divisions: 5,
              labels: RangeLabels(
                seatRange.start.toInt().toString(),
                seatRange.end.toInt().toString(),
              ),
              onChanged: (values) {
                setState(() => seatRange = values);
              },
            ),
            Text('${seatRange.start.toInt()} - ${seatRange.end.toInt()} Seats'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showFuelTypeFilter() async {
    Set<String> tempSelections = Set.from(selectedFuelTypes);

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select Fuel Type'),
              content: SingleChildScrollView(
                child: Column(
                  children: ['Petrol', 'Diesel', 'Electric'].map((fuel) {
                    return CheckboxListTile(
                      title: Text(fuel),
                      value: tempSelections.contains(fuel),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            tempSelections.add(fuel);
                          } else {
                            tempSelections.remove(fuel);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedFuelTypes = tempSelections;
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _resetFilters() {
    setState(() {
      selectedTransmissions.clear();
      selectedFuelTypes.clear();
      seatRange = const RangeValues(3, 8);
      priceSort = 'lowToHigh';
      selectedPriceSort = 'Low to High';
      applyFilters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          '4 Day(s) 21 Hour(s)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[900],
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on,
                            color: Color(0xFFedff8d), size: 20),
                        SizedBox(width: 4),
                        Text(
                          'Mumbai, Maharashtra, Maharashtra',
                          style: TextStyle(
                            color: Color(0xFFedff8d),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '15 February 2025 - 20 February 2025',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[900],
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3.5,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GestureDetector(
                          onTap: _showTransmissionFilter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'Transmission',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _showPriceSortFilter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'Price Range',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _showSeatFilter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'Seats',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _showFuelTypeFilter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'Fuel Type',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _resetFilters,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.refresh,
                                  color: Colors.yellow, size: 24),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: applyFilters,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFedff8d),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  final car = filteredCars[index];
                  return Card(
                    color: Colors.grey[800],
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.network(
                            car.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                car.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${car.seats} Seats',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset('assets/z.png', height: 20),
                                  SizedBox(width: 8),
                                  // Text(
                                  //   car.provider,
                                  //   style: TextStyle(
                                  //     color: Colors.green,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${car.distance} km away',
                                style: TextStyle(
                                  color: Color(0xFFedff8d),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Starts at',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text(
                                        '₹${car.price.toStringAsFixed(0)}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward,
                                        color: Colors.grey),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CarDetailsPage(car: car),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  final Car car;

  CarDetailsPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarDetailsScreen(),
    );
  }
}
