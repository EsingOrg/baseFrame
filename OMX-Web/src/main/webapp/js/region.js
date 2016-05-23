(function () {
	$.ajaxSetup({  
	    async : false  
	});

    function gid(id) { return document.getElementById(id); }
    function gval(id){
    	var sel = gid(id);
    	var index = sel.selectedIndex;
    	return sel.options[index].value;
    }
    var window = this, undefined, _AreaSelector = window.AreaSelector,

	AreaSelector = window.AreaSelector = function (setting) {
	    return new AreaSelector.fn.init(setting);
	};

    AreaSelector.fn = AreaSelector.prototype = {
        init: function (setting) {
        	if(setting == null){
        		return;
        	}
            var selector =
		{
		    selProvinceId: '', //省市县DOM id
		    selCityId: "",
		    selAreaId: '',
		    provinceOptionText: "", 	// 省份第一项的字符
		    provinceOptionValue: "",
            cityOptionText: "", 	// 地级市第一项的字符
		    cityOptionValue: "",
            areaOptionText: "", 	// 市、县级市、县第一项的字符
		    areaOptionValue: "",
		    isLoadOnInit: true, 	// 是否init的时候就加载省份
		    onProvinceChange: null, // 设置省更改后回调
		    onCityChange: null, // 设置地市更改后回调
		    onAreaChange: null,// 设置区县更改后回调
		    url:"",
		    areaId:'',
		    cityId:'',
		    provinceId:''
		};
            setting = setting || selector;
            AreaSelector.fn.extend(selector, setting);
            if (selector.onProvinceChange)
                gid(selector.selProvinceId).onchange = function () { this.selector.chgProvince.call(this, selector.onProvinceChange); };
            else
                gid(selector.selProvinceId).onchange = this.chgProvince;

            if (selector.onCityChange)
                gid(selector.selCityId).onchange = function () { this.selector.chgCity.call(this, selector.onCityChange); };
            else
                gid(selector.selCityId).onchange = this.chgCity;

            if (selector.onAreaChange)
                gid(selector.selAreaId).onchange = selector.onAreaChange;

            this.setting = selector;
            gid(selector.selProvinceId).selector = this;
            gid(selector.selCityId).selector = this;
            gid(selector.selAreaId).selector = this;
            if (selector.isLoadOnInit)
			{
                this.initProvince(selector.provinceId); // 初始化数据
				this.initCity(selector.cityId);
				this.initArea(selector.areaId);
			}
            return this;
        },
        setting: null,
        resetOptions: function (domID, selLevel, data, value) {
            var G = gid(domID), H;
            var H;
            G.options.length = 0;
            
            if (typeof(selLevel) == 'undefined') {
                selLevel = 0;
            }
            switch(selLevel) {
            case 1:
                G.options[0] = new Option(this.setting.cityOptionText, this.setting.cityOptionValue);
            	break;
            case 2:
                G.options[0] = new Option(this.setting.areaOptionText, this.setting.areaOptionValue);
            	break;
            default:
                G.options[0] = new Option(this.setting.provinceOptionText, this.setting.provinceOptionValue);
                break;
            }
			
            if (data == null || data.length == 0) return;
			
            var newOption;
            for (var i = 0; i < data.length; i++) {
                H = data[i];
                newOption = new Option(H.name, H.id);
                if (H.id == value) newOption.selected = true;
                G.options[G.options.length] = newOption;
            }
        },
        initProvince: function (ProvinceId, CityId, AreaId) {
        	if(this.setting.url == ""){
        		return;
        	}
        	var dataset = [];
        	$.get(this.setting.url+"?id=0"+"&t="+Math.random(),function(data,status){
        		dataset = data;
        	});
            this.resetOptions(this.setting.selProvinceId, 0, dataset, ProvinceId);
            this.initCity(CityId, AreaId);
        },
        initCity: function (CityId, AreaId) {
           var index = gid(this.setting.selProvinceId).selectedIndex;
           if (index <= 0) { this.resetOptions(this.setting.selCityId, 1); return; }
           var pid = gval(this.setting.selProvinceId);
           var dataset = [];
        	$.get(this.setting.url+"?id="+pid+"&t="+Math.random(),function(data,status){
        		dataset = data;
        	});
            this.resetOptions(this.setting.selCityId, 1, dataset, CityId);

            if (AreaId != null)
                this.initArea(AreaId);
        },
        initArea: function (AreaId) {
            var index = gid(this.setting.selCityId).selectedIndex;
            if (index <= 0) { this.resetOptions(this.setting.selAreaId, 2); return; }
            var pid = gval(this.setting.selCityId);
            var dataset = [];
        	$.get(this.setting.url+"?id="+pid+"&t="+Math.random(),function(data,status){
        		dataset = data;
        	});
            this.resetOptions(this.setting.selAreaId, 2, dataset, AreaId);
        },
        chgProvince: function (callback) {
            this.selector.resetOptions(this.selector.setting.selAreaId, 2);
            this.selector.initCity();

            if (callback){
            	try{
            		callback.call(gid(this.selector.setting.selProvinceId));
            	}catch(e){}
            }
                
        },
        chgCity: function (callback) {
            this.selector.resetOptions(this.selector.setting.selAreaId, 2);
            this.selector.initArea();

            if (callback){
            	try{
            		callback.call(gid(this.selector.setting.selCityId));
            	}catch(e){}
            }
        }
    }; // end of prototype
    AreaSelector.fn.init.prototype = AreaSelector.fn;
    AreaSelector.extend = AreaSelector.fn.extend = function () {
        var target = arguments[0] || {}, i = 1, length = arguments.length, deep = false, options;

        if (typeof target === "boolean") {
            deep = target;
            target = arguments[1] || {};
            i = 2;
        }

        if (typeof target !== "object" && !jQuery.isFunction(target))
            target = {};

        if (length == i) {
            target = this;
            --i;
        }

        for (; i < length; i++)
            if ((options = arguments[i]) != null)
                for (var name in options) {
                    var src = target[name], copy = options[name];

                    if (target === copy)
                        continue;

                    if (deep && copy && typeof copy === "object" && !copy.nodeType)
                        target[name] = jQuery.extend(deep,src || (copy.length != null ? [] : {}), copy);

                    else if (copy !== undefined)
                        target[name] = copy;
                }

        return target;
    };
})();
