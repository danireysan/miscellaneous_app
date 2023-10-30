import 'package:miscellaneous_app/config/router/app_router.dart';
import 'package:miscellaneous_app/presentation/screens.dart';
import 'package:miscellaneous_app/presentation/screens/biometrics/biometrics_screen.dart';
import 'package:quick_actions/quick_actions.dart';

import '../../presentation/screens/pokemon/pokemons_screen.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((shortcutType) {
      switch (shortcutType) {
        case 'biometric':
          router.push(BiometricsScreen.routeName);
          break;
        case 'compass':
          router.push(CompassScreen.routeName);
          break;
        case 'pokemon':
          router.push(PokemonsScreen.routeName);
          break;
        case 'charmander':
          router.push('${PokemonsScreen.routeName}/4');
          break;
        default:
      }
    });

    quickActions.setShortcutItems([
      const ShortcutItem(
          type: 'biometric', localizedTitle: 'Biometric', icon: 'finger'),
      const ShortcutItem(
          type: 'compass', localizedTitle: 'Compass', icon: 'compass'),
      const ShortcutItem(
          type: 'pokemon', localizedTitle: 'Pokemon', icon: 'pokemons'),
      const ShortcutItem(
          type: 'charmander', localizedTitle: 'Charmander', icon: 'charmander'),
    ]);
  }
}
