function display_delivery(option) {
    if(option=="самовывоз")
    {
        display_self_carry();
        return;
    }
    else
    {
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