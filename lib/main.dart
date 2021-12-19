import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Resep Makanan Indonesia"),
        ),
        body: _PageList());
  }
}
//class
class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Soto Padang",
    "Bubur Manado",
    "Sup Konro",
    "Pempek Palembang",
    "Batagor"
  ];

  List<String> subjudul = [
    "Soto Padang adalah hidangan berkuah kaldu sapi dengan bahan irisan daging sapi yang sudah digoreng kering, bihun, ditambah perkedel kentang dan dihidangkan panas-panas",
    "Bubur Manado adalah makanan khas Indonesia dari Manado, Sulawesi Utara. Ada juga yang mengatakan tinutuan adalah makanan khas Minahasa, Sulawesi Utara",
    "Sup Konro adalah masakan sup iga sapi khas Indonesia yang berasal dari tradisi Bugis dan Makassar",
    "Pempek atau empek-empek adalah makanan yang terbuat dari daging ikan yang digiling lembut yang dicampur tepung kanji atau tepung sagu, serta komposisi beberapa bahan lain seperti telur, bawang putih yang dihaluskan, penyedap rasa, dan garam",
    "Batagor merupakan jajanan khas Bandung yang mengadaptasi gaya Tionghoa-Indonesia dan kini sudah dikenal hampir di seluruh wilayah Indonesia"
  ];

  List<String> gambar = [
    "images/soto padang.jpg",
    "images/bubur manado.jpg",
    "images/sup konro.jpg",
    "images/pempek palembang.jpg",
    "images/batagor.jpg"
  ];

  List<String> resep = [
    "Beli Soto padang di Warung terdekat, siap dihidangkan",
    "beli bubur di warung terdekat, bubur siap dihidangkan",
    "Belilah sop konro di warung khas makassar, sop konro siap dihidangkan",
    "Beli pempek di tempat terdekatmu atau warung langgananmu, Pempek siap dihidangkan",
    "Beli batagor di abang siomay kang bandung ,jangan lupa beli paket lengkap, batagor siap dihidangkan"
  ];

  List<String> sampel = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext contex, int index) {
          final title = judul[index].toString();
          final subTitle = subjudul[index].toString();
          final img = gambar[index].toString();
          final sample = sampel[index].toString();
          final resepmakanan = resep[index].toString();
          return Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                    child: topContent(title, subTitle, sample),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                          itemJudul: title,
                          itemImage: img,
                          itemSub: subTitle,
                          qty: resepmakanan,
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}

backgroundImage(String gambar) {
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}

topContent(String nama, String deskripsi, String sample) {
  return new Container(
    height: 150,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderText,
          ),
          Container(
            height: 1,
            width: 100,
            color: Colors.orangeAccent,
          ),
          Text(
            deskripsi,
            style: descHeaderText,
          ),

          Text(
            sample,
            style: footerHeaderText,
          )
        ],
      ),
    ),
  );
}

final baseTextStyle = const TextStyle( fontFamily: 'arial');

final bigHeaderText =
baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

final descHeaderText =
baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);

final footerHeaderText =
baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

final detailstyle =
baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
