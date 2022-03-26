
import 'dart:convert';

import 'dart:developer';

List<Genre> genreFromJson(String str){
  Map<String,dynamic> map = json.decode(str);
  log(map.toString());
  return List<Genre>.from(map["results"].map((x) => Genre.fromJson(x)));
}

class Genre {
    Genre({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.games,
    });

    int? id;
    String? name;
    String? slug;
    int? gamesCount;
    String? imageBackground;
    List<Game>? games;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"] ?? "Unknown",
        slug: json["slug"] ?? "Unknown",
        gamesCount: json["games_count"] ?? 0,
        imageBackground: json["image_background"],
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
    );
}

class Game {
    Game({
        this.id,
        this.slug,
        this.name,
        this.added,
    });

    int? id;
    String? slug;
    String? name;
    int? added;

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"] ?? "Unknown",
        name: json["name"] ?? "Unknown",
        added: json["added"] ?? "Unknown",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "added": added,
    };
}
