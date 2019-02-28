-- Drop tables
DROP TABLE IF EXISTS "STUDENTS", "GROUPS", "COURSES", "STUDENTS_COURSES" CASCADE;

-- Create tables
CREATE TABLE "GROUPS"(
	"GROUP_ID"		integer 		PRIMARY KEY,
	"NAME"			varchar(25)		NOT NULL,
	CONSTRAINT group_pk CHECK ("GROUP_ID" > 0)
);

CREATE TABLE "STUDENTS"(
	"STUDENT_ID" 	integer			PRIMARY KEY,
	"GROUP_ID" 		integer 		REFERENCES "GROUPS",
	"FIRST_NAME"	varchar(25)		NOT NULL,
	"LAST_NAME"		varchar(25)		NOT NULL,
	CONSTRAINT students_pk CHECK ("STUDENT_ID" > 0)
);


-- Insert data in the tables
INSERT INTO "GROUPS" VALUES(1, 'VM - 01');
INSERT INTO "GROUPS" VALUES(2, 'VM - 02');
INSERT INTO "GROUPS" VALUES(3, 'SM - 01');
INSERT INTO "GROUPS" VALUES(4, 'SR - 01');
INSERT INTO "GROUPS" VALUES(5, 'SR - 02');

INSERT INTO "STUDENTS" VALUES(1, 1, 'Николай', 'Харченко');
INSERT INTO "STUDENTS" VALUES(2, 1, 'Олексей', 'Богданов');
INSERT INTO "STUDENTS" VALUES(3, 1, 'Тимофей', 'Васейко');
INSERT INTO "STUDENTS" VALUES(4, 1, 'Оксана', 'Рубаненко');
INSERT INTO "STUDENTS" VALUES(5, 1, 'Татьяна', 'Немашкало');
INSERT INTO "STUDENTS" VALUES(6, 1, 'Михаил', 'Сторожко');
INSERT INTO "STUDENTS" VALUES(7, 1, 'Артём', 'Яшин');
INSERT INTO "STUDENTS" VALUES(8, 1, 'Дмитрий', 'Файнер');
INSERT INTO "STUDENTS" VALUES(9, 1, 'Елена', 'Хаченкова');
INSERT INTO "STUDENTS" VALUES(10, 1, 'Николай', 'Лепский');
INSERT INTO "STUDENTS" VALUES(11, 1, 'Евгений', 'Сушко');
INSERT INTO "STUDENTS" VALUES(12, 2, 'Михаил', 'Купцов');
INSERT INTO "STUDENTS" VALUES(13, 2, 'Дмитрий', 'Васеленко');
INSERT INTO "STUDENTS" VALUES(14, 2, 'Катерина', 'Рубан');
INSERT INTO "STUDENTS" VALUES(15, 2, 'Алёна', 'Чванина');
INSERT INTO "STUDENTS" VALUES(16, 2, 'Богдан', 'Богомол');
INSERT INTO "STUDENTS" VALUES(17, 2, 'Андрей', 'Яшинко');
INSERT INTO "STUDENTS" VALUES(18, 3, 'Дмитрий', 'Фоменко');
INSERT INTO "STUDENTS" VALUES(19, 3, 'Елена', 'Конотоп');
INSERT INTO "STUDENTS" VALUES(20, 3, 'Семён', 'Коваленко');
INSERT INTO "STUDENTS" VALUES(21, 4, 'Николай', 'Тризуб');
INSERT INTO "STUDENTS" VALUES(22, 4, 'Олексей', 'Шаповал');
INSERT INTO "STUDENTS" VALUES(23, 4, 'Анатолий', 'Киценко');
INSERT INTO "STUDENTS" VALUES(24, 4, 'Оксана', 'Митина');
INSERT INTO "STUDENTS" VALUES(25, 4, 'Екатерина', 'Шарикало');
INSERT INTO "STUDENTS" VALUES(26, 5, 'Михаил', 'Шевченко');
INSERT INTO "STUDENTS" VALUES(27, 5, 'Артём', 'Дудка');
INSERT INTO "STUDENTS" VALUES(28, 5, 'Дмитрий', 'Бондар');
INSERT INTO "STUDENTS" VALUES(29, 5, 'Елена', 'Божедай');

--Delete all students from group with name "SR-01" 
DELETE FROM "STUDENTS"
	WHERE  "STUDENTS"."GROUP_ID" 
	IN (SELECT "GROUP_ID" 
		FROM "GROUPS"
		WHERE "NAME" = 'SR - 01');
	
--Check result
SELECT "NAME" AS "GROUP_NAME", "STUDENT_ID", "FIRST_NAME", "LAST_NAME" 
	FROM "GROUPS", "STUDENTS"
	WHERE "GROUPS"."GROUP_ID" = "STUDENTS"."GROUP_ID";

	
	