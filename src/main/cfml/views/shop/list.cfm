<div class="row">
    <div class="col-lg-5 col-lg-offset-2">
    <h1>Coldbox Shop</h1>
    <hr />
    </div>
</div>
<div class="row">
<div class="col-lg-5 col-lg-offset-2">
    <cfset i = 0 />
    <cfloop index="product" array="#prc.products#">
        <cfif i MOD 3 IS 0 >
            <div class="row">
        </cfif>
        <cfset i = i + 1 />
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="<cfoutput>#contextPath#</cfoutput>/resources/img/products/<cfoutput>#product.image#</cfoutput>" alt="<cfoutput>#product.image#</cfoutput>" class="product-img">
                    <div class="caption" style="height:200px;">
                        <h3><cfoutput>#product.name#</cfoutput></h3>
                        <p><cfoutput>#product.description#</cfoutput></p>
                    </div>
                    <div class="row caption">
                        <div class="col-md-3">
                            <strong>&dollar;<cfoutput>#product.price#</cfoutput></strong>
                        </div>
                        <div class="col-md-9 text-right">
                            <a href="?event=shop.buy&id=<cfoutput>#product.id#</cfoutput>" class="btn btn-primary" role="button">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        <cfif i MOD 3 IS 0 OR i IS ArrayLen(#prc.products#)>
            </div>
        </cfif>
    </cfloop>
</div>
<div class="col-lg-3">
    <div class="panel panel-default">
        <div class="panel-heading"><strong>Cart</strong></div>

        <cfif NOT structKeyExists(SESSION, "cart")>
            <div class="panel-body">
                <p>Your shopping cart is currently empty.</p>
            </div>
        <cfelse>
            <table class="table table-striped">
                <tbody>
                <tr>
                    <th></th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price (Total)</th>
                    <th></th>
                </tr>

                <cfloop item="item" collection="#prc.realCart#">
                    <cfset realItem = structFind(prc.realCart, item) />
                    <cfset product = realItem.pro>
                    <tr>
                        <td><img width="20px" height="20px" alt="<cfoutput>#product.image#</cfoutput>" src="<cfoutput>#contextPath#</cfoutput>/resources/img/products/<cfoutput>#product.image#</cfoutput>"></td>
                        <td>Basketball Stress Ball</td>
                        <td class="text-right"><cfoutput>#realItem.count#</cfoutput></td>
                        <td>&dollar;<cfoutput>#product.price#</cfoutput>&nbsp;(&dollar;<cfoutput>#product.price * realItem.count#</cfoutput>)</td>
                        <td><a href="?event=shop.remove&id=<cfoutput>#product.id#</cfoutput>" class="">X</a></td>
                    </tr>
                </cfloop>
                </tbody>
            </table>
        </cfif>
        <div class="panel-footer">
            <cfif NOT structKeyExists(SESSION, "cart")>
                <div class="col-lg-12">
                    <h4>Cart is empty.</h4>
                </div>
            <cfelse>
                <div class="col-lg-6">
                    <h4 class="text-left"><strong>Total: </strong>&dollar;<cfoutput>#prc.total#</cfoutput></h4></div>
                <div class="col-lg-6">
                    <a href="?event=shop.checkout" class="btn btn-success pull-right">Checkout</a>
                </div>
            </cfif>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
</div>