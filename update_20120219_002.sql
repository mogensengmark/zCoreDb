SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `topspejder`.`menus-menuitems-map` DROP FOREIGN KEY `fk_parentItemId` ;

ALTER TABLE `topspejder`.`menus-menuitems-map` DROP FOREIGN KEY `fk_menu_menus-menuitems-map` ;

ALTER TABLE `topspejder`.`menus-menuitems-map` 
  ADD CONSTRAINT `fk_menu_menus-menuitems-map`
  FOREIGN KEY (`fk_menusId` )
  REFERENCES `topspejder`.`menus` (`menuId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `fk_parentItemId` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
