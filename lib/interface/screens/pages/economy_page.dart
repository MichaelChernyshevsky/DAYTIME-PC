import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/common/create_spending_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/widget/spending_widget.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/manager/economy_bloc/economy_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_spotify_ui/manager/get.it/app_provider.dart';
import 'package:flutter_spotify_ui/models/class/economy_class.dart';
import 'package:flutter_spotify_ui/models/class/sort_parametrs_class.dart';
import 'package:flutter_spotify_ui/models/enum/history_sort_state.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EconomyPage extends StatefulWidget {
  const EconomyPage({super.key});

  @override
  State<EconomyPage> createState() => _EconomyPageState();
}

class _EconomyPageState extends State<EconomyPage> {
  final List<SortParametrs> sortParametrs =
      GetIt.I.get<AppProvider>().sortParametrs;

  Enum pageState = EconomySortState.all;
  List<EconomyElement> elements = [];
  bool loading = true;
  EconomyBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    bloc!.add(GetEconomyEvent());
    super.initState();
  }

  void setNewState({required EconomySortState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }
  }

  Color getCurrentButtonColor({required EconomySortState state}) {
    if (state == pageState) {
      return UTILSConstants.purple;
    }
    return UTILSConstants.grey;
  }

  Future goToCreate() async {
    final element = await Navigator.push(
      context,
      MaterialPageRoute(builder: CreateSpedingScreen.builder),
    );

    if (element != null) {
      setState(
        () => elements.add(element),
      );
    }
  }

  void onError() => debugPrint(AppLocalizations.current.errorLoading);

  void setElements(List<EconomyElement> elementsBloc) => setState(() {
        elements = elementsBloc;
        loading = false;
      });

  @override
  void dispose() {
    bloc!.add(DisposeEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  color: UTILSConstants.black,
                  widget: const Row(),
                ),
                CustomButton(
                  color: UTILSConstants.white,
                  text: AppLocalizations.current.add,
                  tap: goToCreate,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.74,
            child: BlocListener<EconomyBloc, EconomyBlocState>(
              listener: (context, state) {
                if (state is BlocError) {
                  onError();
                } else if (state is GetHistorySuccess) {
                  setElements(state.elements);
                } else if (state is Delete) {
                  if (state.isDeleted) {
                    bloc!.add(GetEconomyEvent());
                  }
                }
              },
              child: ListView.builder(
                padding: getPadding(all: 0),
                itemCount: elements.length,
                itemBuilder: (context, index) {
                  return SpendingWidget(element: elements[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
