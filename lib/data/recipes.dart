class Recipes {
  static final List<Map<String, dynamic>> listRecipes = [
    {
      'id': '1',
      'nama': 'Nasi Goreng',
      'deskripsi':
          'Nasi goreng sehat menggabungkan keseimbangan nutrisi dengan cita rasa yang khas, menjadikannya pilihan makanan yang cocok untuk diet seimbang dan gaya hidup aktif.',
      'levelKesulitan': 'Mudah',
      'durasiMasak': '30',
      'bahan': ['nasi', 'bawang merah', 'bawang putih', 'telur', 'kecap'],
      'alat': ['wajan', 'sendok', 'kompor'],
      'stepMasak': [
        'Goreng bawang merah dan bawang putih hingga harum.',
        'Masukkan telur dan aduk hingga matang.',
        'Tambahkan nasi dan kecap, aduk rata.',
        'Masak hingga nasi terasa kering dan harum.',
      ],
      'namaFoto': 'bubur-sup-daging-kacang-merah.jpg',
    },
    {
      'id': '2',
      'nama': 'Pisang Goreng',
      'deskripsi':
          'Sate ayam adalah hidangan Asia Tenggara yang terdiri dari potongan daging ayam yang ditusuk dengan tusuk sate bambu dan dipanggang atau dibakar.',
      'levelKesulitan': 'Sulit',
      'durasiMasak': '45',
      'bahan': [
        'ayam',
        'bawang merah',
        'bawang putih',
        'kacang tanah',
        'kecap manis'
      ],
      'alat': ['tusuk sate', 'wajan', 'kompor'],
      'stepMasak': [
        'Haluskan bawang merah, bawang putih, dan kacang tanah.',
        'Potong ayam menjadi potongan kecil.',
        'Tusukkan ayam ke tusuk sate.',
        'Bakar sate hingga matang sambil diolesi dengan kecap manis.',
      ],
      'namaFoto': 'nasi-ikan-bumbu-kuning.jpg',
    },
  ];
  static final Map<String, dynamic> listRecipeChoosed = {};
}
