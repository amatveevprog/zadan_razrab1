function createMenu(array) {
    var menu = document.createElement('ul');
    menu.className="menu";
    var HtmlString='';
    var outputRecursive = function(parent_id)
    {
        if((array[parent_id]==null)||(array[parent_id]=='undefined'))
        {
            return;
        }
        else
        {
            if(parent_id!=0) {
                HtmlString += '<ul>';
            }
            console.log(array[parent_id].length);
            for(var i=0;i<array[parent_id].length;i++) {
                HtmlString +='<li><a href="#">'+array[parent_id][i].value+'</a>';
                outputRecursive(array[parent_id][i].id);
                HtmlString +='</li>';
            }
            if(parent_id!=0) {
                HtmlString += '</ul>';
            }

        }
    };
    outputRecursive(0);
    menu.innerHTML=HtmlString;
    return menu;
}
window.onload = function () {
    console.log("loading menu");
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/menu', true);
    xhr.send();
    xhr.onreadystatechange = function()
    {
        if (xhr.readyState != 4) {
            return;
        }
        if (xhr.status == 200)
        {
            var menu = JSON.parse(xhr.responseText);
            menu = createMenu(menu);
            console.log(menu);
            //console.log(menu);

            /*
             for (var i in items_json.items)
             {
             catalog_object.filtered_items.push(items_json.items[i]);
             catalog_object.items.push(items_json.items[i]);
             }
             catalog_object.paint_all_items();
             */
        }

        else
        {
            alert('Ошибка! Проверьте соединение с интернетом или обратитесь в службу поддержки');
        }

    };
}
