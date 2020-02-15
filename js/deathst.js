//$('img#goodMark').click(function() {
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
    }
}
