import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/models/singleton/user_details_singleton.dart';
import 'package:flutter_exam/screens/home/bloc/home_bloc.dart';

class HomeUserHeader extends StatelessWidget {
  const HomeUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showBottomModal(context);
          },
          child: CircleAvatar(
            radius: 30,
            child: CachedNetworkImage(
              imageUrl: CurrentUser().profilePicture,
              placeholder: (context, url) => Center(
                child: Theme(
                    data: ThemeData(platform: TargetPlatform.iOS),
                    child: const CircularProgressIndicator.adaptive()),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CurrentUser().userName,
              style: TextStyle(fontSize: 17),
            ),
            Text(
              CurrentUser().userId,
              style: TextStyle(fontSize: 17),
            ),
          ],
        )
      ],
    );
  }

  Future<dynamic> showBottomModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white)),
                    onPressed: () async {
                      Navigator.pop(context);
                      context.read<HomeBloc>().add(Logout());
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white)),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
