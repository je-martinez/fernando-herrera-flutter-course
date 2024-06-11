import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter',
    subtitle: 'Contador Basico',
    link: '/counter',
    icon: Icons.calculate,
  ),
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.card_giftcard,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y Controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y Dialogs',
    subtitle: 'Indicadores en la pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Serie de controles en Flutters',
    link: '/ui',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Tutorial',
    subtitle: 'App Tutorial',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subtitle: 'Scroll infinito en Flutter',
    link: '/infinite',
    icon: Icons.arrow_downward,
  ),
  MenuItem(
    title: 'Theme Changer',
    subtitle: 'Cambiar Temas',
    link: '/theme-changer',
    icon: Icons.color_lens_sharp,
  ),
];
