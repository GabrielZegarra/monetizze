import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';
import '../../../design_system/loading/ds_loading.dart';
import '../../../shared/utils/constants/app_routes.dart';
import '../../../shared/utils/dependencies/dependencies_export.dart';
import 'cubit/home_cubit.dart';
import 'cubit/states/home_state.dart';
import 'utils/home_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late final HomeCubit cubit;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<HomeCubit>();
    cubit.getLocations();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent &&
          !cubit.state.isLoadingMore) {
        cubit.loadMore();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: DSColors.primary,
        centerTitle: true,
        title: DSBase.typography.h1.draw(
          HomeStrings.title,
          color: DSColors.white,
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.success) {}
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const DSLoading();
          }
          if (state.errorMessage.isNotEmpty) {
            return Center(child: Text(state.errorMessage));
          }
          return state.displayedEntities.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.9,
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: state.displayedEntities.length +
                                (state.isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index < state.displayedEntities.length) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      Modular.to.pushNamed(
                                        AppRoutes.details,
                                        arguments: state.displayedEntities[index],
                                      );
                                    },
                                    child: Container(
                                      width: size.width / 2,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: DSColors.primary),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(6),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: DSBase.typography.h1.draw(
                                                '${HomeStrings.title}: ${state.displayedEntities[index].municipio.nome}',
                                                color: DSColors.primary,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: DSBase.typography.h1.draw(
                                                '${HomeStrings.state}: ${state.displayedEntities[index].municipio.regiaoImediata.regiaoIntermediaria.uf.nome}',
                                                color: DSColors.primary,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: DSBase.typography.h1.draw(
                                                '${HomeStrings.acronym}: ${state.displayedEntities[index].municipio.regiaoImediata.regiaoIntermediaria.uf.sigla}',
                                                color: DSColors.primary,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: DSLoading(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: SizedBox(
                    height: size.height,
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text('vazio'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: _scrollController.hasClients && _scrollController.offset > 300
          ? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        backgroundColor: DSColors.primary,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      )
          : null,
    );
  }
}
