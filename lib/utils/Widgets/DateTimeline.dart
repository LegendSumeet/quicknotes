import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DateTimeLine extends ConsumerWidget {
  const DateTimeLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EasyDateTimeLine(
      activeColor: Theme.of(context).colorScheme.primary,
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      dayProps: EasyDayProps(
        inactiveDayStyle: DayStyle(
          dayNumStyle: Theme.of(context).textTheme.titleSmall,
          dayStrStyle: Theme.of(context).textTheme.titleSmall,
        ),
        todayStyle: DayStyle(
          dayNumStyle: Theme.of(context).textTheme.titleSmall,
          dayStrStyle: Theme.of(context).textTheme.titleSmall,
        ),
        height: 56.0,
        width: 124.0,
      ),
      headerProps: EasyHeaderProps(
        selectedDateStyle: Theme.of(context).textTheme.titleMedium,
        monthStyle: Theme.of(context).textTheme.titleMedium,
        dateFormatter: const DateFormatter.fullDateMonthAsStrDY(),
      ),
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.withOpacity(0.1),
              ),
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    EasyDateFormatter.shortMonthName(date, "en_US"),
                    style: (isSelected == false)
                        ? Theme.of(context).textTheme.titleSmall
                        : Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    date.day.toString(),
                    style: (isSelected == false)
                        ? Theme.of(context).textTheme.titleSmall
                        : Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
