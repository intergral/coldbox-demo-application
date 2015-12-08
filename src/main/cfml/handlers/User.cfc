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

    property name ="userService" inject="entityService:User";

    function list()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("User: list");
        prc.users = userService.list( asQuery = false);
        event.setView("users/list");
    }

    function create(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("User: Create");
        user = populateModel(userService.new());
        var s = structNew();
        s.username = user.username;
        var c = userService.findWhere(s);
        if (NOT isNull(c)) {
            getInstance("messagebox@cbmessagebox").error("Username must be unique.");
            prc.user = user;
            event.setView("users/new");
        }
        else
            if (user.isValid()) {
                var frapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI");
                frapi.getInstance().trace("Creating new User: " & user.firstname & " " & user.lastname );
                userService.save(user);
                Event.setValue("user", user.firstname);
                SESSION.current_user = user.id;
                setNextEvent("user.home");
            }
            else {
                getInstance("messagebox@cbmessagebox").error(messageArray = user.getValidationResults().getAllErrors());
                prc.user = user;
                event.setView("users/new");
            }
    }

    function home(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("User: home");
        if (NOT StructKeyExists(SESSION, "current_user")) {
            setNextEvent("static.home");
        }
        else {
            prc.user = userService.get(SESSION.current_user);
            cfheader(name = "userid", value = prc.user.id);
            Event.setView("users/home");
        }
    }

    function new(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("User: new");
        prc.user = userService.new();
        Event.setView("users/new");
    }

    function delete(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("User: delete");
        if (NOT StructKeyExists(SESSION, "current_user")) {
            setNextEvent("static.home");
        }
        else {
            userService.deleteByID(SESSION.current_user);
            StructDelete(SESSION, "current_user");
            setNextEvent("static.home");
        }
    }
}