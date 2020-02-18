const key = 'good_counter';

$(window).on('load', function() {
    var nowCounter = readCookie();
    $('#goodCounter').text(nowCounter);
    var progresMaxValue = setProgresMaxValue(nowCounter);
    $('#goodTime').attr('max', progresMaxValue);
})

function good() {
    var nowCounter = parseInt($('#goodCounter').text(), 10);
    nowCounter = nowCounter + 1;
    $('#goodCounter').text(nowCounter);
    $('#goodTime').attr('class', '');
    $('#goodMark').attr('onclick', 'good();');
}

function updateTime() {
    var progresValue = parseInt($('#goodTime').attr('value'), 10);
    var progresMaxValue = parseInt($('#goodTime').attr('max'), 10);
    if (progresValue < progresMaxValue) {
        $('#goodTime').attr('value', progresValue + 1);
        setTimeout(updateTime, 100);
    } else {
        $('#goodMark').attr('onclick', '');
        writeCookie($('#goodCounter').text());
    }
}

function readCookie() {
    var cookies = document.cookie.split(';');
    var goodCounter = 0;
    for (var i = 0; i < cookies.length; i++) {
        var cookieArray = cookies[i].split('=');
        if (cookieArray[0] == key) {
            goodCounter = cookieArray[1];
            break;
        }
    }
    return parseInt(goodCounter, 10);
}

function writeCookie(goodCounter) {
    document.cookie = key + '=' + encodeURIComponent(goodCounter);
}

function setProgresMaxValue(nowCounter) {
    var progresMaxValue = 0;
    if (nowCounter < 500) {
        progresMaxValue = 100;
    } else if (nowCounter < 1000) {
        progresMaxValue = 150;
    } else {
        progresMaxValue = 200;
    }
    return progresMaxValue;
}