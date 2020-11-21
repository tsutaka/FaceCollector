CREATE DATABASE fc;
USE fc;
DROP TABLE video_list;
CREATE TABLE video_list (
	video_id int AUTO_INCREMENT,
    video_name nchar(32),
    video_path nchar(128),
    create_date datetime, 
    update_date datetime, 
    INDEX (video_id)
);
INSERT INTO video_list VALUES(
	0,
    'testname',
    '/testpath',
    cast('2020-11-20 23:58:01' as datetime),
    cast('2009-08-03 23:58:01' as datetime)
)
SELECT * FROM video_list;

    
    
