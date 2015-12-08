## Building ##

To build run __mvn clean package__.

## Installing App ##

To install the app follow on of the two modes.

In either mode you need to create the datasource "coldboxtestapp"

For Derby in memory use the following.

- Driver = Other
- URL = jdbc:derby:memory:coldbox;create=true;__fusionreactor_name=ColdBox;
- Class = org.apache.derby.jdbc.EmbeddedDriver

### FusionReactor ###

This application is built for testing FusionReactor's ability to monitor a Coldbox/ColdFusion application.

Visit [FusionReactor](http://www.fusion-reactor.com) for more information on getting a license for FusionReactor.

### Long JDBC Request ###

This application has a script that simulates a long JDBC request using a sleep.

This unfortunately is not easy in Derby databases. If you want to use the long JDBC request page,
you will need to connect to one of the following databases and change the SQL in the file __views/static/jdbcSleep.cfm__.

- MSSQL / Sybase (WAITFOR DELAY '00:00:00')
- Oracle (CALL DBMS_LOCK.Sleep(00))
- PostgreSQL (SELECT pg_sleep(00))
- MySQL / MariaDB (SELECT SLEEP(00))

### Required Coldbox modules ###

This application requires the following coldbox modules

- cborm
- cbi18n
- cbvalidation
- cbmessagebox
- profilebox

### ColdFusion Instance ###

- Extract the build artifact into the wwwroot directory.
- Final structure should look like wwwroot/coldbox and wwwroot/CTA
 
### Tomcat Instance ###

- Install the cfusion.war by putting it into the webapps directory
- Once the cfusion.war has been exploded into the webapps/cfusion directory
- Extract the build artifact into the webapps/cfusion directory
- Final structure should look like webapps/cfusion/coldbox and webapps/cfusion/CTA