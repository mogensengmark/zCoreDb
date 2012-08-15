SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `topspejder`.`menuitems` DROP FOREIGN KEY `fk_organisation_id` ;

ALTER TABLE `topspejder`.`menuitems` DROP COLUMN `fk_organisation_id` , ADD COLUMN `fk_organisationId` INT(11) NULL DEFAULT NULL  AFTER `fk_userright_id` , DROP FOREIGN KEY `fk_menuItems_userrights` ;

ALTER TABLE `topspejder`.`menuitems` 
  ADD CONSTRAINT `fk_menuItems_userrights`
  FOREIGN KEY (`fk_userright_id` )
  REFERENCES `topspejder`.`userrights` (`userRightsId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_organisation_id`
  FOREIGN KEY (`fk_organisationId` )
  REFERENCES `topspejder`.`organisation` (`organisationId` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `fk_organisation_id` 
, ADD INDEX `fk_organisation_id` (`fk_organisationId` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
