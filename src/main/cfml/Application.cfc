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