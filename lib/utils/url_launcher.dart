import 'package:url_launcher/url_launcher.dart';

Future<void> launchWithUrl(String url) async {
  await launchUrl(Uri.parse(url));
}
