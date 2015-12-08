<style>
    td {
        padding: 5px;
    }
</style>

<div class="col-lg-6 col-lg-offset-3">
    <h1>Welcome <em><cfoutput>#prc.user.firstname#</cfoutput>&nbsp;<cfoutput>#prc.user.lastname#</cfoutput></em><hr /><small>Your Details:</small></h1>
    <hr />
    <table>
        <tr>
            <td><strong>Username</strong></td>
            <td>:</td>
            <td><cfoutput>#prc.user.username#</cfoutput></td>
        </tr>
        <tr>
            <td><strong>First Name</strong></td>
            <td>:</td>
            <td><cfoutput>#prc.user.firstname#</cfoutput></td>
        </tr>
        <tr>
            <td><strong>Last Name</strong></td>
            <td>:</td>
            <td><cfoutput>#prc.user.lastname#</cfoutput></td>
        </tr>
    </table>
    <hr />

    <a href="?event=user.delete" class="btn btn-primary pull-right">Delete Account</a>
</div>