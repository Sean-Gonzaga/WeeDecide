class Weed {
  final String weedName;
  final String localName;
  final String description;
  final String image;

  Weed({
    required this.weedName,
    required this.localName,
    required this.description,
    required this.image,
  });
}

List<Weed> weedList = [
  Weed(
      weedName: 'Ageratum conyzoides',
      localName: 'BIllygoat Weed, Pega-Pega',
      description:
          'Ageratum conyzoides (billygoat-weed, chick weed, goatweed, whiteweed, mentrasto) is native to Tropical America, especially Brazil, and is an invasive weed in many other regions. It is an herb that is 0.5–1 m. high, with ovate leaves 2–6 cm long, and flowers are white to mauve.',
      image: 'images/weeds/Ageratum_conyzoides.jpg'),
  Weed(
      weedName: 'Cyanthillium cinereum',
      localName: 'Little Ironweed',
      description:
          'Cyanthillium cinereum is a species of perennial plants in the sunflower family. The species is native to tropical Africa and to tropical Asia and has become naturalized in Australia, Mesoamerica, tropical South America, the West Indies, and the US State of Florida.',
      image: 'images/weeds/Cyanthillium_cinereum.jpg'),
  Weed(
      weedName: 'Echinochloa crus-galli',
      localName: 'Cockspur grass',
      description:
          'Echinochloa crus-galli is a type of wild grass originating from tropical Asia that was formerly classified as a type of panicum grass. It is commonly known as cockspur, barnyard millet, Japanese millet, water grass, common barnyard grass, or simply "barnyard grass".',
      image: 'images/weeds/echinochloa_crus-galli.jpg'),
  Weed(
      weedName: 'Leptochloa chinensis',
      localName: 'Talisay',
      description:
          'Leptochloa chinensis, commonly known as red sprangletop, Asian sprangletop, or Chinese sprangletop, is a species of grass in the family Poaceae. It is a serious weed of rice. It is native to regions of Africa, Asia, and Oceania.',
      image: 'images/weeds/Leptochloa_chinensis.jpg'),
  Weed(
      weedName: 'Cyperus haspan',
      localName: 'tikod-amakan',
      description:
          'Cyperus haspan is a dwarf papyrus sedge in the Cyperaceae. It is widely distributed in tropical and subtropical regions in Africa, Madagascar, southern Asia, New Guinea, Australia, South America, West Indies, Central America, southern Mexico and the southeastern United States',
      image: 'images/weeds/Cyperus_haspan.jpg'),
];
