SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `topspejder`.`menuitems` DROP COLUMN `fk_userright_id` , ADD COLUMN `fk_userrightId` INT(11) NULL DEFAULT NULL  AFTER `menuItemParameters` , 
  ADD CONSTRAINT `fk_menuItems_userrights`
  FOREIGN KEY (`fk_userrightId` )
  REFERENCES `topspejder`.`userrights` (`userRightsId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_organisation_id`
  FOREIGN KEY (`fk_organisationId` )
  REFERENCES `topspejder`.`organisation` (`organisationId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `fk_menuItems_userrights` 
, ADD INDEX `fk_menuItems_userrights` (`fk_userrightId` ASC) 
, ADD INDEX `fk_organisation_id` (`fk_organisationId` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
