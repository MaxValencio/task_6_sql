-- Drop tables
DROP TABLE IF EXISTS "STUDENTS", "GROUPS", "COURSES", "STUDENTS_COURSES" CASCADE;

-- Create tables
CREATE TABLE "GROUPS"(
	"GROUP_ID"      integer 		PRIMARY KEY,
	"NAME"          varchar(25)	 	NOT NULL,
	CONSTRAINT group_pk CHECK ("GROUP_ID" > 0)
);

CREATE TABLE "STUDENTS"(
	"STUDENT_ID"    integer			PRIMARY KEY,
	"GROUP_ID"      integer 		REFERENCES "GROUPS",
	"FIRST_NAME"    varchar(25)		NOT NULL,
	"LAST_NAME"     varchar(25)		NOT NULL,
	CONSTRAINT students_pk CHECK ("STUDENT_ID" > 0)
);

CREATE TABLE "COURSES"(
	"COURSE_ID"     integer 		PRIMARY KEY,
	"NAME"          varchar(25)		NOT NULL,
	"DESCRIPTION"   varchar(25)		NOT NULL,
	CONSTRAINT group_pk CHECK ("COURSE_ID" BETWEEN 0 AND 7)
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

INSERT INTO "COURSES" VALUES(1, 'JavaEE', 'Java Enterprise Edition');
INSERT INTO "COURSES" VALUES(2, 'Java', 'Core Java');
INSERT INTO "COURSES" VALUES(3, 'PHP', 'Frontend');
INSERT INTO "COURSES" VALUES(4, 'JavaScript', 'Basic');

--Create many-to-many relation
CREATE TABLE "STUDENTS_COURSES" (
    "STUDENT_ID"    integer		REFERENCES "STUDENTS"("STUDENT_ID"),
    "COURSE_ID"     integer		REFERENCES "COURSES"("COURSE_ID"),
CONSTRAINT student_id_course_id_pk PRIMARY KEY ( "STUDENT_ID", "COURSE_ID")
);

--Insert data in table
INSERT INTO "STUDENTS_COURSES" VALUES(1, 1);
INSERT INTO "STUDENTS_COURSES" VALUES(15, 1);
INSERT INTO "STUDENTS_COURSES" VALUES(10, 2);
INSERT INTO "STUDENTS_COURSES" VALUES(17, 4);
INSERT INTO "STUDENTS_COURSES" VALUES(5, 3);
INSERT INTO "STUDENTS_COURSES" VALUES(7, 4);
INSERT INTO "STUDENTS_COURSES" VALUES(1, 4);

--Check result
SELECT "COURSES"."NAME" AS "COURSE", "STUDENTS"."FIRST_NAME", "STUDENTS"."LAST_NAME"
FROM "STUDENTS_COURSES"
INNER JOIN "STUDENTS" ON ("STUDENTS_COURSES"."STUDENT_ID" = "STUDENTS"."STUDENT_ID")
INNER JOIN "COURSES" ON ("STUDENTS_COURSES"."COURSE_ID" = "COURSES"."COURSE_ID")
ORDER BY "COURSES"."NAME";




	
	