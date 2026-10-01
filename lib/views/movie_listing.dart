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
        title: const Text("Purchase Successful"),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: [
              const Text('Bullet Train (2022) (R)'),
              const Text('Southsea Cinema Room'),
              const Text('Monday 10th November 2026 13:30 - ends at 16:00'),
              const Text(
                'Note that Discounts/Membership benefits apply after tickets are selected.',
              ),
              const Text('Selected Quantity (Up to 5 in total)'),
              const Text('Tickets:'),
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
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
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
      ),
    );
  }
}
