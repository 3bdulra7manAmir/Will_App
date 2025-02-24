import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_app/Config/extension/i18n_extension.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_cubit.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_states.dart';
import 'package:will_app/Core/widgets/custom_error_widget.dart';
import 'package:will_app/Core/widgets/custom_loading_indicator.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('title'.getTranslation)),
      body: Center(
        child: BlocBuilder<LocalizationCubit, LocalizationStates>(
          builder: (context, state)
          {
            if (state is LocalizationLoadingState)
            {
              return const CustomLoadingIndicator();
            }

            else if (state is LocalizationSuccessState)
            {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text('title'.getTranslation),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: ()
                    {
                      final localizationCubit = context.read<LocalizationCubit>();
                      String newLang = localizationCubit.state is LocalizationSuccessState &&
                      (localizationCubit.state as LocalizationSuccessState).locale.languageCode == 'en' ? 'ar' : 'en';
                      localizationCubit.changeLocale(newLang);
                    },
                    child: const Text("Switch Language"),
                  ),
                ],
              );
            }

            else if (state is LocalizationFailureState)
            {
              return CustomErrorWidget(errorMessage: state.errorMessage);
            }

            else
            {
              return const CustomErrorWidget(errorMessage: 'Unknown Error');
            }

          },
        ),
      ),
    );
  }
}
