import 'package:flutter/material.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key? key}) : super(key: key);

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  final Color appColor = const Color(0xFFedff8d);

  static Color? darkGrey = Colors.grey[900];
  static Color? darkGrey2 = Colors.grey[800];
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  String firstDate = "11 Feb, 2025";
  String firstTime = "12:00 PM";
  String secondDate = "13 Feb, 2025";
  String secondTime = "12:00 PM";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "BOOK NOW",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildButtonSlider(),
                  const SizedBox(height: 20),
                  _currentIndex == 0
                      ? _buildMainView()
                      : _currentIndex == 1
                          ? _buildSubscribeView()
                          : _buildBuyView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _currentIndex == 0 ? appColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            ),
            child: Text("Rent",
                style: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _currentIndex == 1 ? appColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            ),
            child: Text("Subscribe",
                style: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _currentIndex == 2 ? appColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            ),
            child:
                Text("Buy", style: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
        ),
      ],
    );
  }

  Widget _buildMainView() {
    DateTime firstDateTime = DateTime.parse(
      '${firstDate.split(', ').last}-${firstDate.split(' ')[0]}-${_getShortMonthNumber(firstDate.split(' ')[1])}',
    );
    DateTime secondDateTime = DateTime.parse(
      '${secondDate.split(', ').last}-${secondDate.split(' ')[0]}-${_getShortMonthNumber(secondDate.split(' ')[1])}',
    );
    int tripDuration = secondDateTime.difference(firstDateTime).inDays;

    return Column(
      children: [
        _buildLocationInput(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDateSelector(context, firstDate, firstTime, true),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey,
            ),
            _buildDateSelector(context, secondDate, secondTime, false),
          ],
        ),
        const SizedBox(height: 10),
        Text("Trip Duration",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
        Text("$tripDuration Days",
            style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 10),
            minimumSize: const Size(340, 0),
          ),
          onPressed: () {
            // Handle search action
          },
          child: Text("Search", style: TextStyle(fontSize: 18, color: black)),
        ),
      ],
    );
  }

  Widget _buildSubscribeView() {
    DateTime firstDateTime = DateTime.parse(
      '${firstDate.split(', ').last}-${firstDate.split(' ')[0]}-${_getShortMonthNumber(firstDate.split(' ')[1])}',
    );
    DateTime secondDateTime = DateTime.parse(
      '${secondDate.split(', ').last}-${secondDate.split(' ')[0]}-${_getShortMonthNumber(secondDate.split(' ')[1])}',
    );
    int tripDuration = secondDateTime.difference(firstDateTime).inDays;

    return Column(
      children: [
        _buildLocationInput(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDateSelector(context, firstDate, firstTime, true),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey,
            ),
            _buildDateSelector(context, secondDate, secondTime, false),
          ],
        ),
        const SizedBox(height: 10),
        Text("Trip Duration",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
        Text("$tripDuration Days",
            style: TextStyle(fontSize: 16, color: white)),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size(340, 0),
          ),
          onPressed: () {
            // Handle search action
          },
          child: Text("Search", style: TextStyle(fontSize: 18, color: black)),
        ),
      ],
    );
  }

  Widget _buildBuyView() {
    return Column(
      children: [
        Text("Add Car Image",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: appColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child:
                Text("Upload Car Image", style: TextStyle(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
          ),
          onPressed: () {
            // Handle buy action
          },
          child: Text("Buy", style: TextStyle(fontSize: 18, color: black)),
        ),
      ],
    );
  }

  Widget _buildLocationInput() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColor, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(color: white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(
      BuildContext context, String date, String time, bool isFirst) {
    return GestureDetector(
      onTap: () async {
        // Your date/time picker logic here...
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(date, style: TextStyle(color: Colors.white)),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  String _getShortMonthNumber(String month) {
    const monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return (monthNames.indexOf(month) + 1).toString().padLeft(2, '0');
  }
}
