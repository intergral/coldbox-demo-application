component {

    property name ="productService" inject="entityService:Product";
    property name ="userService" inject="entityService:User";

    function preHandler()
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Shop: preHandler");
        if (NOT StructKeyExists(SESSION, "current_user")) {
            var frapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI");
            var impl = frapi.getInstance();
            impl.trace("No current user, redirecting to home.(static.home)");
            impl.getActiveTransaction().setDescription("No current user, redirecting to home.(static.home)");
            setNextEvent("static.home");
        }
    }

    function list(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Shop: list");
        prc.products = productService.list(asQuery = false);

        if(structKeyExists(SESSION, "cart"))
        {
            var total = 0;
            var realCart = structNew();
            var cart = ListToArray(SESSION.cart);
            for(var i = 1; i lte arrayLen(cart); i++){
                var pro = productService.get(cart[i]);
                total += pro.price;
                if(structKeyExists(realCart, pro.id))
                {
                    realCart[pro.id].count = realCart[pro.id].count +1;
                }
                else
                {
                    var product = structNew();
                    product.pro = pro;
                    product.count = 1;
                    realCart[pro.id] = product;
                }
            }
            prc.realCart = realCart;
            prc.total = total;
        }

        Event.setView("shop/list");
    }

    function buy(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Shop: buy");
        var id = rc.id;
        if(NOT isNull(id))
        {
            var product = productService.get(id);
            if(NOT isNull(product))
            {
                if (NOT structKeyExists(SESSION, "cart")) {
                    SESSION.cart = id;
                }
                else {
                    SESSION.cart = SESSION.cart & "," & id;
                }
                getInstance("messagebox@cbmessagebox").info("Added " & product.name & " to cart.");
            }
        }
        setNextEvent("shop.list");
    }

    function remove(event, rc, prc)
    {
        createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance().getActiveTransaction().setDescription("Shop: remove");
        if(structKeyExists(SESSION, "cart"))
        {
            var id = rc.id;
            var product = productService.get(id);
            if(NOT isNull(id))
            {
                var cart = SESSION.cart;
                SESSION.cart = listDeleteAt( cart, ListFind(cart, id) );
                getInstance("messagebox@cbmessagebox").info("Removed " & product.name & " from cart.");
                if(ListLen(SESSION.cart) IS 0)
                {
                    structDelete(SESSION, "cart");
                }
            }
        }
        setNextEvent("shop.list");
    }

    function checkout(event, re, prc)
    {
        var frapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI");
        var frapiImpl = frapi.getInstance();
        frapiImpl.getActiveTransaction().setDescription("Shop: checkout");
        var tran = frapiImpl.createTrackedTransaction("checkout");
        var user = userService.get(SESSION.current_user);
        if(structKeyExists(SESSION, "cart"))
        {
            if(structKeyExists(SESSION, "cart"))
            {
                var total = 0;
                var realCart = structNew();
                var cart = ListToArray(SESSION.cart);
                for(var i = 1; i lte arrayLen(cart); i++){
                    var pro = productService.get(cart[i]);
                    total += pro.price;
                    if(structKeyExists(realCart, pro.id))
                    {
                        realCart[pro.id].count = realCart[pro.id].count +1;
                    }
                    else
                    {
                        var product = structNew();
                        product.pro = pro;
                        product.count = 1;
                        realCart[pro.id] = product;
                    }
                }
                tran.setDescription("User " & user.username & " bought a cart with a value of: $" & total);
                frapiImpl.postNumericAggregateMetric("coldbox.sales", total);
                tran.addAggregate("Sales", total);
            }
            structDelete(SESSION, "cart");
        }
        tran.close();
        getInstance("messagebox@cbmessagebox").info("Cart purchased.");
        setNextEvent("shop.list");
    }
}