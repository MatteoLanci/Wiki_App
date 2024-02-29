import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  final String charImage;
  final int id;
  final String charName;

  const CharacterPage({
    super.key,
    required this.charImage,
    required this.id,
    required this.charName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Opzionale: Aggiungi un AppBar per fornire un titolo o un pulsante di ritorno.
        title: Text(charName),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar:
          true, // Estende il corpo dietro l'AppBar se presente.
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Column(
          children: [
            Hero(
              tag: id,
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(charImage),
                    fit: BoxFit
                        .cover, // Assicura che l'immagine riempia il contenitore mantenendo le proporzioni
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
