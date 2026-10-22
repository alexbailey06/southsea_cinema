import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/model/film.dart';

class FilmCard extends StatelessWidget {
  final Film film;

  const FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(9.0, 14.0, 14.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  film.name.toUpperCase(),
                  style: const TextStyle(
                    color: cinemaBrand,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '(${film.ageRating})',
                style: const TextStyle(color: cinemaFontMuted),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                film.imagePath,
                width: 100.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  film.description,
                  style: const TextStyle(color: cinemaFontWhite),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          const Text(
            'BOOK TICKETS',
            style: TextStyle(color: cinemaFontWhite),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  film.screeningTime,
                  style: const TextStyle(color: cinemaFontWhite),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  minimumSize: const Size(120.0, 34.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () => Navigator.pushNamed(context, '/listing'),
                child: const Text('BOOK NOW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
