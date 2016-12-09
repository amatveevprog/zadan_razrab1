var mysql = require('mysql');
var connection = mysql.createConnection({
    host:'localhost',
    user:'default_user',
    password:'root',
    database:'default_user'
});
getAllMenuItems();
var arrMySql=[];
function getAllMenuItems()
{
    connection.connect();
    connection.query("SELECT `id`,`parent_id`,`value` FROM menu",function(err,rows,fields){
        if(err){ throw(err);}
        else
        {

            //console.log(rows[10].parent_id);
            //console.log(fields);
            //console.log(toArray(rows));
            //console.log(arr);
           /* for(key in arr)
            {
                console.log("key:"+key+" arr["+key+"]=");
                console.log(arr[key]);
            }*/
            arrMySql = toArray(rows);
            outputRecursive(0,"");
            console.log(HtmlString);
            connection.end(function(err)
            {
                if(err){
                    throw err;
                }
                else
                    console.log("Disconnect");
            });
        }
        
    });
    
}
function toArray(rows)
{
    var arr=[];
    for(var i=0;i<rows.length;i++)
    {
        if((arr[rows[i].parent_id]==null)||(arr[rows[i].parent_id]=='undefined')) {
            //вставляем новый элемент в ассоциативный массив
            //console.log(arr[rows[i].parent_id]);
                arr[rows[i].parent_id] = [];
            arr[rows[i].parent_id].push(rows[i])
        }
        else {
            arr[rows[i].parent_id].push(rows[i]);
        }
    }
    /*var arr2=[];
    console.log(Object.keys(arr));
    for(var key in arr)
    {
        arr2.push(arr[key]);
    }*/
    return arr;
}
var tab="   ";
//var arr=[];
var HtmlString='';
function outputRecursive(parent_id,tabs)
{
    if((arrMySql[parent_id]==null)||(arrMySql[parent_id]=='undefined'))
    {
        return;
    }
    else
    {
        tabs+="     ";
        HtmlString+='<ul>';
        //console.log(tabs,'<ul>');
        for(var i=0;i<arrMySql[parent_id].length;i++) {
            //для каждого потомка выводим себя и вызываем функцию себя
            //на случай, если у потомка есть потомки
           // console.log(tabs,'<li><a href="#">'+arrMySql[parent_id][i].value+'</a>');
            HtmlString+='<li><a href="#">'+arrMySql[parent_id][i].value+'</a>';
            //console.log(tabs,arrMySql[parent_id][i]);
            outputRecursive(arrMySql[parent_id][i].id,tabs);
            HtmlString+='</li>';
            //console.log(tabs,'</li>');
        }
        HtmlString+='</ul>';
       // console.log(tabs,'</ul>');
        //console.log(HtmlString);
        //выводим всех детей данного родителя
    }
}

