import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherSocialPage extends StatelessWidget {
  const OtherSocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OtherSocial();
  }
}

class OtherSocial extends StatefulWidget {
  const OtherSocial({super.key});

  @override
  State<OtherSocial> createState() => _OtherSocialState();
}

class _OtherSocialState extends State<OtherSocial> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
          title: Text(
            "Other",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("You might also like"),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemCount: otherSocials.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: 300,
                color: Colors.white,
                child: Image.asset(otherSocials[itemIndex].iconUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                otherSocials[_currentIndex].name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  )),
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber)),
              onPressed: () async {
                if (await canLaunchUrl(
                    Uri.parse(otherSocials[_currentIndex].webUrl))) {
                  await launchUrl(Uri.parse(otherSocials[_currentIndex].webUrl),
                      mode: LaunchMode.externalApplication);
                }
              },
              child: Text("Visit ${otherSocials[_currentIndex].name} Website"),
            ),
          ],
        ));
  }
}
