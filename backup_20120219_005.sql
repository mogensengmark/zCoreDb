SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `topspejder` DEFAULT CHARACTER SET utf8 ;
USE `topspejder` ;

-- -----------------------------------------------------
-- Table `topspejder`.`adress`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`adress` (
  `adressId` INT(11) NOT NULL AUTO_INCREMENT ,
  `street` VARCHAR(64) NOT NULL ,
  `number` INT(11) NOT NULL ,
  `floor` VARCHAR(10) NULL DEFAULT NULL ,
  `side` VARCHAR(10) NULL DEFAULT NULL ,
  `zip` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`adressId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`blogs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`blogs` (
  `blogId` INT(11) NOT NULL AUTO_INCREMENT ,
  `blogName` VARCHAR(64) NOT NULL ,
  PRIMARY KEY (`blogId`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`organisation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`organisation` (
  `organisationId` INT(11) NOT NULL AUTO_INCREMENT ,
  `organisationName` VARCHAR(64) NOT NULL ,
  `organizationParentId` INT(11) NOT NULL ,
  `fk_adressId` INT(11) NOT NULL ,
  PRIMARY KEY (`organisationId`) ,
  INDEX `fk_organisation_adress` (`fk_adressId` ASC) ,
  INDEX `fk_organisation_organisation` (`organizationParentId` ASC) ,
  CONSTRAINT `fk_organisation_adress`
    FOREIGN KEY (`fk_adressId` )
    REFERENCES `topspejder`.`adress` (`adressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisation_organisation`
    FOREIGN KEY (`organizationParentId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`userroles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`userroles` (
  `userRolesId` INT(11) NOT NULL AUTO_INCREMENT ,
  `userRole` VARCHAR(64) NOT NULL ,
  `fk_organisationId` INT(11) NOT NULL DEFAULT '1' ,
  `allowInherit` INT(11) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`userRolesId`) ,
  INDEX `fk_userRoles_organisation` (`fk_organisationId` ASC) ,
  CONSTRAINT `fk_userRoles_organisation`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT ,
  `firstName` VARCHAR(64) NOT NULL ,
  `middleName` VARCHAR(64) NULL DEFAULT NULL ,
  `lastName` VARCHAR(64) NOT NULL ,
  `login` VARCHAR(64) NOT NULL ,
  `password` VARCHAR(64) NOT NULL ,
  `fk_adressId` INT(11) NOT NULL ,
  `fk_userRolesId` INT(11) NOT NULL ,
  `fk_organisationId` INT(11) NOT NULL ,
  `birthday` VARCHAR(8) NOT NULL ,
  `gender` TINYINT(4) NOT NULL ,
  `renewPassword` TINYINT(4) NOT NULL ,
  `userState` TINYINT(4) NOT NULL ,
  `memberStartDate` DATE NOT NULL ,
  PRIMARY KEY (`userId`) ,
  INDEX `fk_users_adress` (`fk_adressId` ASC) ,
  INDEX `fk_users_organisation` (`fk_organisationId` ASC) ,
  INDEX `fk_users_userRoles` (`fk_userRolesId` ASC) ,
  CONSTRAINT `fk_users_adress`
    FOREIGN KEY (`fk_adressId` )
    REFERENCES `topspejder`.`adress` (`adressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_organisation`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_userRoles`
    FOREIGN KEY (`fk_userRolesId` )
    REFERENCES `topspejder`.`userroles` (`userRolesId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`blogentries`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`blogentries` (
  `blogEntryId` INT(11) NOT NULL AUTO_INCREMENT ,
  `headLine` VARCHAR(64) NOT NULL ,
  `subHeader` VARCHAR(64) NOT NULL ,
  `content` TEXT NOT NULL ,
  `entryCreated` DATETIME NOT NULL ,
  `entryCreatedBy` INT(11) NOT NULL ,
  `entryEdited` DATETIME NOT NULL ,
  `entryEditedBy` INT(11) NOT NULL ,
  `fk_blogsId` INT(11) NOT NULL ,
  PRIMARY KEY (`blogEntryId`) ,
  INDEX `fk_blogEntries_users_created` (`entryCreatedBy` ASC) ,
  INDEX `fk_blogEntries_users_edited` (`entryEditedBy` ASC) ,
  INDEX `fk_blogEntries_blogs` (`fk_blogsId` ASC) ,
  CONSTRAINT `fk_blogEntries_blogs`
    FOREIGN KEY (`fk_blogsId` )
    REFERENCES `topspejder`.`blogs` (`blogId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogEntries_users_created`
    FOREIGN KEY (`entryCreatedBy` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogEntries_users_edited`
    FOREIGN KEY (`entryEditedBy` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`userrights`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`userrights` (
  `userRightsId` INT NOT NULL AUTO_INCREMENT ,
  `userRightName` VARCHAR(64) NULL ,
  `userRightDescription` VARCHAR(64) NULL ,
  `fk_organisationId` INT NULL ,
  PRIMARY KEY (`userRightsId`) ,
  INDEX `fk_organisation_userrights` (`fk_organisationId` ASC) ,
  CONSTRAINT `fk_organisation_userrights`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topspejder`.`menuitems`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`menuitems` (
  `menuItemId` INT(11) NOT NULL AUTO_INCREMENT ,
  `menuItemLabel` VARCHAR(64) NOT NULL ,
  `menuItemController` VARCHAR(64) NOT NULL ,
  `menuItemAction` VARCHAR(64) NOT NULL ,
  `menuItemParameters` VARCHAR(64) NOT NULL ,
  `fk_userrightId` INT(11) NULL ,
  `fk_organisationId` INT(11) NULL ,
  PRIMARY KEY (`menuItemId`) ,
  UNIQUE INDEX `menuItemId` (`menuItemId` ASC) ,
  INDEX `fk_menuItems_userrights` (`fk_userrightId` ASC) ,
  INDEX `fk_organisation_id` (`fk_organisationId` ASC) ,
  CONSTRAINT `fk_menuItems_userrights`
    FOREIGN KEY (`fk_userrightId` )
    REFERENCES `topspejder`.`userrights` (`userRightsId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisation_id`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`menus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`menus` (
  `menuId` INT(11) NOT NULL AUTO_INCREMENT ,
  `menuName` VARCHAR(64) NOT NULL ,
  `fk_organisationId` INT(11) NOT NULL ,
  PRIMARY KEY (`menuId`) ,
  UNIQUE INDEX `menuId` (`menuId` ASC) ,
  INDEX `fk_menus_organisation` (`fk_organisationId` ASC) ,
  CONSTRAINT `fk_menus_organisation`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`pagetypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`pagetypes` (
  `pageTypeId` INT(11) NOT NULL AUTO_INCREMENT ,
  `pageType` VARCHAR(64) NOT NULL ,
  PRIMARY KEY (`pageTypeId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`pages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`pages` (
  `pageName` VARCHAR(64) NOT NULL ,
  `fk_organisationId` INT(11) NOT NULL ,
  `fk_pageTypeId` INT(11) NOT NULL ,
  `pageState` TINYINT(4) NOT NULL ,
  `pageId` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`pageId`) ,
  INDEX `fk_pages_organisation` (`fk_organisationId` ASC) ,
  INDEX `fk_pages_pageTypes` (`fk_pageTypeId` ASC) ,
  CONSTRAINT `fk_pages_organisation`
    FOREIGN KEY (`fk_organisationId` )
    REFERENCES `topspejder`.`organisation` (`organisationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pages_pageTypes`
    FOREIGN KEY (`fk_pageTypeId` )
    REFERENCES `topspejder`.`pagetypes` (`pageTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`pagecontent`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`pagecontent` (
  `pageContentId` INT(11) NOT NULL AUTO_INCREMENT ,
  `pageContent` TEXT NOT NULL ,
  `pageInserted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `fk_pageId` INT(11) NOT NULL ,
  `pageInsertedBy` INT(11) NOT NULL ,
  PRIMARY KEY (`pageContentId`) ,
  INDEX `fk_pageContent_pages` (`fk_pageId` ASC) ,
  INDEX `fk_pageContent_users` (`pageInsertedBy` ASC) ,
  CONSTRAINT `fk_pageContent_pages`
    FOREIGN KEY (`fk_pageId` )
    REFERENCES `topspejder`.`pages` (`pageId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pageContent_users`
    FOREIGN KEY (`pageInsertedBy` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`pagesblogsmap`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`pagesblogsmap` (
  `fk_pageId` INT(11) NOT NULL ,
  `fk_blogId` INT(11) NOT NULL ,
  INDEX `fk_pagesblogsmap_blogs` (`fk_blogId` ASC) ,
  INDEX `fk_pagesblogsmap_pages` (`fk_pageId` ASC) ,
  CONSTRAINT `fk_pagesblogsmap_blogs`
    FOREIGN KEY (`fk_blogId` )
    REFERENCES `topspejder`.`blogs` (`blogId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagesblogsmap_pages`
    FOREIGN KEY (`fk_pageId` )
    REFERENCES `topspejder`.`pages` (`pageId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`usercontacttypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`usercontacttypes` (
  `userContactTypeId` INT(11) NOT NULL AUTO_INCREMENT ,
  `contactType` VARCHAR(64) NOT NULL ,
  PRIMARY KEY (`userContactTypeId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`usercontact`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`usercontact` (
  `fk_usersId` INT(11) NOT NULL ,
  `fk_userContactType_id` INT(11) NOT NULL ,
  `contactValue` VARCHAR(128) NOT NULL ,
  INDEX `fk_userContact_userContactTypes` (`fk_userContactType_id` ASC) ,
  INDEX `fk_userContact_users` (`fk_usersId` ASC) ,
  CONSTRAINT `fk_userContact_userContactTypes`
    FOREIGN KEY (`fk_userContactType_id` )
    REFERENCES `topspejder`.`usercontacttypes` (`userContactTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userContact_users`
    FOREIGN KEY (`fk_usersId` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`userrelationtypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`userrelationtypes` (
  `userRelationTypesId` INT(11) NOT NULL AUTO_INCREMENT ,
  `userRelationType` VARCHAR(64) NOT NULL ,
  PRIMARY KEY (`userRelationTypesId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`userrelations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`userrelations` (
  `userRelationFrom` INT(11) NOT NULL ,
  `userRelationTo` INT(11) NOT NULL ,
  `fk_userRelationTypesId` INT(11) NOT NULL ,
  INDEX `fk_userRelations_userRelationTypes` (`fk_userRelationTypesId` ASC) ,
  INDEX `fk_userRelations_users_FROM` (`userRelationFrom` ASC) ,
  INDEX `fk_userRelations_users_TO` (`userRelationTo` ASC) ,
  CONSTRAINT `fk_userRelations_userRelationTypes`
    FOREIGN KEY (`fk_userRelationTypesId` )
    REFERENCES `topspejder`.`userrelationtypes` (`userRelationTypesId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRelations_users_FROM`
    FOREIGN KEY (`userRelationFrom` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRelations_users_TO`
    FOREIGN KEY (`userRelationTo` )
    REFERENCES `topspejder`.`users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `topspejder`.`userroles-userrights-map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`userroles-userrights-map` (
  `userRolesId` INT NOT NULL ,
  `userRightsId` INT NULL ,
  INDEX `fk_userroles_userroles-userrights-map` (`userRolesId` ASC) ,
  INDEX `fk_userrights_userroles-userrights-map` (`userRightsId` ASC) ,
  CONSTRAINT `fk_userroles_userroles-userrights-map`
    FOREIGN KEY (`userRolesId` )
    REFERENCES `topspejder`.`userroles` (`userRolesId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userrights_userroles-userrights-map`
    FOREIGN KEY (`userRightsId` )
    REFERENCES `topspejder`.`userrights` (`userRightsId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topspejder`.`menus-menuitems-map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `topspejder`.`menus-menuitems-map` (
  `menusMenuItemsMapId` INT(11) NOT NULL AUTO_INCREMENT ,
  `fk_menusId` INT(11) NULL ,
  `fk_menuItemsId` INT(11) NULL ,
  `fk_parentItemId` INT(11) NULL ,
  `menuItemWeight` INT(11) NULL ,
  PRIMARY KEY (`menusMenuItemsMapId`) ,
  INDEX `fk_menu_menus-menuitems-map` (`fk_menusId` ASC) ,
  INDEX `fk_menuitems_menus-menuitems-map` (`fk_menuItemsId` ASC) ,
  CONSTRAINT `fk_menu_menus-menuitems-map`
    FOREIGN KEY (`fk_menusId` )
    REFERENCES `topspejder`.`menus` (`menuId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuitems_menus-menuitems-map`
    FOREIGN KEY (`fk_menuItemsId` )
    REFERENCES `topspejder`.`menuitems` (`menuItemId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '					';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
