function loadMitarbeiter() {
    $(".load-icon").show()
    let request = {
        type: "GET",
        url: "php/mitarbeiter.php",
        dataType: "text"
    }
    $.ajax(request).done((data) => {
        $(".load-icon").hide()
        $(".tabelle-mitarbeiter-result").append(data)
    })
}