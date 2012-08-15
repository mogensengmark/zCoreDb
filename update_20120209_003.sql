USE topspejder;


/************ Add Foreign Keys to Database ***************/
/*-----------------------------------------------------------
Warning: Versions of MySQL prior to 4.1.2 require indexes on all columns involved in a foreign key. The following indexes may be required: 
fk_menuItems_menuItems may require an index on table: menuItems, column: parentItemId
fk_menuItems_menus may require an index on table: menuItems, column: fk_menuId
fk_menus_organisation may require an index on table: menus, column: fk_organisationId
-----------------------------------------------------------
*/

/************ Foreign Key: fk_menuItems_menuItems ***************/
ALTER TABLE menuItems ADD CONSTRAINT fk_menuItems_menuItems
	FOREIGN KEY (parentItemId) REFERENCES menuItems (menuItemId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/************ Foreign Key: fk_menuItems_menus ***************/
ALTER TABLE menuItems ADD CONSTRAINT fk_menuItems_menus
	FOREIGN KEY (fk_menuId) REFERENCES menus (menuId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/************ Foreign Key: fk_menus_organisation ***************/
ALTER TABLE menus ADD CONSTRAINT fk_menus_organisation
	FOREIGN KEY (fk_organisationId) REFERENCES organisation (organisationId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;