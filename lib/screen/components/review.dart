import 'package:flutter/material.dart';

import '../../constant.dart';

class review_user extends StatelessWidget {
  const review_user({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          review(
            detail:
                'Aplikasi ini sangat membantu sekali dalam mengatur perjalanan yang last minute karena sudah tersedia semua fiturnya',
            image: "assets/images/Ellipse.png",
            nama: 'Sebastian Arnold',
          ),
          review(
            detail:
                'Sangat mudah dalam membuat rencana perjalanan bagi orang yang belum pernah kelombok',
            image: "assets/images/Ellipse (4).png",
            nama: 'Harmony Gremore',
          ),
          review(
            detail:
                'Tempat-tempat nya seru banget pokoknya the best banget aplikasi ini',
            image: "assets/images/Ellipse (3).png",
            nama: 'Jessica Cika',
          ),
          review(
            detail:
                'Dengan menggunakan Booktrip perjalanan anda semakin mudah, nyaman, dan menyenangkan.',
            image: "assets/images/Ellipse (2).png",
            nama: 'Tita Titata',
          ),
          review(
            detail: 'Enak banget pake aplikasi ini fiturnya lengkap banget',
            image: "assets/images/Ellipse (1).png",
            nama: 'Arief Raup',
          ),
        ],
      ),
    );
  }
}

class review extends StatelessWidget {
  const review({
    Key? key,
    required this.image,
    required this.nama,
    required this.detail,
  }) : super(key: key);

  final String image, nama, detail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding),
      width: size.width * 0.8,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: Theme.of(context).primaryColor.withOpacity(0.25)),
                ],
              ),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(image),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                              color: kTextColor, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          detail,
                          style: TextStyle(
                              color: kTextColor, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
