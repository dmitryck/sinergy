# Задание 6 (Агрегация данных. Статистика по оценкам учеников)

**Цель:** оценить способность кандидата оценивать бизнес-логику задач, писать понятный и легко поддерживаемый код

## Задание
Предположим, что мы пишем статистическую систему, которая оценивает успеваемость учеников в школах города. Школы отправляют нам файлы журналов с оценками учеников за прошедшее полугодие, но форматы этих выгрузок могут отличаться.
Наша задача – посчитать среднюю оценку по каждому предмету и узнать кол-во плохо учащихся ребят в городе.

В городе сейчас есть три школы, каждая присылает журналы в своем формате:
- Школа #1: json-файл
- Школа #2: json-файл
- Школа #3: xml-файл
Файлы с данными находятся в папке `data/` этого репозитория – они содержат в себе информацию об оценках учеников по разным предметам.

Нужно написать скрипт, который будет возвращать:
- среднюю оценку по математике, русскому языку и физике во всем городе.
- процент учеников (от общего кол-ва учеников в городе), у которых есть хотя бы одна плохая оценка (3ка и хуже) по любому из предметов

## Пример выполнения
```sh
$ bundle install
$ ruby run.rb

Average Scores:
math: 4.2, russian: 3.8, phys: 3.2
Bad-learning students percentage: 34.6%
```

## Условия
- Вспомогательных классов и структур может быть сколько потребуется
- Нужно учесть, что в систему будут добавляться другие школы (у каких-то будут использоваться те же форматы журналов, что и у этих трех, у каких-то могут появиться новые форматы данных)
- веб-фреймворк подключать не нужно, достаточно просто скрипта на ruby, при запуске которого в консоль вернется итоговый ответ сервиса
- Но, для удобства, если потребуется, можно подрубать необходимые гемы (active-support или что-то еще)

# Smoke

## install it:
```bash
git clone https://github.com/dmitryck/sinergy
cd sinergy
bundle
```

## setup it (add/update target data):
```bash
rake setup
```

## run it:
```bash
ruby runner.rb
```

# Code

Runner code ([runner.rb](https://github.com/dmitryck/sinergy/tree/master/runner.rb)):

```ruby
require_relative 'app/requirer'

report = Report.new(Parser.report_data)

puts 'Average Scores:'
puts report.average_info
puts report.bad_learning_info

# if need average of subject
# puts report.average(:russian)

# if need all report values:
# puts report.report
```

# Comment
You can config parsers and subjects (see [app/config](https://github.com/dmitryck/sinergy/tree/master/app/config) folder)

It's good idea to have only one format/struct of data

No raise errors version

No tests version
