import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeOpenSansBlack90099 =>
      theme.textTheme.bodyLarge!.openSans.copyWith(
        color: appTheme.black90099,
        fontSize: 16.fSize,
      );
  static get bodyLargeOpenSansOnPrimary =>
      theme.textTheme.bodyLarge!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeOpenSansOnPrimary16 =>
      theme.textTheme.bodyLarge!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
      );
  static get bodyLargeOpenSansOnPrimaryLight =>
      theme.textTheme.bodyLarge!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargePavanam => theme.textTheme.bodyLarge!.pavanam.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumInterBluegray400 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blueGray400,
        fontSize: 15.fSize,
      );
  static get bodyMediumJudson => theme.textTheme.bodyMedium!.judson.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryLight => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumOnPrimaryLight_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPavanam => theme.textTheme.bodyMedium!.pavanam.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumPavanamff000000 =>
      theme.textTheme.bodyMedium!.pavanam.copyWith(
        color: Color(0XFF000000),
        fontSize: 15.fSize,
      );
  static get bodyMediumRoboto => theme.textTheme.bodyMedium!.roboto.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumff262626 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF262626),
      );
  static get bodyMediumff262626Light => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF262626),
        fontWeight: FontWeight.w300,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 11.fSize,
      );
  static get bodySmallOpenSansOnPrimary =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 11.fSize,
      );
  static get bodySmallOpenSansOnPrimary_1 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmallOpenSansOnPrimary_2 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmallOpenSansff05386b =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: Color(0XFF05386B),
      );
  static get bodySmallOpenSansff262626 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: Color(0XFF262626),
      );
  // Display text style
  static get displayMediumMontserratWhiteA70001 =>
      theme.textTheme.displayMedium!.montserrat.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 40.fSize,
        fontWeight: FontWeight.w900,
      );
  static get displayMediumWhiteA70001 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 46.fSize,
        fontWeight: FontWeight.w900,
      );
  // Headline text style
  static get headlineLargeGray600 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallBlack90005 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90005,
        fontSize: 25.fSize,
      );
  static get headlineSmallRoboto => theme.textTheme.headlineSmall!.roboto;
  static get headlineSmallRobotoBlack90005 =>
      theme.textTheme.headlineSmall!.roboto.copyWith(
        color: appTheme.black90005,
      );
  // Label text style
  static get labelLargeBlack90005 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90005,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeGray100 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray100,
        fontSize: 12.fSize,
      );
  static get labelLargeOpenSansBlack90005 =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.black90005,
      );
  static get labelLargeRobotoBlack90005 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.black90005,
        fontSize: 12.fSize,
      );
  // Lato text style
  static get latoWhiteA70001 => TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w900,
      ).lato;
  // Title text style
  static get titleLargeBlack90005 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90005,
      );
  static get titleLargeBlack90005Bold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90005,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBlack90005_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90005,
      );
  static get titleLargeInterBlack90005 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.black90005,
      );
  static get titleLargeInterBluegray400 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.blueGray400,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRobotoBlack90005 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.black90005,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeRobotoBlack90005Bold =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.black90005,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRobotoBlack90005Bold_1 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.black90005,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRobotoWhiteA70001 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack90005 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90005,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack90005Bold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90005,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack90005Bold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90005,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack90005_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90005,
      );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
      );
  static get titleMediumGreen900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green900,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGreen900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green900,
      );
  static get titleMediumLato => theme.textTheme.titleMedium!.lato.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLatoGray50003 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.gray50003,
        fontWeight: FontWeight.w900,
      );
  static get titleMediumMontserrat =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRobotoBlack90005 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.black90005,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRobotoBlack90005Medium =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.black90005,
        fontWeight: FontWeight.w500,
      );
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallLato => theme.textTheme.titleSmall!.lato.copyWith(
        fontWeight: FontWeight.w900,
      );
  static get titleSmallLatoOrange500 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.orange500,
        fontWeight: FontWeight.w900,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOpenSansOnPrimary =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallRoboto => theme.textTheme.titleSmall!.roboto;
  static get titleSmallRobotoMedium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoSemiBold =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoWhiteA70001 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get pavanam {
    return copyWith(
      fontFamily: 'Pavanam',
    );
  }

  TextStyle get judson {
    return copyWith(
      fontFamily: 'Judson',
    );
  }
}
