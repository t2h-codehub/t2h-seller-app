import 'package:flutter/material.dart';

class ImportFromInstagramScreen extends StatefulWidget {
  const ImportFromInstagramScreen({super.key});

  @override
  State<ImportFromInstagramScreen> createState() =>
      _ImportFromInstagramScreenState();
}

class _ImportFromInstagramScreenState extends State<ImportFromInstagramScreen> {

  List<Catalogue> catalogueItems = [
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
    Catalogue( postImageUrl: 'assets/images/catalogueimageone.png'),
  ];

  @override
  Widget build(BuildContext context) {
    // size of the screen
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.1;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xFFF0F1F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Import from Instagram',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: catalogueItems.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 0,
          childAspectRatio: 4/5,
          // childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                /// Catalogue Image
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(catalogueItems[index].postImageUrl, fit: BoxFit.fill,),
                ),

                /// Bottom Section
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Add to Catalogue',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


/// ---------- Catalogue Class ----------
class Catalogue {
  String postImageUrl;

  Catalogue({required this.postImageUrl});
}