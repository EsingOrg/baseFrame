/** 
@ Author :chuzhisheng 
@ Date : 2015-8-14 
@ Version : 1.0 
*/
(function(){
	var Spine, Framework, Model, Class, Controller, Util, Page,moduleKeywords,
	indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
	hasProp = {}.hasOwnProperty,
	extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };
	Date.prototype.format = function (format) {  
	    var configure = {"M+": this.getMonth() + 1, "d+": this.getDate(), "H+": this.getHours(), "h+": this.getHours(), "m+": this.getMinutes(), "s+": this.getSeconds(), "q+": Math.floor((this.getMonth() + 3) / 3), "S": this.getMilliseconds() };
	    if (/(y+)/.test(format)) format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in configure)
	    if (new RegExp("(" + k + ")").test(format)) format = format.replace(RegExp.$1, (RegExp.$1.length == 1) ? (configure[k]) : (("00" + configure[k]).substr(("" + configure[k]).length)));
	    return format;
	};
	Spine = this.Spine;
	/**
	 * 客户端数据模型，实现数据持久化
	 */
	Model = Spine.Model.sub();
	
	/**
	 * 客户端业务控制器，实现业务逻辑封装
	 */
	Controller = Spine.Controller.sub();
	/**
	 * 客户端数据模型，实现数据持久化
	 */
	Class = Spine.Model.sub(Spine.Log);
	/**
	 * 客户端工具对象，封装客户端常用方法
	 */
	Util = Spine.Controller.sub();
	/**
	 * 客户端初始器对象，页面加载完毕后执行
	 */
	Initiator = Spine.Controller.sub({
		//构造器
		init: function(options){
			var i, events, fun;
			events = this.events = this.events||[];
			for(i in options){
				fun = options[i];
				if(fun instanceof Function){
					events[i] = fun;
				}
			}
			this.trace = this.constructor.trace;
			this.logPrefix = this.constructor.logPrefix;
			this.url = this.constructor.url;
		},
		add: function(options){
			events = this.events = this.events||[];
			for(i in options){
				fun = options[i];
				if(fun instanceof Function){
					events[i] = fun;
				}
			}
		},
		//运行初始化
		run: function(){
			var _self = this;
			var i, events, fun;
			events = this.events = this.events||[];
			success = this.success = this.success||[];
			failure = this.failure = this.failure||[];
			$(function(){
				for(i in events){
					fun = events[i];
					if(fun instanceof Function){
						try{
							fun();
						}catch (e) {
							if(_self.trace&&window.console){
							window.console.log(i+" 加载失败! "+ e.message);
							window.console.log("异常函数： "+fun);
							}
							failure[i] = fun;
							continue;
						}
					}
					success[i] = fun;
					if(_self.trace&&window.console){
					window.console.log(i+" 加载成功!");
					}
				}
			});
		}
	});
	
	var trim = function(){$("input").each(function(){$(this).val($(this).val().trim());})};
	
	/**
	 * 项目页面对象
	 */
	Page = Spine.Controller.sub({
		config: function(context, suffix){
			this.context = context;
			this.suffix = suffix;
			this.url = window.location.pathname.replace("." + suffix, "");
		},
		func: function(options){
			for(var i in options){
				this[i] = options[i]
			}
		},
		/**
		 * 页面加载
		 * Page.ready({
		 * 		"加载说明"：function(){}
		 * })
		 */
		ready: function(initiatorOptons){
			var initiator = new Initiator();
			initiator.add(initiatorOptons);
			initiator.run();
		},
		/**
		 *控制器ajax请求方法
		 * formOptions(表单参数集) { 
		 * 		id: 表单id,
		 * 		action: action路径,
		 * 		method: 方法路径,
		 * 		success: function(data){
		 * 			成功返回执行的逻辑，data为Json格式
		 * 		},
		  * 		params(url参数集): {
		 * 			属性：值
		 * 		}
		 * 	}
		 */
		ajax:function(formOptions){
			trim();
			var _self = this, suffix = this.suffix, param="?";
			var i, formId, action, method, params, error, success, url, datas;
			
			formId = formOptions["id"];
			action = formOptions["action"]?"../"+formOptions["action"]+"/":"";
			method = formOptions["method"] || "";
			params = formOptions["params"];
			for(i in params){
				param += i+"="+params[i]+"&";
			}
			param = param.substring(0, param.length-1);
			
			url = action + method + "." + suffix + param;
			datas = $("#" + formId).serialize();
			error = formOptions["error"];
			error = error && error instanceof Function ? error : function(request, status, error){
				_self.initiator.log(url+" AJax请求失败");
			};
			success = formOptions["success"];
			success = success && success instanceof Function ? success : function(result){
				_self.initiator.log(url+" AJax请求成功");
			};
			$.ajax({
				type:	"post",
				dataType:	"json",
				url:	url, 
				data:	datas,    
				async:	false,
				error:	error,
			    success: success
			});
		},
		/**
		 * submit页面表单提交
		 * formOptions {@ 表单参数集} { 
		 * 		id: 表单id ，
		 * 		action：action路径，
		 * 		method： 方法路径，
		 * 		params {@ url参数集}{
		 * 			属性：值
		 * 		}
		 * 	}
		 * 
		 */
		submit: function(formOptions){
			var suffix = this.suffix;
			var errorMesseges, form, action, method, i, params, validate;
			form = formOptions["form"]?$("#"+formOptions["form"]):$("form").eq(0);
			action = formOptions["action"]?"../" + formOptions["action"]+"/":"";
			method = formOptions["method"]||"";
			params = formOptions["params"]||{};
			form.attr("action",action + method + "." + suffix + "?" + $.param(params));
			if(this.__submitValidate__()){
				form.submit();
			}
		},
		/**
		 * submit页面表单提交
		 * 		callback 校验函数 {Function}
		 */
		validate: function(callback){
			var _callbacks, _i, pass = true;
			_callbacks = this._submitCallbacks = this._submitCallbacks || [];
			_errorMessages = this._errorMessages = this._errorMessages || [];
			if(callback){
				//是否重复
				for(_i in _callbacks){
					if(callback == _callbacks[_i]);
					return void(0);
				}
				_callbacks.push(callback);
			}else{
				return this.__submitValidate__();
			}
		},
		/**
		 * addError添加错误信息
		 * message 错误信息{String}
		 */
		addError: function(message){
			var _errorMessages;
			_errorMessages = this._errorMessages = this._errorMessages || [];
			_errorMessages.push(message);
		},
		/**
		 * error 页面提交不通过执行逻辑
		 * 		callback 校验函数 {Function}
		 */
		error: function(callback){
			var _errorMessages;
			_errorMessages = this._errorMessages = this._errorMessages || [];
			if(callback instanceof Function){
				this._error = callback;
			}else if(this._error instanceof Function){
				this._error(_errorMessages);
				this._errorMessages = [];
			}
		},
		__submitValidate__: function(){
			var _callbacks, _errorMessages, _i, pass = true;
			_callbacks = this._submitCallbacks = this._submitCallbacks || [];
			_errorMessages = this._errorMessages = this._errorMessages || [];
			//是否重复
			for(_i in _callbacks){
				if(_callbacks[_i] instanceof Function){
					var result = _callbacks[_i].apply(this,arguments);
					if(typeof result !="undefined"){
						pass &= result;
					}
					if(!pass){
						this.error();
						return false;
					};
				}
			}
			if(_errorMessages.length > 0){
				this.error();
				return false;
			}
			return true;
		}
	});
	
	moduleKeywords = ['included', 'extended'];
	/**
	 * 客户端数据模型对象具有的静态方法
	 */
	Model.extend({
		/**
		 *数据模型ajax请求方法
		 * formOptions(表单参数集) { 
		 * 		id: 表单id,
		 * 		action: action路径,
		 * 		method: 方法路径,
		 * 		success: function(model){
		 * 			成功返回执行的逻辑，model为客户端数据模型对象
		 * 		},
		 * 		params(url参数集): {
		 * 			属性：值
		 * 		}
		 * 	}
		 */
		config: function(context, suffix){
			this.context = context;
			this.suffix = suffix;
		},
		ajax: function(formOptions){
			trim();
			var _self = this,suffix = this.suffix, param="?";
			
			formOptions.action = formOptions.action||_self.className;
			
			var i, formId, action, method, params, error, success, url, datas;
			
			formId = formOptions["id"];
			action = formOptions["action"]?"../"+formOptions["action"]+"/":"";
			method = formOptions["method"] || "";
			params = formOptions["params"];
			error = formOptions["error"];
			error = error && error instanceof Function ? error : function(request, status, error){
				_self.initiator.log(url+"请求失败");
			};
			success = function(result){
				formOptions["success"](_self.fromJSON(result));
			};
			success = success && success instanceof Function ? success : function(result){
				_self.initiator.log(url+"请求成功");
			};
			for(i in params){
				param += i+"="+params[i]+"&";
			}
			param = param.substring(0, param.length-1);
			url = action + method + "." + suffix + param;
			datas = $("#" + formId).serialize();
			$.ajax({
				type:	"post",
				dataType:	"json",
				url:	url, 
				data:	datas,    
				async:	false,
				error:	error,
			    success: success
			});
		}
	});
	
	
	/**
	 * 项目对象
	 */
	Framework = this.Framework = Class.sub({
		config: function(context, suffix){
			this.context = context;
			this.suffix = suffix;
			this.Page.config(context, suffix);
			this.Model.config(context, suffix);
		},
		//项目初始化
		init: function(projectOptions){
			for(var i in projectOptions){
				if(!this[i]){
					this[i] = projectOptions[i];
				}
			}
			//Initiator.app =  ""
			//Initiator.suffix = this.suffix || /.(*)+/
			Initiator.url = window.location.pathname;
			Initiator.logPrefix = new Date().format("yyyy-MM-dd HH:mm:ss")+" (" + Initiator.url + ")";
			Initiator.trace = this.debug || false;
			this.initiator = new Initiator();
			this.Page.initiator = new Initiator();
			this.Model.initiator = new Initiator();
			//console.clear();
		},
		ready: function(initiatorOptions){
			var initiator = this.initiator;
			initiator.add(initiatorOptions);
			initiator.run();
		},
		plugin: function(projectOptions){
			for(var i in projectOptions){
				if(!this[i]){
					this[i] = projectOptions[i];
					this.initiator.log(i+"组件加载成功");
				}else{
					this.initiator.log(i+"组件已经存在，加载失败");
				}
			}
		},
		extend:function(obj){
			var key, ref, value;
		      if (!obj) {
		        throw new Error('extend(obj) requires obj');
		      }
		      for (key in obj) {
		        value = obj[key];
		        if (indexOf.call(moduleKeywords, key) < 0) {
		          this[key] = value;
		        }
		      }
		      if ((ref = obj.extended) != null) {
		        ref.apply(this);
		      }
		      return this;
		},
		Model: Model.sub(),
		Class: Class.sub(),
		Controller: Controller.sub(),
		Util: Util.sub(),
		Initiator: Initiator.sub(),
		Page: new Page()
	});
	
	Framework.configure("notFind","suffix");
	
	Controller.create = Controller.sub = Model.create = Model.sub = Class.create = Class.sub = Util.create = Util.sub = function(instances, statics) {
	    Result = (function(superClass) {
	      extend(Result, superClass);

	      function Result() {
	        return Result.__super__.constructor.apply(this, arguments);
	      }

	      return Result;

	    })(this);
	    if (instances) {
	      Result.include(instances);
	    }
	    if (statics) {
	      Result.extend(statics);
	    }
	    if (typeof Result.unbind === "function") {
	      Result.unbind();
	    }
	    return Result;
	};
}).call(this);