import 'package:flutter/material.dart';

class CustomListBuilder extends StatelessWidget
{
  const CustomListBuilder({
    super.key,

    required this.listItemBuilder,
    required this.listseparatorBuilder,
    required this.listItemCount,
    
    this.listPadding
  });

  final Widget? Function(BuildContext, int) listItemBuilder;
  final Widget Function(BuildContext, int) listseparatorBuilder;
  final int listItemCount;
  final EdgeInsetsGeometry? listPadding;

  @override
  Widget build(BuildContext context)
  {
    return ListView.separated(
      itemBuilder: listItemBuilder,
      separatorBuilder: listseparatorBuilder,
      itemCount: listItemCount,
      padding: EdgeInsets.zero,
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}