import 'package:flutter/material.dart';

class GenreButtons extends StatelessWidget {
  final List<String> genreList;
  final int selectedIndex;
  final ValueChanged<int> onGenreSelected;
  final VoidCallback onExplorerPressed;

  const GenreButtons({
    super.key,
    required this.genreList,
    required this.selectedIndex,
    required this.onGenreSelected,
    required this.onExplorerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: 25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Explorer Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: onExplorerPressed,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.explore,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Genre Buttons
          for (int i = 0; i < genreList.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () => onGenreSelected(i + 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: selectedIndex == i + 1 ? Colors.white : const Color.fromARGB(255, 46, 46, 46),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      genreList[i],
                      style: TextStyle(
                        color: selectedIndex == i + 1 ? Colors.black : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}