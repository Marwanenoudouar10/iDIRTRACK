import 'package:flutter/material.dart';

Widget buildSearchBarWidget({
  required Function(String) onSearch,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[400],
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
    ),
  );
}
