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