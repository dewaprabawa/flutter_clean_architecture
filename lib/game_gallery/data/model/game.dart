class Game {
  String? slug;
  String? name;
  int? playtime;
  List<Platforms>? platforms;
  List<Stores>? stores;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Ratings>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? suggestionsCount;
  String? updated;
  int? id;
  List<Tags>? tags;
  EsrbRating? esrbRating;
  int? reviewsCount;
  List<ShortScreenshots>? shortScreenshots;

  Game(
      {this.slug,
      this.name,
      this.playtime,
      this.platforms,
      this.stores,
      this.released,
      this.tba,
      this.backgroundImage,
      this.rating,
      this.ratingTop,
      this.ratings,
      this.ratingsCount,
      this.reviewsTextCount,
      this.added,
      this.addedByStatus,
      this.metacritic,
      this.suggestionsCount,
      this.updated,
      this.id,
      this.tags,
      this.esrbRating,
      this.reviewsCount,
      this.shortScreenshots,});

  Game.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    playtime = json['playtime'];
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(new Platforms.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? new AddedByStatus.fromJson(json['added_by_status'])
        : null;
    metacritic = json['metacritic'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    id = json['id'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? new EsrbRating.fromJson(json['esrb_rating'])
        : null;
    reviewsCount = json['reviews_count'];
    if (json['short_screenshots'] != null) {
      shortScreenshots = <ShortScreenshots>[];
      json['short_screenshots'].forEach((v) {
        shortScreenshots!.add(ShortScreenshots.fromJson(v));
      });
    }
  
  }
}

class Platforms {
  Platform? platform;

  Platforms({this.platform});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
  }
}

class Platform {
  int? id;
  String? name;
  String? slug;

  Platform({this.id, this.name, this.slug});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

}

class Stores {
  Platform? store;

  Stores({this.store});

  Stores.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? new Platform.fromJson(json['store']) : null;
  }

}

class Ratings {
  int? id;
  String? title;
  int? count;
  double? percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }
}

class AddedByStatus {
  int? yet;
  int? owned;
  int? beaten;
  int? toplay;
  int? dropped;
  int? playing;

  AddedByStatus(
      {this.yet,
      this.owned,
      this.beaten,
      this.toplay,
      this.dropped,
      this.playing});

  AddedByStatus.fromJson(Map<String, dynamic> json) {
    yet = json['yet'];
    owned = json['owned'];
    beaten = json['beaten'];
    toplay = json['toplay'];
    dropped = json['dropped'];
    playing = json['playing'];
  }
}

class Tags {
  int? id;
  String? name;
  String? slug;
  String? language;
  int? gamesCount;
  String? imageBackground;

  Tags(
      {this.id,
      this.name,
      this.slug,
      this.language,
      this.gamesCount,
      this.imageBackground});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
}

class EsrbRating {
  int? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  EsrbRating({this.id, this.name, this.slug, this.nameEn, this.nameRu});

  EsrbRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
  }
}

class ShortScreenshots {
  int? id;
  String? image;

  ShortScreenshots({this.id, this.image});

  ShortScreenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}