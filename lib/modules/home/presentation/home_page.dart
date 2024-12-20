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
  late final HomeCubit cubit;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<HomeCubit>();
    cubit.getLocations();
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
          'Distritos',
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
          return state.districtEntity != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: SizedBox(
                    height: size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.districtEntity!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: InkWell(
                                  onTap: (){},
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DSBase.typography.h1.draw(
                                            'Município: ${state.districtEntity![index].municipio.nome}',
                                            color: DSColors.primary,
                                          ),
                                          DSBase.typography.h1.draw(
                                            'Estado: ${state.districtEntity![index].municipio.regiaoImediata.regiaoIntermediaria.uf.nome}',
                                            color: DSColors.primary,
                                          ),
                                          DSBase.typography.h1.draw(
                                            'Sigla: ${state.districtEntity![index].municipio.regiaoImediata.regiaoIntermediaria.uf.sigla}',
                                            color: DSColors.primary,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
    );
  }
}
