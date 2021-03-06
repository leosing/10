﻿#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Текст = Параметры.Текст;
	ПапкаСФайлами = Параметры.ПапкаСФайлами;
	
	Элементы.ФормаОткрытьПапкуСФайлами.Видимость = ЗначениеЗаполнено(ПапкаСФайлами);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ОткрытьПапкуСФайлами(Команда)
	
	ОбщегоНазначенияКлиент.ОткрытьПроводник(ПапкаСФайлами);
	
КонецПроцедуры

#КонецОбласти
