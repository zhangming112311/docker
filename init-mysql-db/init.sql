create user 'zhangming' identified with mysql_native_password by 'zm@474577048';
grant all privileges on *.* to 'zhangming';
flush privileges;
create database oauth2;
use oauth2;
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
)ENGINE=InnoDB CHARSET=utf8mb4;

create table oauth_client_token (
authentication_id VARCHAR(256),
  token_id VARCHAR(256),
  token blob,
  
  user_name VARCHAR(256),
  client_id VARCHAR(256),
	PRIMARY KEY (`authentication_id`)
)ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `oauth_access_token` (
`token_id` varchar(255) NOT NULL,
`token` blob,
`authentication_id` varchar(255) DEFAULT NULL,
`user_name` varchar(255) DEFAULT NULL,
`client_id` varchar(255) DEFAULT NULL,
`authentication` blob,
`refresh_token` varchar(255) DEFAULT NULL,
PRIMARY KEY (`token_id`));


create table oauth_refresh_token (
  token_id VARCHAR(256),
  token blob,
  authentication blob
)ENGINE=InnoDB CHARSET=utf8mb4;

create table oauth_code (
  code VARCHAR(256), authentication blob
)ENGINE=InnoDB CHARSET=utf8mb4;

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
)ENGINE=InnoDB CHARSET=utf8mb4;

INSERT IGNORE INTO `oauth2`.`oauth_client_details` (`client_id`, `resource_ids`, `client_secret`,scope,authorized_grant_types,web_server_redirect_uri,authorities) 
VALUES ('1',"oauth2-resource,mobile-resource",'beer', 'read,write,trust','authorization_code,password,refresh_token,implicit,client_credentials','',"ROLE_UNITY,ROLE_USER");
INSERT IGNORE INTO `oauth2`.`oauth_client_details` (`client_id`, `resource_ids`, `client_secret`,scope,authorized_grant_types,web_server_redirect_uri,authorities) 
VALUES ('resourceServer',"oauth2-resource,mobile-resource",'resourceServersecret', 'read,write,trust','authorization_code,password,refresh_token,implicit,client_credentials','',"ROLE_UNITY,ROLE_USER");


CREATE TABLE IF NOT EXISTS `oauth2`.`users` (
`id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
`enabled` INT NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `oauth2`.`authorities` (
`id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(45) NOT NULL,
`authority` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`));

INSERT IGNORE INTO `oauth2`.`authorities` VALUES (NULL, 'john', 'write');
INSERT IGNORE INTO `oauth2`.`users` VALUES (NULL, 'john', '12345', '1');