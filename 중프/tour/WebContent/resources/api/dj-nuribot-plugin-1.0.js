(function($){
	"use strict";
	
	$.fn.dj_nuribot = function(){
		if(navigator.platform) if(0 > 'win16|win32|win64|mac'.indexOf(navigator.platform.toLowerCase())) return;
		$(this).css({ 'z-index': '9000', 'position': 'fixed', 'right': opts.fixed.right + 'px', 'bottom': opts.fixed.bottom + 'px' });
		iframe.create.bind(this)();
		oicon.create.bind(this)();
		balloon.create.bind(this)();
	};
	
	//공통 옵션 변수 처리
	var opts = { fixed: { right: 30, bottom: 30 } };
	
	//처음 말풍선
	var balloon = {
		create: function(){
			balloon.obj.css({
				'display': 'inline-block', 'position': 'fixed', 'background': 'rgba(71,71,71,0.6)', 'color': '#fff',
				'width': '430px', 'right': opts.fixed.right + 'px', 'bottom': ( opts.fixed.bottom + 75 ) + 'px',
				'-webkit-transition': '-webkit-transform 0.5s', '-ms-transition': '-ms-transform 0.5s',
				'transition': 'transform 0.5s', '-moz-border-radius': '15px', '-webkit-border-radius': '15px', 'border-radius': '15px',
				'padding': '10px 10px', 'font-size': '16px !important', 'text-align': 'center'
			});
			$(this).append(balloon.obj);
			balloon.start();
		},
		obj: $('<div><b style="font-size:16px !important;">\'누리봇\' 수어관광 챗봇!</b><br/><span style="font-size:13px !important;">[대전관광 정보를 단어로 검색하면 한국어와 수화영상으로 답변합니다.]</span></div>'),
		interval: null,
		cnt: 0,
		moveFlag: true,
		start: function(){
			balloon.interval = setInterval(function(){
				if(balloon.moveFlag && balloon.cnt%2 == 0){
					balloon.obj.css({
						'-webkit-transform': 'translate(0px, -5px) scale(1, 1.1)',
						'-ms-transform': 'translate(0px, -5px) scale(1, 1.1)',
						'transform': 'translate(0px, -5px) scale(1, 1.1)'
					});
				}else{
					balloon.obj.css({
						'-webkit-transform': 'translate(0px, 0px) scale(1, 1)',
						'-ms-transform': 'translate(0px, 0px) scale(1, 1)',
						'transform': 'translate(0px, 0px) scale(1, 1)'
					});
					if(balloon.cnt == 5) balloon.moveFlag = false;
				}
				balloon.cnt++;
				if(balloon.cnt == 20) balloon.clear();
			}, 500);
		},
		clear: function(){
			if(balloon.interval) clearInterval(balloon.interval);
			if(balloon.obj) balloon.obj.hide(300, function(){balloon.obj.remove();});
		}
	};
	
	//오픈 아이콘
	var oicon = {
		create: function(){
			$(this).append(oicon.make_icon());
			oicon.set_event();
		},
		obj: $('<div class="dj-oicon"></div>'),
		img: {
			background: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAA5BJREFUeNrk212IVHUYx/HP+Sel6WwrdCGuISxK7q2QsVSmILlFtAWVUEG04F2FtxWCIXQRXUR3Er1iF/ZCGFGrCEkvbBh4WYZiSL7duW+mhThdnP+pUWZ3Z2bP7M6c84OBYfbM///77p999jzPeZ4k7B3XBlXQg7uxEevj+7vi5yviddOYxJ/4HSdxPL6fxFTexpbkuNZSbMC9eBibsbKB79yJfjxY8/klfI9R/IwTuJqHySSHE14WAYfj646cD2UCB+PrW1xZTOCnMILtSLRXVRzC+/is1UVCi99bh/14D0MLACvuMRT33B89tB04wXM4imdjcFpoVeLemYekXcA9eBsfoc/iqw8fR089eQP34QBensefQTsUoqcDjR5CI+bXxiAxpHM1FD2unS/wGnyKQZ2vweh1TavAvfgAm3SPNkXPvc0CJ9iDbbpP2/D6TNF7JuBn8JLu1YuRoSHgfrzZYdG4lej9VkxaZgVOsBerdb9W4Q3cMhvwMJ5QHD0ameoCV7AzZj9F0dKY3FTqAW/BQ4qn7bW5dgZ8G57MuSDQKVoS2W6tBV5X0NOtPeX1GXCC+2NUK6pW4T4kAcvxiOJrGMuDtAa1uQTAW7EySCuNvSUAXoaBgHuURxsDBkoEPBBislAW9YeCJAqNanXQRMWvAOoJ/n+wVQatCEqmIH1kWRZNB+lz2LJoMuB8iYDPB/xRIuDTAb+WCPi3gF9KBHw8SPsnxksAeyU74QlpA0nR9R0uBVzGNyUAPojLQdos8iMuFhj2In5CNbu1PIXDBQY+JG16+69M+zc+x7UCwl7DF/inFpi0K+ZwQU/3aG3ykGkK75pnp1uH6aq0kW2qHnAWyb4sEPDX+Orm9LBWVezGhQLAXsCrN8elegWA0/HCahfDVvFaFpnnAibtttvXxcD78GG9H4RZfkOv4EgXwh6J3qvNAIsJxQs41kWwx6LnGZOhuYp4Z/E0xroAdix6PTvbRY1ULc9IG8FHOxh2NHo8M9eFjZZpz2EH3sH1DgK9Hj3tiB7lBUxa3dyF5xtdvM06F73s0kTltdlCfFXafr8Vn1icmvZ03HtL9NLU/UKrTx5OSkcBRuLN+ULcpGRDHiNx71OtLJLHGM/t0gbtx/GY9o7xjOKv+SyW5DiZlg1qDUrnmB7QeivFOH6QzimN6bBBrXqqxJOuHcXbIO1Wr7hxFG8q/u884cZRvAltGMX7dwAYr7eytk5yPwAAAABJRU5ErkJggg==',
			open_def: 'data:image/png;base64,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',
			open_hov: 'data:image/png;base64,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',
			close_def: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAiFJREFUeNrsmbFOG0EURa+JHdmCH/FvBPepoCJ8AImRnC5UFLEloIX8R1KkimkC34HtgoYiUDiJINJJ86xYkdlZdmfxrvyuNLK02rnzznrm7czbGqBV0ppWTA7swA7swA7swA7swA7swA7swA5cFHBLUlfSWNKFpC1JzQi+TfO6NO+ujZVPQN62B1zzTzdAH9jI4blhHjdzvtc2Vq54YwBPWKxvQDuDX9v6LtIkb7wxpvT4keubkr7ab1p1An0mZZjSW8Atj+sHsJPCZwe4S/C5tbGWPqVf2HpL0i+gl+DRs3uS1Lexlg48SzLngYDvgUOgPtevbtfuA33PcybB6MCzZDMKBP4HOAIa1o7sWpJGGZPfwlaLXJfelPRZ0nrgvk+SkPQ2cN9U0mtJw2gRRvyH55PPlPyapkx2S5vS8+1dinUZWu/7RcRWFLCAgxzAB0XFVSRwHRhkgB38l8krAzx7R58+AfY0xru26K1lkmrWUufQws+HBT7Nl8BJhindr+qUPlylpNUDHlbltfQG+FnWjUfsreUrSV9SbC3PLJntVXlr2QauUkzVj5aUGsDxcx8envN4+Bv4AKxlOB4Oy3Q8TFsASEpC7+2BVKIAECrx3FkiC/nsVqXE8z0hyDHQeYJXJ1BEuChzmXZYxjKtF+IztBbQtad/aeusGcG3CWyb58TGaJVt4+FfDx3YgR3YgR3YgR3YgR3YgR3YgR24Cvo7ACO6mdKRvRPtAAAAAElFTkSuQmCC',
			close_hov: 'data:image/png;base64,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'
		},
		make_icon: function(){
			var oicon_css = {'width': '60px', 'height': '60px', 'position': 'fixed', 'right': opts.fixed.right + 'px', 'bottom': opts.fixed.bottom + 'px'};
			oicon.obj.append('<div class="dj-oicon-background" style="background: no-repeat url(' + oicon.img.background + ');"></div>');
			oicon.obj.append('<div class="dj-oicon-close" style="background: no-repeat url(' + oicon.img.close_def + ');"></div>');
			oicon.obj.append('<div class="dj-oicon-open" style="background: no-repeat url(' + oicon.img.open_def + ');"></div>');
			oicon.obj.css(oicon_css);
			oicon.obj.find('div').css(oicon_css);
			oicon.close();
			return oicon.obj;
		},
		set_event: function(){
			oicon.obj.css('cursor', 'pointer');
			oicon.obj.hover(
				function(){	//in
					oicon.obj.find('div.dj-oicon-close').css('background', 'no-repeat url(' + oicon.img.close_hov + ')');
					oicon.obj.find('div.dj-oicon-open').css('background', 'no-repeat url(' + oicon.img.open_hov + ')');
					if(iframe.obj.css('display') == 'none'){
						oicon.obj.find('div.dj-oicon-open').css(oicon.opts.hover_in);
					}else{
						oicon.obj.find('div.dj-oicon-close').css(oicon.opts.hover_in);
					}
				},
				function(){	//out
					oicon.obj.find('div.dj-oicon-close').css('background', 'no-repeat url(' + oicon.img.close_def + ')');
					oicon.obj.find('div.dj-oicon-open').css('background', 'no-repeat url(' + oicon.img.open_def + ')');
					if(iframe.obj.css('display') == 'none'){
						oicon.obj.find('div.dj-oicon-open').css(oicon.opts.hover_out);
					}else{
						oicon.obj.find('div.dj-oicon-close').css(oicon.opts.hover_out);
					}
				}
			);
			oicon.obj.click(function(){
				balloon.clear();
				if(iframe.obj.css('display') == 'none'){
					oicon.open.bind(this)();
					iframe.toggle('show');
				}else{
					oicon.close.bind(this)();
					iframe.toggle('hide');
				}
			});
		},
		opts: {
			hover_in: {
				'-webkit-transition': '-webkit-transform 0.2s',
				'-ms-transition': '-ms-transform 0.2s',
				'transition': 'transform 0.2s',
				'-webkit-transform': 'scale(1.1, 1.1)',
				'-ms-transform': 'scale(1.1, 1.1)',
				'transform': 'scale(1.1, 1.1)'
			},
			hover_out: {
				'-webkit-transition': '-webkit-transform 0.2s',
				'-ms-transition': '-ms-transform 0.2s',
				'transition': 'transform 0.2s',
				'-webkit-transform': 'scale(1.0, 1.0)',
				'-ms-transform': 'scale(1.0, 1.0)',
				'transform': 'scale(1.0, 1.0)'
			},
			open: {
				transition: 'transform 0.3s',
				scale0: 'scale(0.0, 0.0)',
				scale1: 'scale(1, 1)',
				origin: '50% 50%',
				delay: '0.3s'
			},
			close: {
				transition: 'transform 0.6s',
				rotate0: 'rotate(0deg) scale(1, 1)',
				rotate1: 'rotate(45deg) scale(0, 0)'
			}
		},
		open: function(){
			oicon.obj.find('div.dj-oicon-open').css({
				'-webkit-transition': '-webkit-' + oicon.opts.open.transition,
				'-ms-transition': '-ms-' + oicon.opts.open.transition,
				'transition': oicon.opts.open.transition,
				'-webkit-transform': oicon.opts.open.scale0,
				'-ms-transform': oicon.opts.open.scale0,
				'transform': oicon.opts.open.scale0,
				'-webkit-transform-origin': oicon.opts.open.origin,
				'-ms-transform-origin': oicon.opts.open.origin,
				'transform-origin': oicon.opts.open.origin
			});
			oicon.obj.find('div.dj-oicon-close').css({
				'-webkit-transition': '-webkit-' + oicon.opts.close.transition,
				'-ms-transition': '-ms-' + oicon.opts.close.transition,
				'transition': oicon.opts.close.transition,
				'-webkit-transform': oicon.opts.close.rotate0,
				'-ms-transform': oicon.opts.close.rotate0,
				'transform': oicon.opts.close.rotate0,
				'-webkit-transform-origin': oicon.opts.open.origin,
				'-ms-transform-origin': oicon.opts.open.origin,
				'transform-origin': oicon.opts.open.origin
			});
		},
		close: function(){
			oicon.obj.find('div.dj-oicon-open').css({
				'-webkit-transition': '-webkit-' + oicon.opts.open.transition,
				'-ms-transition': '-ms-' + oicon.opts.open.transition,
				'transition':  + oicon.opts.open.transition,
				'-webkit-transition-delay': oicon.opts.open.delay,
				'-ms-transition-delay': oicon.opts.open.delay,
				'transition-delay': oicon.opts.open.delay,
				'-webkit-transform': oicon.opts.open.scale1,
				'-ms-transform': oicon.opts.open.scale1,
				'transform': oicon.opts.open.scale1,
				'-webkit-transform-origin': oicon.opts.open.origin,
				'-ms-transform-origin': oicon.opts.open.origin,
				'transform-origin': oicon.opts.open.origin
			});
			oicon.obj.find('div.dj-oicon-close').css({
				'-webkit-transition': '-webkit-' + oicon.opts.close.transition,
				'-ms-transition': '-ms-' + oicon.opts.close.transition,
				'transition': oicon.opts.close.transition,
				'-webkit-transform': oicon.opts.close.rotate1,
				'-ms-transform': oicon.opts.close.rotate1,
				'transform': oicon.opts.close.rotate1,
				'-webkit-transform-origin': oicon.opts.open.origin,
				'-ms-transform-origin': oicon.opts.open.origin,
				'transform-origin': oicon.opts.open.origin
			});
		}
	};
	
	//iframe
	var iframe = {
		create: function(){
			var _addr = 'https://nuribot.daejeon.go.kr/chatclient/#/b85f5377-cdac-4450-9ac0-061fce0e0aea';
			iframe.obj.attr('src', _addr);
			iframe.obj.attr('scrolling', 'no');
			iframe.obj.attr('title', '누리봇');
			iframe.obj.attr('allowfullscreen', 'true');
			iframe.obj.attr('webkitallowfullscreen', 'true');
			iframe.obj.attr('mozallowfullscreen', 'true');
			iframe.set_size();
			iframe.obj.css({
				'display': 'none', 'margin-bottom': ( opts.fixed.bottom + 40 ) + 'px', 'margin-right': '-20px', 'border': '1px solid #BDBDBD',
				'-moz-border-radius': '10px', '-webkit-border-radius': '10px', 'border-radius': '10px', 'box-shadow': '3px 3px 5px 2px grey'
			});
			$(this).append(iframe.obj);
		},
		obj: $('<iframe>누리봇입니다.</iframe>'),
		set_size: function(){
			iframe.obj.attr('width', 440);
			iframe.obj.attr('height', ( ( window.innerHeight - 170 ) > 400 ) ? window.innerHeight - 170 : 400);
		},
		toggle: function(type){
			if(type === 'show'){
				iframe.set_size();
				iframe.obj.show();
			} else {
				iframe.obj.hide();
			}
		}
	};
}(jQuery));