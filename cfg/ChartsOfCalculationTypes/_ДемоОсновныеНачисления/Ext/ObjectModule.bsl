﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПередУдалением(Отказ)
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	_ДемоОсновныеНачисления.Ссылка
	|ИЗ
	|	ПланВидовРасчета._ДемоОсновныеНачисления КАК _ДемоОсновныеНачисления
	|ГДЕ
	|	_ДемоОсновныеНачисления.БазовыеВидыРасчета.ВидРасчета = &Ссылка";
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	ПодчиненныеВидыРасчета = Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Ссылка");
	Для Каждого ПодчиненныйСсылка Из ПодчиненныеВидыРасчета Цикл
		ПодчиненныйОбъект = ПодчиненныйСсылка.ПолучитьОбъект();
		Найденные = ПодчиненныйОбъект.БазовыеВидыРасчета.НайтиСтроки(Новый Структура("ВидРасчета", Ссылка));
		Для Каждого СтрокаТаблицы Из Найденные Цикл
			ПодчиненныйОбъект.БазовыеВидыРасчета.Удалить(СтрокаТаблицы);
		КонецЦикла;
		ПодчиненныйОбъект.Записать();
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

#КонецЕсли
