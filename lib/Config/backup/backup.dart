import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_app/Config/extension/i18n_extension.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_cubit.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_states.dart';
import 'package:will_app/Core/widgets/custom_error_widget.dart';
import 'package:will_app/Core/widgets/custom_loading_indicator.dart';

class TestView extends StatelessWidget
{
  const TestView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LocalizationCubit, LocalizationStates>(
      builder: (context, state)
      {
        
        if (state is LocalizationLoadingState)
            {
              return const Scaffold(body: CustomLoadingIndicator());
            } 

            else if (state is LocalizationSuccessState)
            {
              return Scaffold(
                appBar: AppBar(title: Text('title'.getTranslation)),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('title'.getTranslation),
                  
                      const SizedBox(height: 20),
                  
                      ElevatedButton(
                        onPressed: ()
                        {
                          final localizationCubit = context.read<LocalizationCubit>();
                          String newLang = state.locale.languageCode == 'en' ? 'ar' : 'en';
                          localizationCubit.changeLocale(newLang);
                        },
                        child: Text('switch_language'.getTranslation),
                      ),
                    ],
                  ),
                ),
              );
            } 

            else if (state is LocalizationFailureState)
            {
              return Scaffold(body: CustomErrorWidget(errorMessage: state.errorMessage));
            } 

            else
            {
              return const Scaffold(body: CustomErrorWidget(errorMessage: 'Unknown Error'));
            }
      },
    );
  }
}
