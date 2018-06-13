function loadMitarbeiter() {
    $(".load-icon").show()
    $.ajax({
        type: "GET",
        url: "test.php",
        success: (data) => {

            $(".load-icon").hide()
            alert(data)
            $("#test-apple").append("data")
        }
    })
}