USE zcoredevelopdb;


/************ Update: Tables ***************/

/* Table Items: pagecontent */

/* Alter Columns */
ALTER TABLE pagecontent ADD pageInsertedBy INTEGER NOT NULL;


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