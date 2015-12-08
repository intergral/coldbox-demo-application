<ul>
<cfloop index="user" array="#prc.users#">
    <li>
        <ul>
            <li><cfoutput>#user.username#</cfoutput></li>
            <li><cfoutput>#user.firstname#</cfoutput></li>
            <li><cfoutput>#user.lastname#</cfoutput></li>
            <li><cfoutput>#user.password#</cfoutput></li>
        </ul>
    </li>
</cfloop>
</ul>