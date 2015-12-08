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