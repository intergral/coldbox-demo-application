<div class="col-lg-6 col-lg-offset-3">
    <h1>Sign Up page</h1>
<cfoutput>
    #html.startForm(action="user.create")#
    #html.entityFields(entity=prc.user, groupwrapper="div class='form-group'", class="form-control")#
    #html.submitButton(class="btn btn-primary")# or #html.href(href="?event=static.home",text="Cancel")#
    #html.endForm()#
</cfoutput>
</div>