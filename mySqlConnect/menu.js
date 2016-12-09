var arrMySql = [];
exports.toArray = function(rows)
{
    var arr=[];
    for(var i=0;i<rows.length;i++)
    {
        if((arr[rows[i].parent_id]==null)||(arr[rows[i].parent_id]=='undefined')) {
            arr[rows[i].parent_id] = [];
            arr[rows[i].parent_id].push(rows[i])
        }
        else {
            arr[rows[i].parent_id].push(rows[i]);
        }
    }
    return arr;
};
var HtmlString='';
var outputRecursive = function(parent_id)
{
    if((arrMySql[parent_id]==null)||(arrMySql[parent_id]=='undefined'))
    {
        return;
    }
    else
    {
        HtmlString+='<ul>';
        for(var i=0;i<arrMySql[parent_id].length;i++) {
            HtmlString+='<li><a href="#">'+arrMySql[parent_id][i].value+'</a>';
            outputRecursive(arrMySql[parent_id][i].id,tabs);
            HtmlString+='</li>';
        }
        HtmlString+='</ul>';

    }
};
exports.HtmlString = HtmlString;
exports.outputRecursive = function(){
    outputRecursive(0);
    return HtmlString;
};
//exports.Array = arrMySql;