import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/core/widgets/app_bars/base_app_bar.dart';
import 'package:choice/choice.dart';
import 'package:pod_i_ya/features/event_catalog/presentation/components/filter_page/choose_price_widget.dart';
import 'package:pod_i_ya/features/event_catalog/presentation/components/filter_page/filter_line.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/tags_datasource.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  String fromDate = '';
  DateTime? fromDateTime;
  String toDate = '';
  DateTime? toDateTime;
  List<String> cities = [];

  final loverPriceController = TextEditingController();
  final upperPriceController = TextEditingController();

  List<String> tags = [];
  List<String> tagsSelected = [];

  String? city;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var cityData = CityDatasourceImpl();
    if(await cityData.getAllCity()){
      setState(() {
        cities = cityData.cities!;
      });
    }
    var tagsData = TagsDatasourceImpl();
    if(await tagsData.getAllTags()){
      setState(() {
        tags = tagsData.tags;
      });
    }
  }

  List<int> getTagsId(List<String> tags, List<String> tagsSelected){
    List<int> tagsId = [];
    for(int i = 0; i < tagsSelected.length; i++){
      if(tags.contains(tagsSelected[i])){
        tagsId.add(tags.indexOf(tagsSelected[i]) + 1);
      }
    }
    return tagsId;
  }



  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        fromDateTime = args.value.startDate;
        toDateTime = args.value.endDate ?? args.value.startDate;
        fromDate = DateFormat('dd/MM/yyyy').format(fromDateTime!);
        toDate = DateFormat('dd/MM/yyyy').format(toDateTime!);
      }
    });
  }

  String from(String date) {
    if (date.isEmpty) {
      return "Choose date".tr();
    }
    return date;
  }



  void setSingleSelected(String? value) {
    setState(() => city = value);
  }

  void setMultipleSelected(List<String> value) {
    setState(() => tagsSelected = value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: TextButton(onPressed: () { Navigator.of(context).pop({
        "tags" : getTagsId(tags, tagsSelected),
        "fromDate" : fromDateTime,
        "toDate" : toDateTime,
        "loverPrice" : double.parse(loverPriceController.text.isEmpty ? "-1" : loverPriceController.text),
        "upperPrice" : double.parse(upperPriceController.text.isEmpty ? "-1" : upperPriceController.text),
        "city": city,
      } as Map<String, dynamic>); }, child: Text("Approve".tr()),),

      appBar: BaseAppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leftWidget: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerWidget: Text(
          "Filters".tr(),
          style: const Font()
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(


          children: [


            Text(
              "Date".tr(),
              style: const Font()
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From".tr(),
                  style: const Font().copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.tertiaryContainer),
                  ),
                  onPressed: () {
                    buildShowDialog(context);
                  },
                  child: Text(
                    from(fromDate),
                    style: const Font().copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                ),
                Text(
                  "to".tr(),
                  style: const Font().copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.tertiaryContainer),
                  ),
                  onPressed: () {
                    buildShowDialog(context);
                  },
                  child: Text(
                    from(toDate),
                    style: const Font().copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                ),
              ],
            ),


            const FilterLine(),


            PromptedChoice<String>.single(
              searchable: true,
              title: "City".tr(),
              value: city,
              onChanged: setSingleSelected,
              itemCount: cities.length,
              itemBuilder: (state, i) {
                return RadioListTile(
                  value: cities[i],
                  groupValue: state.single,
                  onChanged: (value) {
                    state.select(cities[i]);
                  },
                  title: ChoiceText(
                    cities[i],
                    highlight: state.search?.value,
                  ),
                );
              },
              promptDelegate: ChoicePrompt.delegateBottomSheet(),
              anchorBuilder: ChoiceAnchor.create(inline: true),
            ),


            const FilterLine(),


            Text(
              "Price".tr(),
              style: const Font()
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),


            ChoosePriceWidget(loverPriceController: loverPriceController, upperPriceController: upperPriceController),


            const FilterLine(),


            InlineChoice<String>(
              multiple: true,
              clearable: true,
              value: tagsSelected,
              onChanged: setMultipleSelected,
              itemCount: tags.length,
              itemBuilder: (selection, i) {
                return ChoiceChip(
                  selected: selection.selected(tags[i]),
                  onSelected: selection.onSelected(tags[i]),
                  label: Text(tags[i]),
                  labelStyle: const Font().s10,
                );
              },
              listBuilder: ChoiceList.createWrapped(
                spacing: 2,
                runSpacing: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 350,
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3))),
            ),
          ),
        );
      },
    );
  }
}



