var mysql = require('mysql');
var menuModule = require('./menu');
var connection = mysql.createConnection({
    host:'localhost',
    user:'default_user',
    password:'root',
    database:'default_user'
});
connection.connect();
function makeMenuRequest(callback)
{

    connection.query("SELECT `id`,`parent_id`,`value` FROM menu",function(err,rows,fields){
        if(err){ callback(err);}
        else
        {
            var arr = menuModule.toArray(rows);
            return callback(null,arr);
            //var htmlString = menuModule.outputRecursive();
            /*connection.end(function(err)
            {
                if(err){
                    callback(err);
                }
                else
                    //console.log("Disconnect");
                    console.log(arr);
                    return callback(null,arr);
            });*/
        }

    });
}
function makeQueryStringForSelfExtract(obj)
{
    return "INSERT INTO `self_delivery`(`fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `extraction_point`, `text_latin`) " +
        "VALUES ('"+obj['fio']+"','"+obj['tel']+"','"+obj['email']+"','"+obj['additional-info']+"','"+obj['additional-info2']+"','"+obj['check_one']+"',"+(obj['checkbox-latin']==='on')+",'"+obj['select_point']+"','"+obj['additional-info-latin']+"')";
}
function makeQueryStringForCourierDelivery(obj2)
{
    return "INSERT INTO `courier_delivery`(`fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `StreetName`, `HouseNum`, `GateNum`, `Code`, `FloorNum`, `FlatNum`, `Corp`, `text_latin`) "+
        "VALUES ('"+obj2['fio']+"','"+obj2['tel']+"','"+obj2['email']+"','"+obj2['additional-info']+"','"+obj2['additional-info2']+"','"+obj2['check_one']+"',"+(obj2['checkbox-latin']==='on')+",'"+obj2['Street']+"','"+obj2['House']+"','"+obj2['Gate']+"','"
        +obj2['Code']+"','"+obj2['Floor']+"','"+obj2['FlatNum']+"','"+obj2['corp']+"','"+obj2['additional-info-latin']+"')";
}
function makeQuery(connection,queryString,callback) {
    connection.connect();
    connection.query(queryString, function (err, result) {
        if (err) {
            callback(err);
        }
        else {
            console.log("result:" + result);
            connection.end(function (err) {
                if (err) {
                    callback(err);
                }
                else
                    callback(null,result);
                    //console.log("Disconnect");
            });
        }
    });
}

exports.saveInDb = function(object,callback)
{
    var queryString = '';
    if(object['delivery']==='курьером')
    {
        queryString=makeQueryStringForCourierDelivery(object);
    }
    else
    {
        queryString=makeQueryStringForSelfExtract(object);
    }
    makeQuery(connection,queryString,callback);
};
exports.getMenu = function(callback)
{
    makeMenuRequest(callback);
};