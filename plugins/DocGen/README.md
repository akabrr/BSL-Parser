# DocGen

В этой папке находятся исходники генератора технической документации по парсеру.

Генератор реализован в виде плагина к парсеру. Плагин анализирует AST исходного кода парсера и возвращает документ в формате html.
Анализ опирается на определенные маркеры в исходном коде. Например, строка с пометкой @Node в комментарии считается объявлением типа узла AST.