import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:flutter/material.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Stack(
        // Menggunakan Stack untuk menempatkan ikon close di atas konten
        children: [
          Container(
            height: 326,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: BoxDecoration(
              color: lightBackgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do more with us',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 13),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    HomeServiceItem(
                      iconUrl: 'assets/ic_data.png',
                      title: 'Data',
                      onTap: () {
                        Navigator.pushNamed(context, '/data-provider');
                      },
                    ),
                    HomeServiceItem(
                      iconUrl: 'assets/ic_water.png',
                      title: 'Water',
                      onTap: () {},
                    ),
                    HomeServiceItem(
                      iconUrl: 'assets/ic_stream.png',
                      title: 'Stream',
                      onTap: () {},
                    ),
                    HomeServiceItem(
                      iconUrl: 'assets/ic_movie.png',
                      title: 'Movie',
                      onTap: () {},
                    ),
                    HomeServiceItem(
                      iconUrl: 'assets/ic_food.png',
                      title: 'Food',
                      onTap: () {},
                    ),
                    HomeServiceItem(
                      iconUrl: 'assets/ic_travel.png',
                      title: 'Travel',
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              // Menangani klik pada ikon close
              onTap: () {
                Navigator.of(context)
                    .pop(); // Menutup dialog saat ikon close ditekan
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBackgroundColor.withOpacity(
                      0.3), // Memberikan latar belakang transparan untuk ikon close
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black, // Ikon close berwarna hitam
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
