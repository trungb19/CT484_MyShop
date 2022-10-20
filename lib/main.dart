import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myshop/ui/products/product_grid_tile.dart';

import 'ui/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            // ColorScheme that can be used to configure color properties.
            // ColorScheme create a color from a MeterialColor swatch.
            colorScheme: ColorScheme.fromSwatch(
              // primarySwatch are used for key components such as FAB, buttons, active states.
              primarySwatch: Colors.purple,
              // copyWith to create a new object with the same properties as original, but with some of the values changed.
            ).copyWith(
              secondary: Colors.deepOrange,
            )),
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId),
                  //ProductManager().findById(productId),
                );
              },
            );
          }
          return null;
        },
      ),
    );
    //const SafeArea(
    //child: OrderScreen(),

    //child: CartScreen(),
    //child: UserProductsScreen(),
    //child: ProductsOverviewScreen(),
    /* 
          child: ProductDetailScreen(
            //color: Colors.green,
            ProductManager().items[3],
          ),
        )*/
  }
}
