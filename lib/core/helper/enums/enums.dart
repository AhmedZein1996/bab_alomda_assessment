enum SectionFilter {
  arts('arts'),
  automobiles('automobiles'),
  booksReview('books/review'),
  business('business'),
  fashion('fashion'),
  food('food'),
  health('health'),
  home('home'),
  insider('insider'),
  magazine('magazine'),
  movies('movies'),
  nyRegion('nyregion'),
  obituaries('obituaries'),
  opinion('opinion'),
  politics('politics'),
  realEstate('realestate'),
  science('science'),
  sports('sports'),
  sundayReview('sundayreview'),
  technology('technology'),
  theater('theater'),
  tMagazine('t-magazine'),
  travel('travel'),
  upshot('upshot'),
  us('us'),
  world('world');

  final String value;

  const SectionFilter(this.value);
}

enum StoryDisplayStatus { list, cards }

enum ImageFormat {
  superJumbo("Super Jumbo"),
  threeByTwoSmallAt2X("threeByTwoSmallAt2X"),
  largeThumbnail("Large Thumbnail");

  final String value;

  const ImageFormat(this.value);
}
