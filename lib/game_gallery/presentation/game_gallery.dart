import 'package:flutter/material.dart';
import 'package:portofolio_flutter/game_gallery/presentation/bloc/game_bloc.dart';

import '../di_container.dart';

class GameGallery extends StatelessWidget {
  const GameGallery({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<GameBloc>().getGenres();
    return Scaffold(
      body: ListView(children: [
        
      ],),
    );
  }
}