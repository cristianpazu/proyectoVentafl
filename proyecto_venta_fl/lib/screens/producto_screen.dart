import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/notifiers/producto_state_notifier.dart';
import 'package:proyecto_venta_fl/widget/custom_product_field.dart';
import 'package:proyecto_venta_fl/widget/full_screen_loader.dart';

import '../notifiers/categoria_notifiers/categoria_state_notifier.dart';

class ProductoScreen extends ConsumerWidget {
final int productoId;

  const ProductoScreen({super.key, required this.productoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

final productoState = ref.watch(productoProvider(productoId));


print('prre ${productoState.producto}');
print('prre ${productoId}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
        actions: [
        ],
      ), 
      body: productoState.isLoading ?  FullScreenLoader() : _ProductView(product: productoState.producto!),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.save_as_outlined), 
        
        ),
    );
  }
}



class _ProductView extends StatelessWidget {

  final Productos product;

  const _ProductView({required this.product});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return ListView(
      children: [
    
        
          _ProductInformation( product: product ),
          
        ],
    );
  }
}


class _ProductInformation extends ConsumerWidget {
  final Productos  product;
  const _ProductInformation({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Generales'),
          const SizedBox(height: 15 ),
          CustomProductField( 
            isTopField: true,
            label: 'Nombre',
            initialValue: product.nombre ?? '',
          ),
          CustomProductField( 
            isTopField: true,
            label: 'Referencia',
            initialValue: product.referencia ?? '',
          ),
          CustomProductField( 
            isBottomField: true,
            label: 'Precio Venta',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: product.precioVenta.toString(),
          ),

          const SizedBox(height: 15 ),
          const Text('Extras'),

          MultiSelectCategorias(productoId: product.idProductos!,),
          const SizedBox(height: 5 ),
         // _GenderSelector( selectedGender: product.gender ),
          

          const SizedBox(height: 15 ),
          CustomProductField( 
            isTopField: true,
            label: 'Existencias',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: product.cantidadStock.toString(),
          ),
/*
          CustomProductField( 
            maxLines: 6,
            label: 'Descripción',
            keyboardType: TextInputType.multiline,
            initialValue: product.description,
          ),
          CustomProductField( 
            isBottomField: true,
            maxLines: 2,
            label: 'Tags (Separados por coma)',
            keyboardType: TextInputType.multiline,
            initialValue: product.tags.join(', '),
          ), */


          const SizedBox(height: 100 ),
        ],
      ),
    );
  }
}


class MultiSelectCategorias extends ConsumerWidget {
  final int productoId;

  const MultiSelectCategorias({required this.productoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriaState = ref.watch(categoriasProvider);
    final productoState = ref.watch(productoProvider(productoId));
    final producto = productoState.producto;

    if (producto == null) return const SizedBox();

    final categorias = categoriaState.categoria;

    if (categoriaState.isLoding) {
      return const CircularProgressIndicator();
    }

    return MultiSelectDialogField<Categoria>(
      items: categorias
          .map((categoria) =>
              MultiSelectItem<Categoria>(categoria, categoria.nombreCategoria ?? ''))
          .toList(),
      title: const Text("Seleccionar categorías"),
      buttonText: const Text("Categorías"),
      searchable: true,
      listType: MultiSelectListType.CHIP,
      initialValue: producto.categoria ?? [],
      onConfirm: (List<Categoria> seleccionadas) {
        ref
            .read(productoProvider(productoId).notifier)
            .updateCategorias(seleccionadas);
      },
      chipDisplay: MultiSelectChipDisplay(
        onTap: (categoria) {
          final nuevaLista = List<Categoria>.from(producto.categoria ?? [])
            ..remove(categoria);
          ref
              .read(productoProvider(productoId).notifier)
              .updateCategorias(nuevaLista);
        },
      ),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  final String selectedGender;
  final List<String> genders = const['men','women','kid'];
  final List<IconData> genderIcons = const[
    Icons.man,
    Icons.woman,
    Icons.boy,
  ];

  const _GenderSelector({required this.selectedGender});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton(
        multiSelectionEnabled: false,
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity.compact ),
        segments: genders.map((size) {
          return ButtonSegment(
            icon: Icon( genderIcons[ genders.indexOf(size) ] ),
            value: size, 
            label: Text(size, style: const TextStyle(fontSize: 12))
          );
        }).toList(), 
        selected: { selectedGender },
        onSelectionChanged: (newSelection) {
          print(newSelection);
        },
      ),
    );
  }
}


class _ImageGallery extends StatelessWidget {
  final List<String> images;
  const _ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(
        viewportFraction: 0.7
      ),
      children: images.isEmpty
        ? [ ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset('assets/images/no-image.jpg', fit: BoxFit.cover )) 
        ]
        : images.map((e){
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(e, fit: BoxFit.cover,),
          );
      }).toList(),
    );
  }
}