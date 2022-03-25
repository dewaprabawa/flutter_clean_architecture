
import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

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
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
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
        slug: json["slug"],
        name: json["name"],
        added: json["added"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "added": added,
    };
}
