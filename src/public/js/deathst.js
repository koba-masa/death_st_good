const URL_SELECT = 'https://koba-masa.com/DeathStGood/select';
const URL_UPDATE = 'https://koba-masa.com/DeathStGood/update';

var upCounter = 0;

$(window).on('load', function() {
    upCounter = 0;
    var nowCounter = selectCounter();
    setGoodCounter(nowCounter);
    setProgresMaxValue(nowCounter);
})

function setGoodCounter(goodCounter) {
    $('#goodCounter').text(goodCounter);
}

function good() {
    var nowCounter = parseInt($('#goodCounter').text(), 10);
    nowCounter = nowCounter + 1;
    upCounter = upCounter + 1
    setGoodCounter(nowCounter);
    $('#goodTime').attr('class', '');
    $('#goodMark').attr('onclick', 'good();');
    return;
}

function updateTime() {
    var progresValue = parseInt($('#goodTime').attr('value'), 10);
    var progresMaxValue = parseInt($('#goodTime').attr('max'), 10);
    if (progresValue < progresMaxValue) {
        $('#goodTime').attr('value', progresValue + 1);
        setTimeout(updateTime, 100);
    } else {
        $('#goodMark').attr('onclick', '');
        updateCounter(upCounter);
    }
    return;
}

function selectCounter() {
    var result = sendForm(URL_SELECT, 'GET', {});
    return parseInt(result['good_counter'], 10);
}

function updateCounter(goodCounter) {
    sendForm(URL_UPDATE, 'GET', {'good_counter' : encodeURIComponent(goodCounter)});
    var result = selectCounter();
    setGoodCounter(result[key]);
    return;
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
    $('#goodTime').attr('max', progresMaxValue);
    return;
}

function sendForm(targetUrl, httpMethod,  sendData) {
    var outputData;
    $.ajax(
        targetUrl,
        {
            type: httpMethod,
            async: false,
            dataType: 'json',
            data: sendData,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(
                    'content-type', 'application/x-www-form-urlencoded;charset=utf-8'
                );
            }
        }).done(function(data, status, xhrtr){
            outputData = data;
        }
    )
    return outputData;
}
