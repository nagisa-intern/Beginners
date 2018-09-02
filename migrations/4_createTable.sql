-- +migrate Down
CREATE TABLE beginners.comic_comment(
  id        INT           NOT NULL  COMMENT 'コメントid'  PRIMARY KEY auto_increment,
  comic_id  INT           NOT NULL  COMMENT '作品id',
  comment     VARCHAR(255)  NOT NULL  COMMENT 'コメント',
  FOREIGN KEY(comic_id)   REFERENCES comics(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='コメントデータ';

-- +migrate Down
drop table beginners.comic_comment;