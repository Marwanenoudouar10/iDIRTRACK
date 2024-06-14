import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: 'Rechercher ....',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
        onSubmitted: onSearch,
        onChanged: onSearch,
      ),
    );
  }
}
