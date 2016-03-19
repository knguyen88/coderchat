$(document).ready(function () {
    $('[data-role="user-picker"]').each(function () {
        var $this = $(this);
        var a = $this.tagsinput({
            typeahead: {
                source: JSON.parse($this.attr('data-users')),
                afterSelect: function() {
                    this.$element.val('');
                }
            },
            itemText: 'name',
            itemValue: 'id'
        });
    });
});