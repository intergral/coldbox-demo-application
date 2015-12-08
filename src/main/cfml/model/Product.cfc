component persistent="true" table="products"  extends="cborm.models.ActiveEntity" {

    property name="id" column="prodid" fieldtype="id" generator="increment" setter="false";
    property name="name" column="name" ormType="string";
    property name="description" column="description" ormType="string";
    property name="image" column="image" ormType="string";
    property name="price" column="price" ormType="double";

    this.constraints = {
        name = { required = true },
        price = { required = true }
    };
}