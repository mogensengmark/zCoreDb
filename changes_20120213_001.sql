SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `topspejder`.`menuitems` DROP COLUMN `menuItemLink` , DROP COLUMN `menuItemTitle` , ADD COLUMN `menuItemLabel` VARCHAR(64) NOT NULL  AFTER `menuItemId` , ADD COLUMN `menuItemController` VARCHAR(64) NOT NULL  AFTER `menuItemLabel` , ADD COLUMN `menuItemAction` VARCHAR(64) NOT NULL  AFTER `menuItemController` , ADD COLUMN `fk_userright_id` INT(11) NULL DEFAULT NULL  AFTER `fk_menuId` , 
  ADD CONSTRAINT `fk_menuItems_userrights`
  FOREIGN KEY (`fk_userright_id` )
  REFERENCES `topspejder`.`userrights` (`userRightsId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_menuItems_userrights` (`fk_userright_id` ASC) ;

ALTER TABLE `topspejder`.`pagecontent` 
  ADD CONSTRAINT `fk_pageContent_users`
  FOREIGN KEY (`pageInsertedBy` )
  REFERENCES `topspejder`.`users` (`userId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_pageContent_users` (`pageInsertedBy` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
