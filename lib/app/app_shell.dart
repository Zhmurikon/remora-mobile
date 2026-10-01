import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme.dart';

/// Постоянная навигация между верхнеуровневыми разделами приложения.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: RemoraSizes.thinLine,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          minimum: const EdgeInsets.only(bottom: RemoraSpacing.xxs),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                // Повторный тап по активной вкладке возвращает её на корневой экран.
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Главная',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book_rounded),
                label: 'Курсы',
              ),
              NavigationDestination(
                icon: Icon(Icons.style_outlined),
                selectedIcon: Icon(Icons.style_rounded),
                label: 'Наборы',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search_rounded),
                label: 'Каталог',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings_rounded),
                label: 'Ещё',
                tooltip: 'Настройки',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
