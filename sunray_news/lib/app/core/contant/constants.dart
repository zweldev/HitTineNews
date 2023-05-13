String apiKey = 'f4d029c235404c82ad98e16fb8aa2d68';

// basic
String Base_url =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

// by category and country
String categorized_url({
   String? category,
}) {
   return "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";

}

// by keyword
String search_url({
  String? keyword,
}) {
  return "https://newsapi.org/v2/everything?q=${keyword ?? ""}&apiKey=$apiKey";
}

//by category and source
String source_url({required String category, required String source}) {
  return "https://newsapi.org/v2/$category?sources=$source&apiKey=$apiKey";
}
