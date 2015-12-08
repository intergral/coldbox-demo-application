component persistent="true" table="users"  extends="cborm.models.ActiveEntity" {

    property name ="id" column="userid" fieldtype="id" generator="increment" setter="false";
    property name ="FirstName" column="firstname" ormType="string";
    property name ="LastName" column="lastname" ormType="string";
    property name ="Username" column="username" ormType="string";
    property name ="Password" column="password" ormType="string";

    this.constraints = {
        firstname = { required = true },
        lastname = { required = true },
        username = { required = true },
        password = { required = true }
    };
}