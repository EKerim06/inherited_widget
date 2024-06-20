import 'package:flutter/material.dart';
import 'package:inherited_widget/advanced_form_inherited.dart';
import 'package:inherited_widget/advanced_inherited_provider_mixin.dart';
import 'package:inherited_widget/empty_user_model.dart';

class AdvancedInherited extends InheritedWidget {
  const AdvancedInherited({
    required this.data,
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  final AdvancedInheritedProviderState data;

  /// Get current state of AdvancedInharitedState
  static AdvancedInheritedProviderState of(BuildContext context) {
    final AdvancedInherited? result =
        context.dependOnInheritedWidgetOfExactType<AdvancedInherited>();

    if (result == null) {
      throw Exception('Cloud not find InheritedWidget');
    } else {
      return result.data;
    }
  }
}

///Cloud

/// Bu class genel olarak degerleri tutar, saklar ve kullanmak istedigin diger UI islemlerini bununla sararsan widgetler arasinda bulunan
///  dependencylerden kurtulmus ve bu islemi temiz ve okunakli bir sekilde halletmis olursun :D 
class AdvancedInheritedProvider extends StatefulWidget {
  const AdvancedInheritedProvider({super.key, this.user});
  final EmptySampleInheritedUser? user;

  @override
  AdvancedInheritedProviderState createState() =>
      AdvancedInheritedProviderState();
}

class AdvancedInheritedProviderState extends State<AdvancedInheritedProvider> with AdvancedInheritedProviderMixin {
  @override
  Widget build(BuildContext context) {
    return AdvancedInherited(
      data: this,
      child: const AdvancedFormInherited(),
    );
  }

}
