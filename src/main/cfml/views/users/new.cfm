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

<div class="col-lg-6 col-lg-offset-3">
    <h1>Sign Up page</h1>
<cfoutput>
    #html.startForm(action="user.create")#
    #html.entityFields(entity=prc.user, groupwrapper="div class='form-group'", class="form-control")#
    #html.submitButton(class="btn btn-primary")# or #html.href(href="?event=static.home",text="Cancel")#
    #html.endForm()#
</cfoutput>
</div>