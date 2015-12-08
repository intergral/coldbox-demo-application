// Copyright 2015 Intergral GmbH

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
component {

    property name="userService" inject="entityService:User";

    function create(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Session: create");
        var s = structNew();
        s.username=rc.username;
        var c = userService.findWhere(s);
        if(isNull(c))
        {
            getInstance("messagebox@cbmessagebox").error("Username or password is incorrect.");
            cfheader(statusText ="Unauthorised", statusCode = "401");
            Event.setView("sessions/new");
        }
        else
        {
            SESSION.current_user = c.id;
            setNextEvent("user.home");
        }
    }

    function new()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Session: new");
        Event.setView("sessions/new");
    }

    function destroy(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Session: destroy");
        StructDelete(SESSION, "current_user");
        setNextEvent("static.home");
    }
}