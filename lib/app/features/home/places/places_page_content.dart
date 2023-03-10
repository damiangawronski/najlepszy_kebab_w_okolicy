import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najlepszy_kebab_w_okolicy/app/features/home/places/cubit/places_cubit.dart';

class PlacesPageContent extends StatelessWidget {
  const PlacesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit()..start(),
      child: BlocBuilder<PlacesCubit, PlacesState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('cos poszło nie tak:${state.errorMessage}'));
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['kebab']),
                          Text(document['name']),
                        ],
                      ),
                      Text(document['rating'].toString()),
                    ],
                  ),
                )
              ],
            ],
          );
        },
      ),
    );
  }
}
