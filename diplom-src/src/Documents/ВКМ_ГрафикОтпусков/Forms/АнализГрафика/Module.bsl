
#Область ОбработчикиСобытийФормы
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	АдресТаблицы = Параметры.Адрес;
	ТаблицаСотрудников = ПолучитьИзВременногоХранилища(АдресТаблицы);
	
	ДиаграммаОтпусков.Очистить();
	ДиаграммаОтпусков.Обновление = Ложь;

	Для Каждого Строка Из ТаблицаСотрудников Цикл

		ТочкаДГ = ДиаграммаОтпусков.УстановитьТочку(Строка.Сотрудник);
		СерияДГ = ДиаграммаОтпусков.УстановитьСерию("Отпуск");

		Значение = ДиаграммаОтпусков.ПолучитьЗначение(ТочкаДГ, СерияДГ);

		Интервал = Значение.Добавить();
		Интервал.Начало = Строка.ДатаНачала;
		Интервал.Конец = Строка.ДатаОкончания;

	КонецЦикла;

	ДиаграммаОтпусков.Обновление = Истина;
	
КонецПроцедуры

#КонецОбласти
