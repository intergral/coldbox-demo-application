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