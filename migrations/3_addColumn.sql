-- +migrate Up
alter table beginners.comics add thumb_color varchar(255);


-- +migrate Down