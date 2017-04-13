(function($) {
	'use strict';
	$.countdown.regionalOptions['pt-BR'] = {
		labels: ['Anos','Meses','Semanas','Dias','Horas','Minutos','Segundos'],
		labels1: ['Ano','Mês','Semana','Dia','Hora','Minuto','Segundo'],
		compactLabels: ['a','m','s','d'],
		whichLabels: null,
		digits: ['0','1','2','3','4','5','6','7','8','9'],
		timeSeparator: ':',
		isRTL: false
	};
	$.countdown.setDefaults($.countdown.regionalOptions['pt-BR']);
})(jQuery);
