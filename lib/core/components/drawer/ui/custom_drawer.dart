import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/drawer/bloc/drawer_bloc.dart';
import 'package:pokedex_3/core/components/drawer/bloc/drawer_event.dart';
import 'package:pokedex_3/core/utils/consts.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late DrawerBloc bloc;
  late ConstsRoutes routes;

  @override
  void initState() {
    bloc = GetIt.I.get();
    routes = GetIt.I.get();
    super.initState();
  }

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
                    onPressed: () => bloc.dispatchEvent(
                        DrawerEventNavigate(context, routes.homeView)),
                    title: 'home'),
                DrawerTile(
                    icon: Icons.star_border_outlined,
                    onPressed: () => bloc.dispatchEvent(
                        DrawerEventNavigate(context, routes.favoriteView)),
                    title: 'favoritos'),
                DrawerTile(
                    icon: Icons.shopping_bag_outlined,
                    onPressed: () => bloc.dispatchEvent(
                        DrawerEventNavigate(context, routes.inventoryView)),
                    title: 'Inventario'),
                DrawerTile(
                    icon: Icons.abc_sharp,
                    onPressed: () => bloc.dispatchEvent(DrawerEventNavigate(
                        context, routes.aleatoryPokemonView)),
                    title: 'Pokemon Aleatorio')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
