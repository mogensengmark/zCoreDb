USE topspejder;


/************ Update: Tables ***************/

/******************** Add Table: menuItems ************************/

/* Build Table Structure */
CREATE TABLE menuItems
(
	menuItemId INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	menuItemTitle VARCHAR(64) NOT NULL,
	menuItemLink VARCHAR(256) NOT NULL,
	parentItemId INTEGER NOT NULL,
	menuItemWeight INTEGER NOT NULL,
	fk_menuId INTEGER NOT NULL
);

/******************** Add Table: menus ************************/

/* Build Table Structure */
CREATE TABLE menus
(
	menuId INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
	menuName VARCHAR(64) NOT NULL,
	fk_organisationId INTEGER NOT NULL
);


/************ Add Foreign Keys to Database ***************/
/*-----------------------------------------------------------
Warning: Versions of MySQL prior to 4.1.2 require indexes on all columns involved in a foreign key. The following indexes may be required: 
fk_pagecontent_users may require an index on table: pagecontent, column: pageInsertedBy
-----------------------------------------------------------
*/

/************ Foreign Key: fk_pagecontent_users ***************/
ALTER TABLE pagecontent ADD CONSTRAINT fk_pagecontent_users
	FOREIGN KEY (pageInsertedBy) REFERENCES users (userId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;