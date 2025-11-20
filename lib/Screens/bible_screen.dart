import 'package:catholic_app/repositories/biblia_repository.dart';
import 'package:catholic_app/services/biblia_json_service.dart';
import 'package:catholic_app/utils/app_routes.dart';
import 'package:catholic_app/view_models/biblia_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bíblia'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => BibliaViewModel(bibliaRepostory: BibliaRepository(bibliaJsonService: BibliaJsonService())),
        child: Consumer<BibliaViewModel>(
          builder: (context, bookNames, child) =>
          ListView.builder(
            itemCount: bookNames.bookNames.length,
            itemBuilder: (ctx, index) => ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.BOOK);
              },
              child: Text(bookNames.bookNames[index]),
            ),
          ),
        ),
      ),
    );
  }
}