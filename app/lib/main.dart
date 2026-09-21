import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'data/providers.dart';
import 'screens/root_shell.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const ProviderScope(child: Projeto50App()));
}

class Projeto50App extends ConsumerWidget {
  const Projeto50App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seed = ref.watch(seedProvider);

    return MaterialApp(
      title: 'Projeto 50',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: seed.when(
        data: (_) => const RootShell(),
        loading: () => const _SplashScreen(),
        error: (e, st) => Scaffold(
          body: Center(child: Text('Erro ao iniciar o banco local:\n$e')),
        ),
      ),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PROJETO 50', style: AppTheme.display(Colors.grey).copyWith(fontSize: 28)),
      ),
    );
  }
}
