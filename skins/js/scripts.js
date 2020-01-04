function MyModal() {
    var $name = $("#inputName").val();
    var $tel = $("#inputTel").val();
    var $paretn = /[\d\(\)\ -\+]{4,14}\d$/;

    if ($name.length < 2) {
        $("#error-name").html('Вы не ввели имя!');
        $("#error-name").css('color', 'red');
        return false;
    } else if ($tel == '') {
        $("#error-name").html('');
        $("#error-tel").html('Вы не ввели телефон!');
        $("#error-tel").css('color', 'red');
        return false;
    } else  if ($paretn.test($tel)) {
        /*$("#exampleModalCenterTitle").html('СПАСИБО ЗА ЗАЯВКУ!');
        $("#exampleModalCenterBody").html('Наш менеджер перезвонит Вам<br> в ближайшее время.');
        $("#exampleModalCenterBody").css('font-size', '18px');
        $("#exampleModalCenterBody").css('height', '100px');*/
        return true;
    } else {
        $("#error-name").html('');
        $("#error-tel").html('Неверный номер телефона!');
        $("#error-tel").css('color', 'red');
        return false;
    }
}
