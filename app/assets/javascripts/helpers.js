$(document).on('page:change', function () {
    $('table').on('click', 'tr', function() {
        $(this).toggleClass('minimized_table_cell');        
    });    
});
