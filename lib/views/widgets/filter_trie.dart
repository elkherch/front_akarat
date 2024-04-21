import 'package:flutter/material.dart';

class FilterAndTrie extends StatelessWidget {
  const FilterAndTrie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Filtrer par...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            flex: 3,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items:const [
                 DropdownMenuItem(
                  value: null,
                  child: Text('Trier par...'),
                ),
                 DropdownMenuItem(
                  value: 'name',
                  child: Text('Les plus pertinents'),
                ),
                 DropdownMenuItem(
                  value: 'price',
                  child: Text('Les plus récents'),
                ),
                // Ajoutez d'autres options de tri ici si nécessaire
              ],
              onChanged: (String? newValue) {
                // Mettez en œuvre la logique de tri ici
              },
            ),
          ),
        ],
      ),
    );
  }
}
