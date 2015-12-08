<div class="col-lg-6 col-lg-offset-3">
    <h1>Login page</h1>
    <script type="application/javascript">
        document.onload = function() {
            var input = document.getElementById('username');

            input.focus();
            input.select();    
        };
    </script>
<cfoutput>
    #html.startForm(action="session.create")#
    #html.textField(name="username",label="Username:", labelClass="control-label", groupwrapper="div class='form-group'", class="form-control")#
    #html.passwordField(name="password", label="Password:", labelClass="control-label", groupwrapper="div class='form-group'", class="form-control")#
    #html.submitButton(class="btn btn-primary")#
    #html.endForm()#
</cfoutput>
</div>