function display_delivery(option) {
    var obj = $(".required");
    if(option=="самовывоз")
    {
        for (var key in obj)
        {
            obj[key].value='default_value_off';
        }
        display_self_carry();
        return;
    }
    else
    {
        for (var key in obj)
        {
            obj[key].value='';
        }
        display_courier();
    }
}
function display_self_carry() {
    document.getElementById("delivery_self").style.display="block";
    document.getElementById("delivery_courier").style.display="none";
}
function display_courier() {
    document.getElementById("delivery_courier").style.display="block";
    document.getElementById("delivery_self").style.display="none";
}