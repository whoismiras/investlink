import 'package:flutter/material.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';
import 'package:polygon_crypto/domain/cubits/crypto_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/main_page.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Widget screen = const MainPage();
  runApp(PoligonCrypto(screen: screen));
}

class PoligonCrypto extends StatelessWidget {
  const PoligonCrypto({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CryptoCubit()..getCryptoData()),
      ],
      child: ChangeNotifierProvider(
        create: (context) {},
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: screen,
        ),
      ),
    );
  }
}
