$(document).ready(function(){
  var apikey = '13F4A11D04654F69AD3D247D5D00FA1B';
  $('#form').submit(function(){
    var query = $(this).children('input[name="q"]').val();
    if(!query) return false;
    $.ajax({
    url: 'http://otter.topsy.com/search.js',
      data: {
        apikey: apikey,
        q: 'site:instagr.am ' + query,
        allow_lang: 'ja'
      },
      dataType: 'jsonp',
      success: function (json){
        var entries = json.response.list;
        if(!entries) return;
        $.each(entries, function(){
          console.log(this.content);
          console.log(this.medium_thumbnail);
        });
      }
    });
    return false;
  });
});
