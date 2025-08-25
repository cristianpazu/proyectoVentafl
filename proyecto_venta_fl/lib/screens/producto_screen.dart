import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/notifiers/producto_state_notifier.dart';

class ProductoScreen extends ConsumerWidget {
final String productoId;

  const ProductoScreen({super.key, required this.productoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

final productoState = ref.watch(productoProvider(productoId));

    return Container(
      child: Text('asddddd'),
    );
  }
}