enum Language { English, Myanmar, Chinese }

String toString(Language language) {
  switch (language) {
    case Language.English:
      return "English";
    case Language.Chinese:
      return "Chinese";
    case Language.Myanmar:
      return "Myanmar";
  }
}

