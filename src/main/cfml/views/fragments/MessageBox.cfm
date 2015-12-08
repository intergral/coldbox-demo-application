<cfscript>
    switch (msgStruct.type) {
        case "info" : {
            local.cssType = " alert-info";
            local.iconType = "icon-info-sign";
            break;
        }
        case "error" : {
            local.cssType = " alert-danger";
            local.iconType = "icon-minus-sign";
            break;
        }
        case "warning" : {
            local.cssType = " alert-warning";
            local.iconType = "icon-minus-sign";
            break;
        }
        default : {
        local.cssType = "";
        local.iconType = "icon-warning-sign";
        }
    }
    if(msgStruct.message IS "Cart purchased.")
    {
        local.cssType = " alert-success";
        local.iconType = "icon-warning-sign";
    }
</cfscript>
<cfoutput>
    <div class="alert#local.cssType#" style="min-height: 38px">
    <button type="button" class="close" data-dismiss="alert">×</button>
        <i class="#local.iconType# icon-large icon-2x pull-left"></i> #msgStruct.message#
    </div>
</cfoutput>