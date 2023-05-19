enum Categories {
  General,
  Business,
  Technology,
  Entertainment,
  Sports,
  Science,
  Health;

  String toName(Categories cat) {
    switch (cat) {
      case Categories.General:
        return 'general';
      case Categories.Business:
        return 'business';
      case Categories.Technology:
        return 'technology';
      case Categories.Entertainment:
        return 'entertainment';
      case Categories.Sports:
        return 'sports';
      case Categories.Science:
        return 'science';
      case Categories.Health:
        return 'health';
    }
  }
}
