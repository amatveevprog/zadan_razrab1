var mysql = require('mysql');
var connection = mysql.createConnection({
    host:'localhost',
    user:'default_user',
    password:'root',
    database:'default_user'
});

connection.query("SELECT * FROM `self_delivery`",function(err,rows,fields){
    if(err){ throw(err);}
    else
    {
        console.log(rows);
        //console.log(fields);
        // connection.end(function(err)
        // {
        //     if(err){
        //         throw err;
        //     }
        //     else
        //         console.log("Disconnect");
        // });
    }
});
var obj = {
    fio: 'ddd',
    tel: 'aaa',
    email: 'amatveev.prog@gmail.com',
    'additional-info': 'fff',
    'additional-info2': '',
    check_one: 'Vici',
    'checkbox-latin': 'on',
    delivery: 'самовывоз',
    Street: '',
    House: '',
    Gate: '',
    Code: '',
    Floor: '',
    FlatNum: '',
    corp: '',
    select_point: '2',
    'additional-info-latin': 'why?'
};
var obj2 =
{ fio: '',
    tel: '',
    email: 'as@fsadfas.sd',
    'additional-info': 'sdsdd',
    'additional-info2': '',
    check_one: 'Vici',
    'checkbox-latin': 'on',
    delivery: 'курьером',
    Street: 'Новозадрищенская',
    House: '5',
    Gate: '65',
    Code: '654234',
    Floor: '-1',
    FlatNum: '-2',
    corp: 'если есть',
    select_point: '1',
    'additional-info-latin': 'Я привык!' };
var queryString1 = "INSERT INTO `self_delivery`(`fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `extraction_point`, `text_latin`) " +
        "VALUES ('"+obj['fio']+"','"+obj['tel']+"','"+obj['email']+"','"+obj['additional-info']+"','"+obj['additional-info2']+"','"+obj['check_one']+"',"+(obj['checkbox-latin']==='on')+",'"+obj['select_point']+"','"+obj['additional-info-latin']+"')";
var queryString2 = "INSERT INTO `courier_delivery`(`fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `StreetName`, `HouseNum`, `GateNum`, `Code`, `FloorNum`, `FlatNum`, `Corp`, `text_latin`) "+
    "VALUES ('"+obj2['fio']+"','"+obj2['tel']+"','"+obj2['email']+"','"+obj2['additional-info']+"','"+obj2['additional-info2']+"','"+obj2['check_one']+"',"+(obj2['checkbox-latin']==='on')+",'"+obj2['Street']+"','"+obj2['House']+"','"+obj2['Gate']+"','"
    +obj2['Code']+"','"+obj2['Floor']+"','"+obj2['FlatNum']+"','"+obj2['corp']+"','"+obj2['additional-info-latin']+"')";
console.log(JSON.stringify(queryString2));
makeQuery(connection,queryString2);
//console.log(JSON.stringify(queryString));
function makeQuery(connection,queryString) {
    connection.connect();
    connection.query(queryString, function (err, result) {
        if (err) {
            throw(err);
        }
        else {
            console.log("result:" + result);
            connection.end(function (err) {
                if (err) {
                    throw err;
                }
                else
                    console.log("Disconnect");
            });
        }
    });
}
//INSERT INTO `self_delivery`(`fio`, `phone`, `email`, `additional_info`, `additiona_info_2`, `checked_one`, `checked_two`, `extraction_point`, `text_latin`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10])
