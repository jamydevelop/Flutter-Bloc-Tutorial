import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/whishlist/bloc/whishlist_bloc.dart';
import 'package:flutter_bloc_tutorial/features/whishlist/ui/whishlist_tile_widget.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  final WhishlistBloc whishListBloc = WhishlistBloc();

  @override
  void initState() {
    whishListBloc.add(WhishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Whish List Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<WhishlistBloc, WhishlistState>(
        bloc: whishListBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WhishlistActionState,
        buildWhen: (previous, current) => current is! WhishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (WishlistSuccessSate):
              final successState = state as WishlistSuccessSate;
              return ListView.builder(
                  itemCount: successState.whishListItems.length,
                  itemBuilder: (context, index) {
                    return WhishlistTileWidget(
                      whishListBloc: whishListBloc,
                      productDataModel: successState.whishListItems[index],
                    );
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
