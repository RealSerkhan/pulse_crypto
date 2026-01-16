/// Sort options for market data
enum SortOption {
  priceAscending,
  priceDescending,
  changeAscending,
  changeDescending;

  String get label {
    switch (this) {
      case SortOption.priceAscending:
        return 'Price: Low to High';
      case SortOption.priceDescending:
        return 'Price: High to Low';
      case SortOption.changeAscending:
        return 'Change: Low to High';
      case SortOption.changeDescending:
        return 'Change: High to Low';
    }
  }

  String get value {
    switch (this) {
      case SortOption.priceAscending:
        return 'price_asc';
      case SortOption.priceDescending:
        return 'price_desc';
      case SortOption.changeAscending:
        return 'change_asc';
      case SortOption.changeDescending:
        return 'change_desc';
    }
  }

  static SortOption? fromValue(String value) {
    switch (value) {
      case 'price_asc':
        return SortOption.priceAscending;
      case 'price_desc':
        return SortOption.priceDescending;
      case 'change_asc':
        return SortOption.changeAscending;
      case 'change_desc':
        return SortOption.changeDescending;
      default:
        return null;
    }
  }
}
