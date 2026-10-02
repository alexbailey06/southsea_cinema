import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _selectedQuantity = 5;

  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Purchase Successful",
            style: TextStyle(color: cinemaBrand)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      backgroundColor: cinemaBackground,
      body: Container(
        color: cinemaBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 40,
          children: [
            const Text("Bullet Train (2022) (R)",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: cinemaFontWhite)),
            const Text("Southsea Cinema Room",
            style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            const Text("Monday 10th November 2026 13:30 - ends at 16:00",
            style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            const Text(
              "Note that Discounts/Membership benefits apply after tickets are selected.",
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            const Text("Selected Quantity (Up to 5 in total)",
            style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            const Text("Tickets:",
            style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            Row(children: [
            DropdownMenu<int>(
              initialSelection: _selectedQuantity,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "1"),
                DropdownMenuEntry(value: 2, label: "2"),
                DropdownMenuEntry(value: 3, label: "3"),
                DropdownMenuEntry(value: 4, label: "4"),
                DropdownMenuEntry(value: 5, label: "5"),
              ],
            ),
            Text("Adult £7.50",
            style: TextStyle(fontSize: 18, color: cinemaFontWhite))
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showPurchaseDialog,
              child: const Text("Press to Purchase"),
            ),
          ],
        ),
      ),
    );
  }
}
