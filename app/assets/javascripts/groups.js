$(function(){
  $('.draggable').draggable({
    connectToSortable: ".sortable",
    revert: "invalid"
  });

  // $('.sortable').sortable({
  //   revert: true,
  //   stop: function (e, ui) {

  //   }
  // });
  // $( ".sortable" ).disableSelection();

  $('.droppable').droppable({
    greedy: true,
    accept: ".draggable",
    drop: function( e, ui ) {
      e.stopImmediatePropagation();
      var element = ui.draggable[0]
      that = $(this);
      var group = this.dataset.group;
      console.log(element.dataset.group)
      console.log(group)
      if(group != element.dataset.group) {
        var student = element.dataset.student;
        var prevGroup = element.dataset.group;

        $.ajax({
          type: 'PUT',
          url: '/students/' + student,
          data: {
            group_id: group,
            prev_group: prevGroup
          }
        }).done(function(data) {
          element.dataset.group = group;
          element.removeAttribute('style')

          parent = that.parent()
          ul = parent.find('ul')
          ul.append(element)

          // debugger
          // this.append(element)
        });
      }
    }
  });
})