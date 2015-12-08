## Building ##

To build run __mvn clean package__.

## Installing App ##

To install the app follow on of the two modes.

In either mode you need to create the datasource "coldboxtestapp"

For Derby in memory use the following.

- Driver = Other
- URL = jdbc:derby:memory:coldbox;create=true;__fusionreactor_name=ColdBox;
- Class = org.apache.derby.jdbc.EmbeddedDriver

### ColdFusion Instance ###

- Extract the build artifact into the wwwroot directory.
- Final structure should look like wwwroot/coldbox and wwwroot/CTA
 
### Tomcat Instance ###

- Down load the cfusion.war file from nexus [here](http://nexus/nexus/service/local/repositories/releases/content/com/adobe/coldfusion/cfusion11/1.0.0/cfusion11-1.0.0.war)
- Install the cfusion.war by putting it into the webapps directory
- Once the cfusion.war has been exploded into the webapps/cfusion directory
- Extract the build artifact into the webapps/cfusion directory
- Final structure should look like webapps/cfusion/coldbox and webapps/cfusion/CTA