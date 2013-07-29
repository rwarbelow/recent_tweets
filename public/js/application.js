$(document).ready(function() {
  if ($('#loading_tweets').length > 0) {
    var username = $('h1').data('username')
    $.post('/js/gettweets', {username: username}, function(response){
      $('body').html(response)
    })
  } 
  if ($('#loading_followers').length > 0) {
    var username = $('h1').data('username')
    $.post('/js/getfollowers', {username: username}, function(response){
      $('body').html(response)
    })
  }
})
