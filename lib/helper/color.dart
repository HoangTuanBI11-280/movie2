import 'package:flutter/material.dart';

class GradientStyles {
  static BoxDecoration colorThemeGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF051c32),
          Color(0xFF002a4c),
          Color(0xFF003b66),
          Color(0xFF004e8b),
          //////////////////////
          Color(0xFF005fa9),
          /////////////////////
          Color(0xFF004e8b),
          Color(0xFF003b66),
          Color(0xFF002a4c),
          Color(0xFF051c32),
        ],
      ),
    );
  }

  static BoxDecoration colorContainerGradient({double borderRadius = 10}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFF0d1b2a),
          Color(0xFF1b263b),
          Color(0xFF415a77),
          Color(0xFF778da9),
          //////////////////////
          Color(0xFFBCCACF),
          /////////////////////
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorCrescentGradient({double borderRadius = 20}) {
    return BoxDecoration(
      gradient: RadialGradient(
        center: Alignment.center,
        radius: 1.5,
        colors: [
          Color(0xFF000000),
          Color(0xFF000000),
          Colors.transparent,
          Color(0xFFFFCC33),
          Colors.transparent,
          Color(0xFF000000),
        ],
        stops: [0.0, 0.4, 0.6, 0.7, 0.85, 1.0],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorItemGradient({double borderRadius = 20}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFb69f66),
          Color(0xFFd5ba6d),
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorbuttomitemGradient({required BuildContext context}) {
  return BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xFFbdbcbf),
        /////////////////////
        Color(0xFFbdbcbf),
        Color(0xFFd3d3d5),
        Color(0xFFdededf),
        Color(0xFFe9e9ea),
        Color(0xFFf4f4f4),
        Color(0xFFffffff),
      ],
    ),
    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.015),
  );
}

  static BoxDecoration colorProfileGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFF670000),
          Color(0xFF740000),
          Color(0xFF800000),
          Color(0xFF8d0000),
          Color(0xFF9a0000),
        ],
      ),
    );
  }

  static BoxDecoration colorTextGradient({double borderRadius = 8}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFF937416),
          Color(0xFFB29433),
          Color(0xFFDAC471),
          Color(0xFFFFFDB8),
          Color(0xFFE2BF4E),
          Color(0xFFCBA135),
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorLineGradient() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFb57e10),
          Color(0xFFf9df70),
          Color(0xFFf9df70),
          Color(0xFFb57e10),
          Color(0xFF800000),
        ],
      ),
    );
  }

  static BoxDecoration colorLine1Gradient() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFFb57e10),
          Color(0xFFf9df70),
          Color(0xFFf9df70),
          Color(0xFFb57e10),
          Color(0xFF670000),
        ],
      ),
    );
  }

  static BoxDecoration colorMovieGradient({double borderRadius = 8}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFa8a9ad),
          Color(0xFFb5b7bb),
          Color(0xFFcccccc),
          Color(0xFFd8d8d8),
          Color(0xFF757575),
          Color(0xFFafb1ae),
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorButtomGradient({double borderRadius = 10}) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFFF0000),
          Color(0xFFFF3636),
          Color(0xFFFF3636),
          Color(0xFFFF6465),
          Color(0xFFFF7A7A),
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration colorSideGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF003F60),
          Color(0xFF01627B),
          Color(0xFF00838D),
          Color(0xFF3BA699),
          Color(0xFF78C59B),
          Color(0xFFBAE5A0),
          Color(0xFFFFFFAC),
        ],
      ),
    );
  }

  static BoxDecoration colorMenuGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF000008),
          Color(0xFF08142C),
          Color(0xFF173C4C),
          Color(0xFF326D6c),
          Color(0xFF568F7C),
          Color(0xFF85B094),
          Color(0xFFBED1BD),
        ],
      ),
    );
  }
}


