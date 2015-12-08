
component extends="coldbox.system.Bootstrap" {
    this.name = "ColdBox";
    this.mappings[ "/cborm" ] = COLDBOX_APP_ROOT_PATH & "modules/cborm";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,10,0);
    this.setClientCookies = true;
    this.datasource = "coldboxtestapp";
    this.ormEnabled = true;
    this.invokeImplicitAccessor = true;
    this.ormSettings = {
        dbcreate = "update",
        logSQL      = false,
        flushAtRequestEnd = false,
        autoManageSession = false,
        eventHandling       =  true,
        eventHandler      = "cborm.models.EventHandler"
    };
    this.javaSettings = {
        LoadPaths = [".\javaLibs\"],
        loadColdFusionClassPath = true,
        reloadOnChange= true,
        watchInterval = 100,
        watchExtensions = "jar,class,xml"
    };
}