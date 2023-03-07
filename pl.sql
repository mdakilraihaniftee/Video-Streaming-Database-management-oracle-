DROP TABLE react;
DROP TABLE watch;
DROP TABLE playlistVideos;
DROP TABLE playlist;
DROP TABLE videoQuality;
DROP TABLE video;
DROP TABLE subscription;
DROP TABLE channel;
DROP TABLE users;




create table users(
    user_id INTEGER primary key,
    user_name VARCHAR(40),
    user_email VARCHAR(60),
    user_gender VARCHAR(10),
    user_birthday date,
    user_country VARCHAR(30),
    user_extra_column VARCHAR(20)
);

create TABLE channel(
    channel_id INTEGER PRIMARY KEY,
    channel_name VARCHAR(40),
    channel_publish_date DATE,
    channel_privacy VARCHAR(20),
    channel_type VARCHAR(20),
    user_id INTEGER,
    foreign key(user_id) REFERENCES users(user_id)
);

create Table subscription(
    subscription_id int PRIMARY KEY,
    subscription_date date,
    user_id INTEGER,
    channel_id INTEGER,
    foreign key (user_id) REFERENCES users(user_id),
    foreign key (channel_id) REFERENCES channel(channel_id)
);

create TABLE video(
    video_id INTEGER PRIMARY KEY,
    channel_id INTEGER,
    video_title VARCHAR(100),
    video_language VARCHAR(20),
    video_upload_date date,
    video_duration int,
    video_type VARCHAR(20),
    video_privacy VARCHAR(20),
    foreign key (channel_id) REFERENCES channel(channel_id)
);

CREATE TABLE videoQuality(
    video_quality_id INTEGER PRIMARY KEY,
    video_id INTEGER,
    video_quality VARCHAR(20),
    foreign key (video_id) REFERENCES video(video_id)
);

create table playlist(
    playlist_id INTEGER primary key,
    user_id INTEGER,
    playlist_name VARCHAR(50),
    playlist_creation_date date,
    playlist_privacy VARCHAR(20),
    foreign key (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlistVideos(
    playlist_id INTEGER,
    video_id INTEGER,
    save_date DATE,
    foreign key (video_id) REFERENCES video(video_id),
    foreign key (playlist_id) REFERENCES playlist(playlist_id)
);

create table watch(
    watch_id int PRIMARY KEY,
    user_id INTEGER,
    video_quality_id INTEGER,
    watch_date date,
    foreign key (user_id) REFERENCES users(user_id),
    foreign key (video_quality_id) REFERENCES videoQuality(video_quality_id)
);

create TABLE react(
    react_id int PRIMARY KEY,
    user_id INTEGER,
    video_id INTEGER,
    react_date DATE,
    react_type VARCHAR(30),
    foreign key (user_id) REFERENCES users(user_id),
    foreign key (video_id) REFERENCES video(video_id)
);



INSERT INTO users (user_id,user_name,user_email,user_gender,user_birthday,user_country) VALUES(1, 'Mahin','mahin@gmail.com','male','19-MAY-1999','Bangladesh');
INSERT INTO users (user_id,user_name,user_email,user_gender,user_birthday,user_country) VALUES(2, 'Alex','alex@gmail.com','male','29-JUL-1999','Japan');
INSERT INTO users (user_id,user_name,user_email,user_gender,user_birthday,user_country) VALUES(3, 'Lucy','lucy@gmail.com','female','29-JUL-2003','Korea');




INSERT INTO channel(channel_id,user_id,channel_name,channel_publish_date,channel_privacy,channel_type) VALUES(1,1,'Physics Club','12-SEP-2013','Public','Educational');
INSERT INTO channel(channel_id,user_id,channel_name,channel_publish_date,channel_privacy,channel_type) VALUES(2,2,'Magic Show','14-NOV-2019','Public','Entertainment');
INSERT INTO channel(channel_id,user_id,channel_name,channel_publish_date,channel_privacy,channel_type) VALUES(3,3,'LucyWorld','30-SEP-2020','Public','Travel');
INSERT INTO channel(channel_id,user_id,channel_name,channel_publish_date,channel_privacy,channel_type) VALUES(4,1,'Math World','22-MAY-2015','public','Educational');


INSERT INTO subscription(subscription_id,user_id,channel_id,subscription_date) VALUES(1,3,1,'12-AUG-2016');
INSERT INTO subscription(subscription_id,user_id,channel_id,subscription_date) VALUES(2,3,2,'07-DEC-2019');
INSERT INTO subscription(subscription_id,user_id,channel_id,subscription_date) VALUES(3,2,1,'09-MAR-2014');


INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(1,1,'motion and force','English','09-DEC-2013',122,'Educational','public');
INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(2,4,'stright line','Bangla','11-JUL-2015',32,'Educational','public');
INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(3,1,'viscocity','Bangla','17-NOV-2014',45,'Educational','unlisted');
INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(4,2,'Incredible Brush','Japanese','17-NOV-2019',15,'Funny','public');
INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(5,2,'U can never see me','English','13-FEB-2015',19,'Terrible','public');
INSERT INTO video(video_id,channel_id,video_title,video_language,video_upload_date,video_duration,video_type,video_privacy) VALUES(6,3,'Tajmahal tour','English','30-SEP-2020',22,'Traveling','private');


INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(1,1,'360p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(2,1,'480p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(3,2,'360p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(4,2,'480p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(5,3,'360p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(6,3,'480p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(7,3,'720p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(8,4,'480p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(9,4,'720p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(10,5,'480p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(11,5,'720p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(12,5,'1080p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(13,6,'720p');
INSERT INTO videoQuality(video_quality_id, video_id,video_quality) VALUES(14,6,'1080p');



INSERT INTO playlist(playlist_id,user_id,playlist_name,playlist_creation_date,playlist_privacy) VALUES(1,1,'phyicsLovers','17-SEP-2017','Public');
INSERT INTO playlist(playlist_id,user_id,playlist_name,playlist_creation_date,playlist_privacy) VALUES(2,1,'Eduhackers','08-AUG-2017','Public');
INSERT INTO playlist(playlist_id,user_id,playlist_name,playlist_creation_date,playlist_privacy) VALUES(3,3,'AllFavourites','21-AUG-2021','Private');
INSERT INTO playlist(playlist_id,user_id,playlist_name,playlist_creation_date,playlist_privacy) VALUES(4,2,'GameShow','18-JAN-2022','public');




INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(1,1,'02-NOV-2017');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(1,3,'11-FEB-2018');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(2,1,'11-AUG-2017');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(2,3,'23-JAN-2018');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(2,2,'05-NOV-2019');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(4,4,'23-JAN-2022');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(3,2,'22-FEB-2021');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(3,3,'24-MAR-2021');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(4,5,'09-APR-2022');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(3,4,'01-JAN-2022');
INSERT INTO playlistVideos(playlist_id,video_id,save_date) VALUES(3,5,'22-MAR-2022');




INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(1,1,1,'02-JAN-2014');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(2,1,4,'24-DEC-2015');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(3,2,6,'01-NOV-2016');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(4,2,9,'11-MAR-2020');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(5,3,3,'25-NOV-2016');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(6,3,7,'01-APR-2017');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(7,3,11,'28-AUG-2020');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(8,3,14,'13-JAN-2022');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(9,3,14,'17-FEB-2022');
INSERT INTO watch(watch_id,user_id,video_quality_id,watch_date) VALUES(10,1,13,'15-MAR-2022');


INSERT INTO react(react_id,user_id,video_id,react_date,react_type) VALUES(1,3,2,'25-NOV-2016','like');
INSERT INTO react(react_id,user_id,video_id,react_date,react_type) VALUES(2,3,6,'13-JAN-2022','like');
INSERT INTO react(react_id,user_id,video_id,react_date,react_type) VALUES(3,2,3,'01-NOV-2016','dislike');
INSERT INTO react(react_id,user_id,video_id,react_date,react_type) VALUES(4,1,6,'15-MAR-2022','like');



--show 1st 3 book title of video table 
SET SERVEROUTPUT ON
DECLARE
CURSOR VIDEO_CUR IS SELECT video_id , video_title FROM video;
VIDEO_INFO VIDEO_CUR%ROWTYPE;
BEGIN
OPEN VIDEO_CUR;
    LOOP
        FETCH  VIDEO_CUR INTO VIDEO_INFO;
        EXIT WHEN VIDEO_CUR%ROWCOUNT>3;
        DBMS_OUTPUT.PUT_LINE('VIDEO ID: ' || VIDEO_INFO.video_id || ' VIDEO TITLE: ' || VIDEO_INFO.video_title);
    END LOOP;
CLOSE VIDEO_CUR;
END;
/




SELECT count(r.react_type) 
FROM react r full OUTER JOIN  video v
on v.video_id=r.video_id;

--Self Join
--(max video_duration no.)

select v.video_duration from video v MINUS
select v.video_duration from video v join video w on v.video_duration<w.video_duration;


--check if a video is short standard or long 
SET SERVEROUTPUT ON
DECLARE


i_n video.video_duration%TYPE;

BEGIN
    i_n :=&num;
    if i_n<20 THEN
        dbms_output.put_line('short video');
    elsif i_n>=20 and i_n<=40 then
        dbms_output.put_line('standard video');
    else
        dbms_output.put_line('long video');
    END IF;
END;
/


alter table users 
add 
create or replace TRIGGER trig before INSERT or UPDATE
on Users
FOR EACH ROW
DECLARE
C DATE;
BEGIN
SELECT sysdate into c from dual;
if(c-:new.user_birthday)>17 THEN
    :new.user_type:='Mature';
ELSE
    :new.user_type:='Child';
end if;
END;
/


CREATE or REPLACE PROCEDURE add_playlist
(
    p_id playlist.playlist_id%type,
    u_id playlist.user_id%type,
    p_name playlist.playlist_name%type,
    p_date playlist.playlist_creation_date%type,
    p_pri playlist.playlist_privacy% type
)
is 

BEGIN

INSERT INTO playlist(playlist_id,user_id,playlist_name,playlist_creation_date,playlist_privacy) 
VALUES(p_id,u_id,p_name,p_date,p_pri);
COMMIT;

END add_playlist;
/
BEGIN
add_playlist(5,2,'Release World','23-JUN-2022','public');
END;
/



CREATE or REPLACE view birth_view as
SELECT USER_NAME,user_birthday
from user;



create or replace function fun return video.video_duration%type IS
var video.video_duration%type;
BEGIN
select avg(video_duration) into var from video;
return var;
END;
/

SET SERVEROUTPUT ON
BEGIN
dbms_output.put_line('avg video duration ' || fun);
end;
/






SELECT e.fname,d.name, l.regional_group
from (employee e join department d on e.dept_id = d.dept_id and d.name='RESEARCH') join  location l
on d.location_id=l.location_id;




