-- +migrate Up
alter table beginners.comics add thumb_color varchar(255);
update beginners.comics set thumb_color='black' where id='1';
update beginners.comics set thumb_color='black' where id='2';
update beginners.comics set thumb_color='light_blue' where id='3';
update beginners.comics set thumb_color='white' where id='4';
update beginners.comics set thumb_color='red' where id='5';
update beginners.comics set thumb_color='white' where id='6';
update beginners.comics set thumb_color='white' where id='7';
update beginners.comics set thumb_color='light_blue' where id='8';
update beginners.comics set thumb_color='white' where id='9';
update beginners.comics set thumb_color='red' where id='10';
update beginners.comics set thumb_color='black' where id='11';
update beginners.comics set thumb_color='black' where id='12';
update beginners.comics set thumb_color='light_blue' where id='13';
update beginners.comics set thumb_color='white' where id='14';
update beginners.comics set thumb_color='pink' where id='15';
update beginners.comics set thumb_color='pink' where id='16';
update beginners.comics set thumb_color='white' where id='17';

-- +migrate Down
alter table beginners.comics drop column thumb_color;