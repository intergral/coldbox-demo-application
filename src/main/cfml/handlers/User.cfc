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