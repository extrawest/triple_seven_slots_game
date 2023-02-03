import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:triple_seven_slots_game/assets.dart';

class Precaching {
  Future<bool> loadGraphics(BuildContext context) async {
    await _precacheImages(context);
    await _loadComposition();
    return true;
  }

  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(Image.asset(wheelBorder).image, context),
      precacheImage(Image.asset(spinningPointer).image, context),
      precacheImage(Image.asset(star).image, context),
      precacheImage(Image.asset(wheelTitleIc).image, context),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, boardIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, playButton), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowLeftIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowRightIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, seventhIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, appleIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, barIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, lemonIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, coinIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, watermelonIc), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, crownIc), null),
    ]);
  }

  Future<void> _loadComposition() async {
    await Future.wait([
      AssetLottie(confettiLottie).load(),
      AssetLottie(goldenConfettiLottie).load(),
      AssetLottie(coinsLottie).load(),
    ]);
  }
}
