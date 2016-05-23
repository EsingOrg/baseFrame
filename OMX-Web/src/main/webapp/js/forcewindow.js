/**
 * 定义ForceWindow类构造函数
 * 无返回值
 */

function ForceWindow (value)
{
    this.r = document.documentElement;
    this.f = document.createElement("form");
    this.f.target = "_blank";
    this.f.method = "post";
    this.r.insertBefore(this.f,this.r.childNodes[0]);
    this.i = document.createElement("input");
    this.i.type = "hidden";
    this.i.value = value;
    this.i.name = "jsonDataString";
    this.f.appendChild(this.i);
}

/**
 * 定义open方法
 * 参数url：字符串，要打开窗口的URL。
 * 无返回值
 */
ForceWindow.prototype.open = function (url)
{
    this.f.action = url;
    this.f.submit();
};