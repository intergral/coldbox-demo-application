component {
		
	// Configure ColdBox Application
	function configure(){
        validation = {
            /*manager = "",*/
            sharedConstraints = {

            }
        };
        messagebox = {
            // The default HTMl template for emitting the messages
            template        = "/CTA/views/fragments/MessageBox.cfm",
            // Override the internal styles, true to override
            styleOverride   = false
        };
        orm = { injection = { enabled=true } };
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "coldbox",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,
			customErrorTemplate		= '/coldbox/system/includes/BugReport.cfm',
            requestStartHandler		= "Static.onRequestStart",
            applicationStartHandler = "Static.onApplicationStart",
			//Implicit Events
			defaultEvent			= "static.home",
				
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
			
		interceptors = [
			// Need to configure the tracer appender after confguration loads 
			// otherwise the debugger module won't have been loaded yet.
			//{ class="#appMapping#.interceptors.LogBox" }
		];
		
	}

}