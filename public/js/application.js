$(document).ready(function() {
  // Vote buttons for questions
  $('.container').on('click', 'button.q-upvote-button', function(event) {
    event.preventDefault();
    // console.log("clicked");
    var button = $(this);
    var url = '/questions/' + button.data().questionId + '/upvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      button.siblings('h3').children().children().text(responseData)
      // console.log(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });
  });

  $('.container').on('click', 'button.q-downvote-button', function(event) {
    event.preventDefault();
    // console.log("clicked");
    var button = $(this);
    var url = '/questions/' + button.data().questionId + '/downvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      button.siblings('h3').children().children().text(responseData)
      // console.log(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });
  });

 // Vote buttons for answers
  $('.container').on('click', 'button.a-upvote-button', function(event) {
    event.preventDefault();
    console.log("clicked");
    var button = $(this);
    var url = '/questions/' + button.data().questionId + '/answers/' + button.data().answerId + '/upvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      button.parent().find('span#answ-vote-count').text(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });
  });

  $('.container').on('click', 'button.a-downvote-button', function(event) {
    event.preventDefault();
    // console.log("clicked");
    var button = $(this);
    var url = '/questions/' + button.data().questionId + '/answers/' + button.data().answerId + '/downvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      button.siblings('h3').children().children().text(responseData)
      // console.log(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });


  });

  $(".answer_comment_form").hide();
  $(".question_comment_form").hide();

  $("#answer_form").on("submit", function(e) {
    e.preventDefault();
    //console.log("hello");
    var form = $(this);

    $.ajax({
      url: form.attr("action"),
      type: form.attr("method"),
      data: form.serialize()
    })
    .done(function(resp) {
     //console.log(resp)
      var list_item = $( ".answer:first" ).clone();
      list_item.find("p").text(resp.body);
      list_item.find(".author").text(resp.solver);
      list_item.appendTo(".answer_list");
    })
    .fail(function(resp) {
      alert(resp.responseText);
    });
  });


  $(".answer_comment_button").on("click", function(e) {
    e.preventDefault();
    $(this).hide();
    $(this).siblings("form").first().show();
  });

  $(".answer_comment_form").on("submit", function(e) {
    e.preventDefault();
    //console.log("hello");
    var form = $(this);
    var item = form.parent();

    $.ajax({
      url: form.attr("action"),
      type: form.attr("method"),
      data: form.serialize()
    })
    .done(function(resp) {
     console.log(resp);
      var list_item = $( ".answer_comment:first" ).clone();
      list_item.find(".answer_comment_body").text(resp.body);
      list_item.find(".author").text(resp.commentor);
      item.append(list_item);
      form.hide();
      $(".answer_comment_button").show();
    })
    .fail(function(resp) {
      alert(resp.responseText);
    });
  });

 $(".question_comment_button").on("click", function(e) {
    e.preventDefault();
    $(this).hide();
    $(this).siblings("form").first().show();
  });

  $(".question_comment_form").on("submit", function(e) {
    e.preventDefault();
    //console.log("hello");
    var form = $(this);
    var item = $("#question");

    $.ajax({
      url: form.attr("action"),
      type: form.attr("method"),
      data: form.serialize()
    })
    .done(function(resp) {
     console.log(resp);
      var list_item = $( ".question_comment:first" ).clone();
      list_item.find(".question_comment_body").text(resp.body);
      list_item.find(".author").text(resp.commentor);
      item.append(list_item);
      form.hide();
      $(".question_comment_button").show();
    })
    .fail(function(resp) {
      alert(resp.responseText);
    });
  });


});
