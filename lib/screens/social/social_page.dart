import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/core/router/args/social_args.dart';
import 'package:flutter_exam/models/social_model.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? null
        : ModalRoute.of(context)!.settings.arguments as SocialArgs;

    return SocialP(args: args);
  }
}

class SocialP extends StatefulWidget {
  const SocialP({super.key, this.args});
  final SocialArgs? args;

  @override
  State<SocialP> createState() => _SocialPState();
}

class _SocialPState extends State<SocialP> {
  late Social social;
  late MaterialColor color;
  bool showWebsite = false;

  // var controller = WebViewController();

  @override
  void initState() {
    if (widget.args != null) {
      social = widget.args!.social;
      color = widget.args!.color;

      // controller
      //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //   ..loadRequest(Uri.parse(social.webUrl));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: color,
        title: Text(
          social.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: showWebsite
          ? InAppWebView(
              initialSettings: social.webUrl.contains('facebook.com')
                  ? InAppWebViewSettings(
                      userAgent:
                          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
                    )
                  : null,
              initialUrlRequest: URLRequest(url: WebUri(social.webUrl)),
            )
          : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: social.imgUrl,
                  placeholder: (context, url) => Center(
                    child: Theme(
                        data: ThemeData(platform: TargetPlatform.iOS),
                        child: const CircularProgressIndicator.adaptive()),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(social.history),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: FilledButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                        backgroundColor: WidgetStatePropertyAll<Color>(color)),
                    onPressed: () {
                      setState(() {
                        showWebsite = true;
                      });
                    },
                    child: Text("Visit ${social.name}"),
                  ),
                )
              ],
            )),
    );
  }
}
