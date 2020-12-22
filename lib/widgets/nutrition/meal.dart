/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:wger/models/nutrition/meal.dart';
import 'package:wger/models/nutrition/meal_item.dart';

class MealItemWidget extends StatelessWidget {
  final MealItem _item;

  MealItemWidget(this._item);

  @override
  Widget build(BuildContext context) {
    String unit = _item.weightUnit == null ? 'g' : _item.weightUnit.weightUnit.name;
    String amount = '${_item.amount}$unit';

    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Table(
        children: [
          TableRow(
            children: [
              Text(
                _item.ingredient.name,
                textAlign: TextAlign.left,
              ),
              Text(amount),
            ],
          ),
        ],
      ),
    );
  }
}

class MealWidget extends StatelessWidget {
  final Meal _meal;

  MealWidget(this._meal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black12),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(_meal.time.format(context)),
            ),
            ..._meal.mealItems.map((item) => MealItemWidget(item)).toList(),
          ],
        ),
      ),
    );
  }
}
