import 'package:flutter/material.dart';
import 'package:monetizze_test/modules/home/domain/entities/locations_entity.dart';

import '../../../design_system/design_system.dart';
import '../../../design_system/loading/ds_loading.dart';
import '../../../shared/utils/dependencies/dependencies_export.dart';
import '../details_export.dart';
import 'utils/details_municipalities_strings.dart';

class DetailsMunicipalitiesPage extends StatefulWidget {
  const DetailsMunicipalitiesPage({super.key, required this.districtEntity});
  final DistrictEntity? districtEntity;

  @override
  State<DetailsMunicipalitiesPage> createState() =>
      _DetailsMunicipalitiesPageState();
}

class _DetailsMunicipalitiesPageState extends State<DetailsMunicipalitiesPage> {
  late final DetailsMunicipalitiesCubit cubit;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<DetailsMunicipalitiesCubit>();
    cubit.setMunicipalities(widget.districtEntity);
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
          DetailsMunicipalitiesStrings.title,
          color: DSColors.white,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () => Modular.to.pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: DSColors.white,
            ),
          ),
        ),
      ),
      body:
          BlocConsumer<DetailsMunicipalitiesCubit, DetailsMunicipalitiesState>(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: DSColors.primary),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0,),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Center(
                                        child: DSBase.typography.h1.draw(
                                          state.districtEntity!.municipio.nome,
                                          color: DSColors.primary,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DSBase.typography.h2.draw(
                                        '${DetailsMunicipalitiesStrings.state}: ${state.districtEntity!.municipio.regiaoImediata.regiaoIntermediaria.uf.nome}',
                                        color: DSColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DSBase.typography.h2.draw(
                                        '${DetailsMunicipalitiesStrings.acronym}: ${state.districtEntity!.municipio.regiaoImediata.regiaoIntermediaria.uf.sigla}',
                                        color: DSColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DSBase.typography.h2.draw(
                                        '${DetailsMunicipalitiesStrings.code}: ${state.districtEntity!.municipio.id}',
                                        color: DSColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DSBase.typography.h2.draw(
                                        '${DetailsMunicipalitiesStrings.microregion}: ${state.districtEntity!.municipio.microrregiao.nome}',
                                        color: DSColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DSBase.typography.h2.draw(
                                        '${DetailsMunicipalitiesStrings.microregion}: ${state.districtEntity!.municipio.microrregiao.mesorregiao.nome}',
                                        color: DSColors.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
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
