$(function() {
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});

$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        room_id = $element.data('room-id')
        messageTemplate = $('[data-role="message-template"]');
    $.ajax({
      type:"GET",
      url:"/rooms/"+room_id,
      dataType:"json",
      success:function(result){
        for (data of result) {
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(moment(data.updated_at).calendar(null,{
            lastDay : '[Yesterday] hh:mm',
            sameDay : '[Today] hh:mm',
            nextDay : '[Tomorrow] hh:mm',
            lastWeek : 'DD MMM hh:mm',
          }));
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0);
        }
      },
    })
  });
});