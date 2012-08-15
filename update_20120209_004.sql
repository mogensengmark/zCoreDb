USE topspejder;


/************ Add Foreign Keys to Database ***************/

/************ Foreign Key: fk_menuItems_menuItems ***************/
ALTER TABLE menuItems ADD CONSTRAINT fk_menuItems_menuItems
	FOREIGN KEY (parentItemId) REFERENCES menuItems (menuItemId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/************ Foreign Key: fk_menuItems_menus ***************/
ALTER TABLE menuItems ADD CONSTRAINT fk_menuItems_menus
	FOREIGN KEY (fk_menuId) REFERENCES menus (menuId)
	ON UPDATE NO ACTION ON DELETE NO ACTION;