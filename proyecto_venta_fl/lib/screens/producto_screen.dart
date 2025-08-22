import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoScreen extends ConsumerStatefulWidget {

  
  const ProductoScreen({super.key});

  @override
 _ProductoScreenState createState() => _ProductoScreenState();
}

class _ProductoScreenState extends ConsumerState<ProductoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Text(widget.),
    );
  }
}