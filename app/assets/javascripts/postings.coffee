$ ->
  ids = []
  $('#image_upload').fileupload done: (e, data) ->
    ids.push data.result.picture_id
    $('#images').val ids
