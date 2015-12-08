<!---
Copyright 2015 Intergral GmbH

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--->

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