import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_cached_network_image.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleCachedImageNetworkScreen extends StatefulWidget {
  const SampleCachedImageNetworkScreen({Key? key}) : super(key: key);

  @override
  _SampleCachedImageNetworkScreenState createState() =>
      _SampleCachedImageNetworkScreenState();
}

class _SampleCachedImageNetworkScreenState
    extends State<SampleCachedImageNetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Cached Network Images'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber.shade100,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 8.0),
          children: [
            const SizedBox(height: 20.0),

            /// image without rounded corner
            const SkywaText('Image without Rounded Corner'),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SkywaCachedNetworkImage(
                imageUrl:
                    'https://i.ytimg.com/vi/2RPD2CbqGts/maxresdefault.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20.0),

            /// image with cliprrect
            const SkywaText('Image with ClipRRect BorderRadius 12.0'),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SkywaCachedNetworkImage.clipRRect(
                imageUrl:
                    'https://images.pexels.com/photos/258109/pexels-photo-258109.jpeg?cs=srgb&dl=pexels-pixabay-258109.jpg&fm=jpg',
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),

            /// error widget
            const SkywaText('Error Widget'),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SkywaCachedNetworkImage.clipRRect(
                imageUrl: 'abcd',
                height: 100.0,
                width: 130.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20.0),

            /// image with cliprrect
            const SkywaText('Image with ClipRRect'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SkywaCachedNetworkImage.clipRRect(
                      imageUrl:
                          'https://images.unsplash.com/photo-1597655601841-214a4cfe8b2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bW91bnRhaW4lMjBzY2VuZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                      height: 120.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SkywaCachedNetworkImage.clipRRect(
                      imageUrl:
                          'https://www.jiomart.com/images/product/original/rvjgutuphu/hanish-arts-crafts-scenery-handmade-wall-painting-size-18-x-24-product-images-orvjgutuphu-p590814625-0-202110082007.jpg',
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            /// image with circle avatar e.g. profile picture
            const SkywaText('Image with CircleAvatar e.g. Profile Picture'),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SkywaCachedNetworkImage.circleAvatar(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnS1o3mO3S_Nkfw1WAGaRJ6KaOGgODpfoOsA&usqp=CAU',
                height: 130.0,
                width: 130.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
