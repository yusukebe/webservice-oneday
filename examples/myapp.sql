DROP DATABASE IF EXISTS myapp;
CREATE DATABASE myapp;
USE myapp;

CREATE TABLE entry (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(255),
    body TEXT NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    created_on DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET 'utf8' engine=InnoDB;

INSERT INTO entry
(title, body, user_id, created_on)
VALUES
('This is title', 'Body Text', 1, '2013-07-23 14:00:00');

