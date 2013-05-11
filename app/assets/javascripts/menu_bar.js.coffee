$ ->
	$("#btnBar").click ->
		$(this.el).css("display", "block")

	$("#btnBar").click ->
	  $("#dialog-confirm").dialog
    resizable: false
    height: 300
    modal: true
    buttons:
      "Cancelar": ->
        jQuery(this).dialog "close"