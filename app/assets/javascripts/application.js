// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic_ui/semantic_ui
//= require nivo
//= require jstree

var ready = function() {

  // Sign out modal
  $("a.sign_out").on("click", function(e) {
    $('#sign_out_modal') .modal({ blurring: true }).modal('show');  
    e.preventDefault();
  });

  // Delete out modal
  $("a.delete_modal").on("click", function(e) {
    $('#delete_modal') .modal({ blurring: true }).modal('show');  
    e.preventDefault();
  });

  // Close messages
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });

  // Admin Menu
  $('.sidebar')
    .sidebar('setting', 'transition', 'scale down')
    .sidebar('setting', 'mobileTransition', 'push')
    .sidebar('attach events', '.admin.item');

  // Selection Dropdowns
  $('.ui.dropdown').dropdown();

  // Search in Main Menu
  $('.ui.search').search({
    type: 'category',
    minCharacters: 2,
    apiSettings: {
      url: '/search/{query}'
    }
  });

  // Tag search and selection 
  // (needs to be after the general selection dropdowns)
  $('#tag_selection').dropdown({
    apiSettings: {
      url: '/tags/{query}'
    }
  });
	
  // Remove Fields in Recipe
  $('form').on('click', '.remove_fields', function(event) {
     $(this).prev('input[type=hidden]').val('1');
     $(this).closest('.remove_fields_container').hide();
     event.preventDefault();
  });

  // Add Fields in Recipe
  $('form').on('click', '.add_fields', function(event) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $('.ui.dropdown').dropdown();
    event.preventDefault();
  });

  // Start Nivo-Slider
  $('#slider').nivoSlider();

  // Start JS-Tree
  $('#tree').jstree({
    'core' : {
      'check_callback': true,
      'data': {
        'url': function (node) { return node.id === '#' ? '/pages.json' : '/pages/' + node.id + '/children';  }
      }
    },
    "plugins" : [ "contextmenu" ]
  }).on('create_node.jstree', function(e, data){
    alert(JSON.stringify(data));
  }).on('rename_node.jstree', function(e, data){
    alert(JSON.stringify(data));
  }).on('delete_node.jstree', function(e, data){
    alert(JSON.stringify(data));
  });
};

$(document).on('turbolinks:load', ready);
