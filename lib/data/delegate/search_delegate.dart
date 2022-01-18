import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/global/controllers/general_controller.dart';
import 'package:onlaw/routes/routes_names.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';
import 'package:diacritic/diacritic.dart';

class MenuSearchDelegate extends SearchDelegate<MenuContentModel> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // throw UnimplementedError();
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { 
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError(); 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final general = Get.find<GeneralController>();
    final sugerencia =
        query.isEmpty ? general.suggestions.toList() : general.suggestions.where((p) => removeDiacritics(p.nombre!).toLowerCase().contains(query)).toList();

    return sugerencia.isEmpty
        ? const Center(
            child: Text('No hay resultados'),
          )
        : ListView.builder(
            itemCount: sugerencia.length,
            itemBuilder: (context, index) {
              final MenuContentModel listSugerencia = sugerencia[index];
              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.search, arguments: listSugerencia);
                },
                title: Text(sugerencia[index].nombre.toString()),
              );
            },
          );
  }
}
