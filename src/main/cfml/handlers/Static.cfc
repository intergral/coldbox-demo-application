component {

    property name ="userService" inject="entityService:User";
    property name ="productService" inject="entityService:Product";

    function home()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: home");
        Event.setView("static/home");
    }

    function onApplicationStart()
    {
        //createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: appstart");
        //var path =  dataDirectory = getDirectoryFromPath(getCurrentTemplatePath()) & "../resources/data.json";
        //var fileCont = fileRead(path);
        //var json = deserializeJSON(fileCont);
        //var users = json.users;
        //for( var i=1; i lte ArrayLen(users); i++ ){
        //    userService.save(userService.new(users[i]));
        //}
        //var products = json.products;
        //for( var i=1; i lte ArrayLen(products); i++ ){
        //    productService.save(productService.new(products[i]));
        //}
    }

    function onRequestStart()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: requeststart");
        if(StructKeyExists(SESSION, "current_user"))
        {
            prc.user = userService.get(SESSION.current_user);
            var frapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI");
            var impl = frapi.getInstance();
            impl.trace("Current user: " & prc.user.firstname & " " & prc.user.lastname);
        }
    }


    function exceptionExample()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: exception");
        try {
            exception = createObject( "java", "java.lang.RuntimeException" )
                    .init( javaCast( "string", "Something went wrong!" ) );

            throw( object = exception );

        } catch ( java.lang.RuntimeException error ) {
            var frapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI");
            var impl = frapi.getInstance();
            impl.getActiveMasterTransaction().setTrappedThrowable(error);
            cfheader(statusText ="Internal Server Error", statusCode = "500");
            throw( object = error );
        }
    }

    function longjdbc()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: longjdbc");

        event.setView("static/jdbcSleep");
    }

    function longrequest()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Static: longrequest");
        var thr = createObject("java", "java.lang.Thread");
        thr.sleep(5000);
        event.setView("static/done");
    }
}