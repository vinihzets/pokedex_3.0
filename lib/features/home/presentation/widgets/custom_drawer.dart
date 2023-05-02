import 'package:flutter/material.dart';
import 'package:pokedex_3/features/home/presentation/widgets/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.1,
              child: Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/4b14c981-e3c8-4be0-89fd-ee3e41ce84b1/d9rc284-605c99d0-4da6-4054-ad5a-34547bf3cd8a.png',
              ),
            ),
            Column(
              children: [
                const Text(
                  'Pokemon',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                DrawerTile(
                    icon: Icons.house_outlined,
                    onPressed: () {},
                    title: 'home'),
                DrawerTile(
                    icon: Icons.star_border_outlined,
                    onPressed: () {},
                    title: 'favoritos')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
