function loadMitarbeiter() {
    $(".load-icon").show();
    let request = {
        type: "GET",
        url: "php/mitarbeiter.php",
        dataType: "text"
    };
    $.ajax(request).done((data) => {
        $(".load-icon").hide();
        $(".tabelle-mitarbeiter-result").append(data);
    });
}

function submitProj() {
    $(".load-icon").show();
    console.log("hi");
    let name = $('#name').val();
    let start
    let ende
    let request = {
        type: "POST",
        url: "php/projekte.php",
        data: {
            "name": name,
            "leiterid": 1,
            "start": "",
            "ende": ""
        },
        dataType: "json"
    }
    $.ajax(request).done((data) => {
        alert("fertig gesendet")
    })
    $(".load-icon").hide();
}