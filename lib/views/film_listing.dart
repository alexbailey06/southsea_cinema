import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/model/film.dart';

class FilmListing extends StatefulWidget {
  final Film film;
  const FilmListing({required this.film, super.key});

  @override
  State<FilmListing> createState() => _FilmListingState();
}

class _FilmListingState extends State<FilmListing> {
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
          spacing: 15,
          children: [
             Text("${widget.film.name} ${widget.film.ageRating}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: cinemaFontWhite)),
              Text(widget.film.description,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cinemaFontWhite),
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 3),
            const SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.film.imagePath,
                  width: 100.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
            
              
                    
              ],
            ),
            const Text("Southsea Cinema Room",
                style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            Text(widget.film.screeningTime,
                style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            const Text(
              "Note that Discounts/Membership benefits apply after tickets are selected.",
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            const Text("Selected Quantity (Up to 5 in total)",
                style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            const Text("Tickets:",
                style: TextStyle(fontSize: 18, color: cinemaFontWhite)),
            Row(
              children: [
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
