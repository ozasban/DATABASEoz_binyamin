prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  departmentid INTEGER not null,
  name         CHAR(30) not null
)
;
alter table DEPARTMENT
  add primary key (DEPARTMENTID);
alter table DEPARTMENT
  add unique (NAME);

prompt Creating SOLDIER...
create table SOLDIER
(
  soldierid    INTEGER not null,
  name         CHAR(30) not null,
  borndate     DATE not null,
  profile      INTEGER not null,
  rank         INTEGER not null,
  departmentid INTEGER not null
)
;
alter table SOLDIER
  add primary key (SOLDIERID);
alter table SOLDIER
  add foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);
alter table SOLDIER
  add constraint CHK_SOLDIER_BORNDATE
  check (BornDate <= TO_DATE('01-JAN-2005', 'DD-MON-YYYY'));

prompt Creating COMMANDER...
create table COMMANDER
(
  numberofsoldiers INTEGER not null,
  soldierid        INTEGER not null
)
;
alter table COMMANDER
  add primary key (SOLDIERID);
alter table COMMANDER
  add foreign key (SOLDIERID)
  references SOLDIER (SOLDIERID);

prompt Creating DEPBOMBS...
create table DEPBOMBS
(
  maxweight    INTEGER not null,
  departmentid INTEGER not null
)
;
alter table DEPBOMBS
  add primary key (DEPARTMENTID);
alter table DEPBOMBS
  add foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);
alter table DEPBOMBS
  add constraint CHK_DEPBOMBS_MAXWEIGHT
  check (MaxWeight >= 100);

prompt Creating DEPTUNNELS...
create table DEPTUNNELS
(
  maxdepth     INTEGER not null,
  departmentid INTEGER not null
)
;
alter table DEPTUNNELS
  add primary key (DEPARTMENTID);
alter table DEPTUNNELS
  add foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);

prompt Creating WEAPON...
create table WEAPON
(
  weaponid     INTEGER not null,
  minranktouse INTEGER not null,
  name         CHAR(30) not null
)
;
alter table WEAPON
  add primary key (WEAPONID);
alter table WEAPON
  add unique (NAME);

prompt Creating EXPLOSIVES...
create table EXPLOSIVES
(
  lastdatetouse DATE not null,
  weaponid      INTEGER not null
)
;
alter table EXPLOSIVES
  add primary key (WEAPONID);
alter table EXPLOSIVES
  add foreign key (WEAPONID)
  references WEAPON (WEAPONID);

prompt Creating FIGHTER...
create table FIGHTER
(
  role      CHAR(30) not null,
  soldierid INTEGER not null
)
;
alter table FIGHTER
  add primary key (SOLDIERID);
alter table FIGHTER
  add foreign key (SOLDIERID)
  references SOLDIER (SOLDIERID);

prompt Creating ROBOTS...
create table ROBOTS
(
  maxhoursbattary INTEGER not null,
  weaponid        INTEGER not null
)
;
alter table ROBOTS
  add primary key (WEAPONID);
alter table ROBOTS
  add foreign key (WEAPONID)
  references WEAPON (WEAPONID);

prompt Creating USESEXPLOSIVE...
create table USESEXPLOSIVE
(
  departmentid INTEGER not null,
  weaponid     INTEGER not null
)
;
alter table USESEXPLOSIVE
  add primary key (DEPARTMENTID, WEAPONID);
alter table USESEXPLOSIVE
  add foreign key (DEPARTMENTID)
  references DEPBOMBS (DEPARTMENTID);
alter table USESEXPLOSIVE
  add foreign key (WEAPONID)
  references EXPLOSIVES (WEAPONID);

prompt Creating USESROBOTS...
create table USESROBOTS
(
  departmentid INTEGER not null,
  weaponid     INTEGER not null
)
;
alter table USESROBOTS
  add primary key (DEPARTMENTID, WEAPONID);
alter table USESROBOTS
  add foreign key (DEPARTMENTID)
  references DEPTUNNELS (DEPARTMENTID);
alter table USESROBOTS
  add foreign key (WEAPONID)
  references ROBOTS (WEAPONID);

prompt Truncating USESROBOTS...
truncate table USESROBOTS;
prompt Truncating USESEXPLOSIVE...
truncate table USESEXPLOSIVE;
prompt Truncating ROBOTS...
truncate table ROBOTS;
prompt Truncating FIGHTER...
truncate table FIGHTER;
prompt Truncating EXPLOSIVES...
truncate table EXPLOSIVES;
prompt Truncating WEAPON...
truncate table WEAPON;
prompt Truncating DEPTUNNELS...
truncate table DEPTUNNELS;
prompt Truncating DEPBOMBS...
truncate table DEPBOMBS;
prompt Truncating COMMANDER...
truncate table COMMANDER;
prompt Truncating SOLDIER...
truncate table SOLDIER;
prompt Truncating DEPARTMENT...
truncate table DEPARTMENT;
prompt Loading DEPARTMENT...
insert into DEPARTMENT (departmentid, name)
values (41, 'African lion                  ');
insert into DEPARTMENT (departmentid, name)
values (40, 'Australian spiny anteater     ');
insert into DEPARTMENT (departmentid, name)
values (23, 'Brocket, brown                ');
insert into DEPARTMENT (departmentid, name)
values (19, 'Buffalo, wild water           ');
insert into DEPARTMENT (departmentid, name)
values (11, 'Bulbul, black-eyed            ');
insert into DEPARTMENT (departmentid, name)
values (29, 'Cobra (unidentified)          ');
insert into DEPARTMENT (departmentid, name)
values (17, 'Common mynah                  ');
insert into DEPARTMENT (departmentid, name)
values (39, 'Common seal                   ');
insert into DEPARTMENT (departmentid, name)
values (4, 'Dingo                         ');
insert into DEPARTMENT (departmentid, name)
values (15, 'Eastern white pelican         ');
insert into DEPARTMENT (departmentid, name)
values (25, 'Egyptian vulture              ');
insert into DEPARTMENT (departmentid, name)
values (16, 'Flicker, campo                ');
insert into DEPARTMENT (departmentid, name)
values (42, 'Flicker, campo2               ');
insert into DEPARTMENT (departmentid, name)
values (35, 'Gaur                          ');
insert into DEPARTMENT (departmentid, name)
values (9, 'Gull, lava                    ');
insert into DEPARTMENT (departmentid, name)
values (27, 'Gull, silver                  ');
insert into DEPARTMENT (departmentid, name)
values (44, 'Helmeted guinea fowl          ');
insert into DEPARTMENT (departmentid, name)
values (38, 'Heron, green-backed           ');
insert into DEPARTMENT (departmentid, name)
values (5, 'Kinkajou                      ');
insert into DEPARTMENT (departmentid, name)
values (21, 'Lechwe, kafue flats           ');
insert into DEPARTMENT (departmentid, name)
values (7, 'Loris, slender                ');
insert into DEPARTMENT (departmentid, name)
values (43, 'Macaw, blue and yellow        ');
insert into DEPARTMENT (departmentid, name)
values (45, 'Macaw, green-winged           ');
insert into DEPARTMENT (departmentid, name)
values (49, 'Marabou stork                 ');
insert into DEPARTMENT (departmentid, name)
values (33, 'Masked booby                  ');
insert into DEPARTMENT (departmentid, name)
values (50, 'Monitor, two-banded           ');
insert into DEPARTMENT (departmentid, name)
values (48, 'Monkey, black spider          ');
insert into DEPARTMENT (departmentid, name)
values (46, 'Penguin, galapagos            ');
insert into DEPARTMENT (departmentid, name)
values (36, 'Porcupine, indian             ');
insert into DEPARTMENT (departmentid, name)
values (37, 'Puna ibis                     ');
insert into DEPARTMENT (departmentid, name)
values (22, 'Red phalarope                 ');
insert into DEPARTMENT (departmentid, name)
values (30, 'Rufous-collared sparrow       ');
insert into DEPARTMENT (departmentid, name)
values (34, 'Scottish highland cow         ');
insert into DEPARTMENT (departmentid, name)
values (3, 'Small-spotted genet           ');
insert into DEPARTMENT (departmentid, name)
values (12, 'Snowy sheathbill              ');
insert into DEPARTMENT (departmentid, name)
values (28, 'Spoonbill, white              ');
insert into DEPARTMENT (departmentid, name)
values (10, 'Squirrel, arctic ground       ');
insert into DEPARTMENT (departmentid, name)
values (8, 'Stork, black-necked           ');
insert into DEPARTMENT (departmentid, name)
values (24, 'Sungazer, yellow-brown        ');
insert into DEPARTMENT (departmentid, name)
values (31, 'Tamandua, southern            ');
insert into DEPARTMENT (departmentid, name)
values (14, 'Tayra                         ');
insert into DEPARTMENT (departmentid, name)
values (47, 'Turtle, eastern box           ');
insert into DEPARTMENT (departmentid, name)
values (18, 'Turtle, long-necked           ');
insert into DEPARTMENT (departmentid, name)
values (32, 'Western spotted skunk         ');
insert into DEPARTMENT (departmentid, name)
values (1, 'Whip-tailed wallaby           ');
insert into DEPARTMENT (departmentid, name)
values (26, 'White-tailed deer             ');
insert into DEPARTMENT (departmentid, name)
values (6, 'White-tailed jackrabbit       ');
insert into DEPARTMENT (departmentid, name)
values (13, 'White-tailed jackrabbit2      ');
insert into DEPARTMENT (departmentid, name)
values (20, 'Woodpecker, downy             ');
insert into DEPARTMENT (departmentid, name)
values (2, 'Yellow-bellied marmot         ');
commit;
prompt 50 records loaded
prompt Loading SOLDIER...
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (11, 'Soldier 11                    ', to_date('08-11-1984', 'dd-mm-yyyy'), 97, 2, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (12, 'Soldier 12                    ', to_date('19-08-1989', 'dd-mm-yyyy'), 72, 4, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (13, 'Soldier 13                    ', to_date('24-11-1981', 'dd-mm-yyyy'), 84, 1, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (14, 'Soldier 14                    ', to_date('18-01-1985', 'dd-mm-yyyy'), 72, 7, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (15, 'Soldier 15                    ', to_date('21-04-1983', 'dd-mm-yyyy'), 72, 6, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (16, 'Soldier 16                    ', to_date('05-04-1980', 'dd-mm-yyyy'), 97, 3, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (17, 'Soldier 17                    ', to_date('16-08-1981', 'dd-mm-yyyy'), 97, 3, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (18, 'Soldier 18                    ', to_date('02-07-2004', 'dd-mm-yyyy'), 97, 7, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (19, 'Soldier 19                    ', to_date('08-04-1986', 'dd-mm-yyyy'), 97, 6, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (20, 'Soldier 20                    ', to_date('12-11-1998', 'dd-mm-yyyy'), 84, 8, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (21, 'Soldier 21                    ', to_date('09-07-1994', 'dd-mm-yyyy'), 84, 8, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (22, 'Soldier 22                    ', to_date('24-03-2003', 'dd-mm-yyyy'), 97, 7, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (23, 'Soldier 23                    ', to_date('04-06-2004', 'dd-mm-yyyy'), 97, 4, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (24, 'Soldier 24                    ', to_date('22-09-2002', 'dd-mm-yyyy'), 84, 7, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (25, 'Soldier 25                    ', to_date('20-06-1993', 'dd-mm-yyyy'), 97, 8, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (26, 'Soldier 26                    ', to_date('17-01-2003', 'dd-mm-yyyy'), 72, 1, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (27, 'Soldier 27                    ', to_date('18-06-1995', 'dd-mm-yyyy'), 97, 4, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (28, 'Soldier 28                    ', to_date('08-03-1995', 'dd-mm-yyyy'), 84, 2, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (29, 'Soldier 29                    ', to_date('14-02-1994', 'dd-mm-yyyy'), 84, 4, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (30, 'Soldier 30                    ', to_date('23-10-2002', 'dd-mm-yyyy'), 72, 5, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (31, 'Soldier 31                    ', to_date('20-10-1986', 'dd-mm-yyyy'), 84, 7, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (32, 'Soldier 32                    ', to_date('25-12-2002', 'dd-mm-yyyy'), 72, 8, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (33, 'Soldier 33                    ', to_date('17-12-1995', 'dd-mm-yyyy'), 72, 1, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (34, 'Soldier 34                    ', to_date('03-11-1980', 'dd-mm-yyyy'), 97, 4, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (35, 'Soldier 35                    ', to_date('26-11-1983', 'dd-mm-yyyy'), 84, 7, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (36, 'Soldier 36                    ', to_date('28-05-1987', 'dd-mm-yyyy'), 97, 1, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (37, 'Soldier 37                    ', to_date('02-05-1999', 'dd-mm-yyyy'), 97, 5, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (38, 'Soldier 38                    ', to_date('11-05-1984', 'dd-mm-yyyy'), 84, 8, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (39, 'Soldier 39                    ', to_date('24-09-1982', 'dd-mm-yyyy'), 72, 8, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (40, 'Soldier 40                    ', to_date('22-02-1989', 'dd-mm-yyyy'), 97, 8, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (41, 'Soldier 41                    ', to_date('30-03-1987', 'dd-mm-yyyy'), 72, 5, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (42, 'Soldier 42                    ', to_date('22-05-1986', 'dd-mm-yyyy'), 97, 6, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (43, 'Soldier 43                    ', to_date('05-01-2000', 'dd-mm-yyyy'), 72, 1, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (44, 'Soldier 44                    ', to_date('24-06-1980', 'dd-mm-yyyy'), 97, 2, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (45, 'Soldier 45                    ', to_date('07-01-1992', 'dd-mm-yyyy'), 97, 4, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (46, 'Soldier 46                    ', to_date('02-11-1987', 'dd-mm-yyyy'), 97, 3, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (47, 'Soldier 47                    ', to_date('12-08-1986', 'dd-mm-yyyy'), 84, 3, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (48, 'Soldier 48                    ', to_date('05-10-1980', 'dd-mm-yyyy'), 72, 5, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (49, 'Soldier 49                    ', to_date('23-08-1990', 'dd-mm-yyyy'), 84, 7, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (50, 'Soldier 50                    ', to_date('28-12-1999', 'dd-mm-yyyy'), 72, 8, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (51, 'Soldier 51                    ', to_date('15-12-2002', 'dd-mm-yyyy'), 97, 3, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (52, 'Soldier 52                    ', to_date('15-06-1996', 'dd-mm-yyyy'), 72, 6, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (53, 'Soldier 53                    ', to_date('08-09-1982', 'dd-mm-yyyy'), 97, 7, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (54, 'Soldier 54                    ', to_date('18-03-2002', 'dd-mm-yyyy'), 72, 7, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (55, 'Soldier 55                    ', to_date('17-01-1987', 'dd-mm-yyyy'), 72, 6, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (56, 'Soldier 56                    ', to_date('20-03-1980', 'dd-mm-yyyy'), 84, 3, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (57, 'Soldier 57                    ', to_date('26-09-1986', 'dd-mm-yyyy'), 84, 4, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (58, 'Soldier 58                    ', to_date('25-01-1986', 'dd-mm-yyyy'), 84, 8, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (59, 'Soldier 59                    ', to_date('08-10-1991', 'dd-mm-yyyy'), 97, 6, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (60, 'Soldier 60                    ', to_date('22-05-1989', 'dd-mm-yyyy'), 72, 1, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (61, 'Soldier 61                    ', to_date('17-06-1995', 'dd-mm-yyyy'), 97, 1, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (62, 'Soldier 62                    ', to_date('16-04-1990', 'dd-mm-yyyy'), 97, 2, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (63, 'Soldier 63                    ', to_date('08-06-2004', 'dd-mm-yyyy'), 84, 6, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (64, 'Soldier 64                    ', to_date('03-06-1985', 'dd-mm-yyyy'), 72, 2, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (65, 'Soldier 65                    ', to_date('04-07-1985', 'dd-mm-yyyy'), 84, 5, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (66, 'Soldier 66                    ', to_date('11-12-2003', 'dd-mm-yyyy'), 72, 5, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (67, 'Soldier 67                    ', to_date('02-03-1999', 'dd-mm-yyyy'), 97, 7, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (68, 'Soldier 68                    ', to_date('24-02-1987', 'dd-mm-yyyy'), 72, 6, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (69, 'Soldier 69                    ', to_date('06-07-2002', 'dd-mm-yyyy'), 84, 6, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (70, 'Soldier 70                    ', to_date('18-09-2004', 'dd-mm-yyyy'), 72, 3, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (71, 'Soldier 71                    ', to_date('07-07-2001', 'dd-mm-yyyy'), 97, 6, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (72, 'Soldier 72                    ', to_date('24-02-2002', 'dd-mm-yyyy'), 72, 8, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (73, 'Soldier 73                    ', to_date('21-07-1982', 'dd-mm-yyyy'), 72, 7, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (74, 'Soldier 74                    ', to_date('13-05-1989', 'dd-mm-yyyy'), 72, 6, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (75, 'Soldier 75                    ', to_date('04-02-1992', 'dd-mm-yyyy'), 84, 8, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (76, 'Soldier 76                    ', to_date('22-11-1981', 'dd-mm-yyyy'), 72, 4, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (77, 'Soldier 77                    ', to_date('26-07-1992', 'dd-mm-yyyy'), 72, 4, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (78, 'Soldier 78                    ', to_date('20-08-1989', 'dd-mm-yyyy'), 84, 1, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (79, 'Soldier 79                    ', to_date('10-11-1999', 'dd-mm-yyyy'), 84, 1, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (80, 'Soldier 80                    ', to_date('20-09-1998', 'dd-mm-yyyy'), 84, 6, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (81, 'Soldier 81                    ', to_date('23-09-1994', 'dd-mm-yyyy'), 97, 3, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (82, 'Soldier 82                    ', to_date('24-02-1990', 'dd-mm-yyyy'), 72, 5, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (83, 'Soldier 83                    ', to_date('13-04-1985', 'dd-mm-yyyy'), 72, 7, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (84, 'Soldier 84                    ', to_date('07-11-1990', 'dd-mm-yyyy'), 72, 3, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (85, 'Soldier 85                    ', to_date('10-08-1986', 'dd-mm-yyyy'), 72, 2, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (86, 'Soldier 86                    ', to_date('14-11-1996', 'dd-mm-yyyy'), 84, 2, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (87, 'Soldier 87                    ', to_date('01-12-1982', 'dd-mm-yyyy'), 84, 6, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (88, 'Soldier 88                    ', to_date('10-05-1981', 'dd-mm-yyyy'), 84, 6, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (89, 'Soldier 89                    ', to_date('16-01-1991', 'dd-mm-yyyy'), 84, 2, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (90, 'Soldier 90                    ', to_date('24-07-1999', 'dd-mm-yyyy'), 84, 6, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (91, 'Soldier 91                    ', to_date('06-08-1997', 'dd-mm-yyyy'), 97, 1, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (92, 'Soldier 92                    ', to_date('24-11-1983', 'dd-mm-yyyy'), 97, 3, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (93, 'Soldier 93                    ', to_date('14-10-1984', 'dd-mm-yyyy'), 97, 7, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (94, 'Soldier 94                    ', to_date('19-02-1998', 'dd-mm-yyyy'), 84, 5, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (95, 'Soldier 95                    ', to_date('04-07-1997', 'dd-mm-yyyy'), 97, 4, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (96, 'Soldier 96                    ', to_date('21-11-1994', 'dd-mm-yyyy'), 72, 1, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (97, 'Soldier 97                    ', to_date('03-07-1988', 'dd-mm-yyyy'), 97, 8, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (98, 'Soldier 98                    ', to_date('03-05-1998', 'dd-mm-yyyy'), 97, 7, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (99, 'Soldier 99                    ', to_date('28-02-1990', 'dd-mm-yyyy'), 72, 4, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (100, 'Soldier 100                   ', to_date('17-12-1993', 'dd-mm-yyyy'), 72, 6, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (101, 'Soldier 101                   ', to_date('18-01-1985', 'dd-mm-yyyy'), 97, 1, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (102, 'Soldier 102                   ', to_date('26-07-2002', 'dd-mm-yyyy'), 84, 1, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (103, 'Soldier 103                   ', to_date('31-10-1994', 'dd-mm-yyyy'), 84, 8, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (104, 'Soldier 104                   ', to_date('05-12-2004', 'dd-mm-yyyy'), 84, 7, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (105, 'Soldier 105                   ', to_date('23-05-1999', 'dd-mm-yyyy'), 97, 2, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (106, 'Soldier 106                   ', to_date('03-11-1982', 'dd-mm-yyyy'), 84, 4, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (107, 'Soldier 107                   ', to_date('19-12-1997', 'dd-mm-yyyy'), 97, 5, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (108, 'Soldier 108                   ', to_date('28-02-1984', 'dd-mm-yyyy'), 84, 4, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (109, 'Soldier 109                   ', to_date('11-11-1991', 'dd-mm-yyyy'), 72, 6, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (110, 'Soldier 110                   ', to_date('30-09-1994', 'dd-mm-yyyy'), 97, 8, 38);
commit;
prompt 100 records committed...
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (111, 'Soldier 111                   ', to_date('25-08-1981', 'dd-mm-yyyy'), 84, 5, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (112, 'Soldier 112                   ', to_date('24-08-2000', 'dd-mm-yyyy'), 84, 1, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (113, 'Soldier 113                   ', to_date('22-02-1996', 'dd-mm-yyyy'), 72, 2, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (114, 'Soldier 114                   ', to_date('28-10-1990', 'dd-mm-yyyy'), 84, 4, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (115, 'Soldier 115                   ', to_date('14-05-2002', 'dd-mm-yyyy'), 72, 6, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (116, 'Soldier 116                   ', to_date('18-04-1982', 'dd-mm-yyyy'), 97, 4, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (117, 'Soldier 117                   ', to_date('17-03-1985', 'dd-mm-yyyy'), 72, 7, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (118, 'Soldier 118                   ', to_date('17-06-1981', 'dd-mm-yyyy'), 97, 6, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (119, 'Soldier 119                   ', to_date('19-05-1984', 'dd-mm-yyyy'), 97, 1, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (120, 'Soldier 120                   ', to_date('23-05-1998', 'dd-mm-yyyy'), 84, 3, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (121, 'Soldier 121                   ', to_date('17-01-1982', 'dd-mm-yyyy'), 84, 7, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (122, 'Soldier 122                   ', to_date('21-11-1993', 'dd-mm-yyyy'), 97, 1, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (123, 'Soldier 123                   ', to_date('10-04-2004', 'dd-mm-yyyy'), 84, 1, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (124, 'Soldier 124                   ', to_date('27-10-1989', 'dd-mm-yyyy'), 84, 2, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (125, 'Soldier 125                   ', to_date('15-05-2002', 'dd-mm-yyyy'), 84, 8, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (126, 'Soldier 126                   ', to_date('04-05-1987', 'dd-mm-yyyy'), 72, 3, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (127, 'Soldier 127                   ', to_date('06-04-2002', 'dd-mm-yyyy'), 97, 2, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (128, 'Soldier 128                   ', to_date('15-05-1993', 'dd-mm-yyyy'), 84, 4, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (129, 'Soldier 129                   ', to_date('30-10-1996', 'dd-mm-yyyy'), 72, 1, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (130, 'Soldier 130                   ', to_date('22-11-1995', 'dd-mm-yyyy'), 84, 1, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (131, 'Soldier 131                   ', to_date('03-02-1990', 'dd-mm-yyyy'), 97, 8, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (132, 'Soldier 132                   ', to_date('19-10-1981', 'dd-mm-yyyy'), 97, 4, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (133, 'Soldier 133                   ', to_date('20-03-1992', 'dd-mm-yyyy'), 97, 5, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (134, 'Soldier 134                   ', to_date('14-12-2000', 'dd-mm-yyyy'), 84, 4, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (135, 'Soldier 135                   ', to_date('19-05-1997', 'dd-mm-yyyy'), 72, 6, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (136, 'Soldier 136                   ', to_date('06-10-1997', 'dd-mm-yyyy'), 84, 8, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (137, 'Soldier 137                   ', to_date('03-09-1981', 'dd-mm-yyyy'), 72, 3, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (138, 'Soldier 138                   ', to_date('08-07-1986', 'dd-mm-yyyy'), 72, 2, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (139, 'Soldier 139                   ', to_date('01-08-1998', 'dd-mm-yyyy'), 97, 8, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (140, 'Soldier 140                   ', to_date('24-12-2002', 'dd-mm-yyyy'), 72, 4, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (141, 'Soldier 141                   ', to_date('18-09-1983', 'dd-mm-yyyy'), 84, 2, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (142, 'Soldier 142                   ', to_date('28-07-1981', 'dd-mm-yyyy'), 84, 5, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (143, 'Soldier 143                   ', to_date('13-06-1996', 'dd-mm-yyyy'), 84, 4, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (144, 'Soldier 144                   ', to_date('13-11-1990', 'dd-mm-yyyy'), 72, 6, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (145, 'Soldier 145                   ', to_date('28-11-1998', 'dd-mm-yyyy'), 84, 7, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (146, 'Soldier 146                   ', to_date('04-05-2004', 'dd-mm-yyyy'), 72, 1, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (147, 'Soldier 147                   ', to_date('21-07-1990', 'dd-mm-yyyy'), 97, 3, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (148, 'Soldier 148                   ', to_date('22-09-1990', 'dd-mm-yyyy'), 97, 7, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (149, 'Soldier 149                   ', to_date('12-07-1986', 'dd-mm-yyyy'), 72, 4, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (150, 'Soldier 150                   ', to_date('30-04-2001', 'dd-mm-yyyy'), 97, 2, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (151, 'Soldier 151                   ', to_date('30-12-1999', 'dd-mm-yyyy'), 84, 2, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (152, 'Soldier 152                   ', to_date('21-02-1997', 'dd-mm-yyyy'), 97, 8, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (153, 'Soldier 153                   ', to_date('19-03-2003', 'dd-mm-yyyy'), 84, 4, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (154, 'Soldier 154                   ', to_date('05-06-1985', 'dd-mm-yyyy'), 72, 4, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (155, 'Soldier 155                   ', to_date('22-02-1998', 'dd-mm-yyyy'), 97, 6, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (156, 'Soldier 156                   ', to_date('16-08-1983', 'dd-mm-yyyy'), 72, 5, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (157, 'Soldier 157                   ', to_date('12-07-1983', 'dd-mm-yyyy'), 72, 4, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (158, 'Soldier 158                   ', to_date('08-03-1985', 'dd-mm-yyyy'), 84, 1, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (159, 'Soldier 159                   ', to_date('26-05-1985', 'dd-mm-yyyy'), 84, 5, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (160, 'Soldier 160                   ', to_date('13-10-1995', 'dd-mm-yyyy'), 97, 4, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (161, 'Soldier 161                   ', to_date('12-11-1997', 'dd-mm-yyyy'), 84, 1, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (162, 'Soldier 162                   ', to_date('22-12-1997', 'dd-mm-yyyy'), 72, 1, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (163, 'Soldier 163                   ', to_date('23-04-1997', 'dd-mm-yyyy'), 97, 8, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (164, 'Soldier 164                   ', to_date('21-10-1986', 'dd-mm-yyyy'), 72, 4, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (165, 'Soldier 165                   ', to_date('06-02-1992', 'dd-mm-yyyy'), 72, 5, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (166, 'Soldier 166                   ', to_date('16-12-2003', 'dd-mm-yyyy'), 84, 2, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (167, 'Soldier 167                   ', to_date('07-09-1988', 'dd-mm-yyyy'), 84, 3, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (168, 'Soldier 168                   ', to_date('10-06-2004', 'dd-mm-yyyy'), 72, 3, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (169, 'Soldier 169                   ', to_date('04-09-1986', 'dd-mm-yyyy'), 72, 1, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (170, 'Soldier 170                   ', to_date('16-01-1999', 'dd-mm-yyyy'), 72, 7, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (171, 'Soldier 171                   ', to_date('20-02-1990', 'dd-mm-yyyy'), 84, 7, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (172, 'Soldier 172                   ', to_date('04-09-1992', 'dd-mm-yyyy'), 97, 3, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (173, 'Soldier 173                   ', to_date('26-11-1992', 'dd-mm-yyyy'), 84, 5, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (174, 'Soldier 174                   ', to_date('01-10-1994', 'dd-mm-yyyy'), 84, 4, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (175, 'Soldier 175                   ', to_date('28-08-2002', 'dd-mm-yyyy'), 84, 3, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (176, 'Soldier 176                   ', to_date('16-06-1981', 'dd-mm-yyyy'), 72, 8, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (177, 'Soldier 177                   ', to_date('13-06-1985', 'dd-mm-yyyy'), 84, 7, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (178, 'Soldier 178                   ', to_date('04-11-2000', 'dd-mm-yyyy'), 84, 8, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (179, 'Soldier 179                   ', to_date('21-11-1999', 'dd-mm-yyyy'), 97, 4, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (180, 'Soldier 180                   ', to_date('09-09-1981', 'dd-mm-yyyy'), 84, 4, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (181, 'Soldier 181                   ', to_date('27-03-2001', 'dd-mm-yyyy'), 72, 3, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (182, 'Soldier 182                   ', to_date('28-09-1998', 'dd-mm-yyyy'), 97, 2, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (183, 'Soldier 183                   ', to_date('28-05-1996', 'dd-mm-yyyy'), 72, 5, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (184, 'Soldier 184                   ', to_date('11-10-1981', 'dd-mm-yyyy'), 84, 8, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (185, 'Soldier 185                   ', to_date('19-11-1993', 'dd-mm-yyyy'), 72, 1, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (186, 'Soldier 186                   ', to_date('20-08-1995', 'dd-mm-yyyy'), 72, 2, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (187, 'Soldier 187                   ', to_date('15-07-1986', 'dd-mm-yyyy'), 84, 5, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (188, 'Soldier 188                   ', to_date('23-06-2001', 'dd-mm-yyyy'), 84, 8, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (189, 'Soldier 189                   ', to_date('31-10-1999', 'dd-mm-yyyy'), 72, 5, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (190, 'Soldier 190                   ', to_date('11-02-1987', 'dd-mm-yyyy'), 84, 4, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (191, 'Soldier 191                   ', to_date('29-07-1997', 'dd-mm-yyyy'), 84, 5, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (192, 'Soldier 192                   ', to_date('20-11-2000', 'dd-mm-yyyy'), 84, 2, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (193, 'Soldier 193                   ', to_date('15-10-1993', 'dd-mm-yyyy'), 84, 6, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (194, 'Soldier 194                   ', to_date('23-12-2001', 'dd-mm-yyyy'), 72, 6, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (195, 'Soldier 195                   ', to_date('30-10-2002', 'dd-mm-yyyy'), 97, 7, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (196, 'Soldier 196                   ', to_date('24-12-2000', 'dd-mm-yyyy'), 84, 6, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (197, 'Soldier 197                   ', to_date('22-01-1985', 'dd-mm-yyyy'), 72, 4, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (198, 'Soldier 198                   ', to_date('28-04-1981', 'dd-mm-yyyy'), 97, 1, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (199, 'Soldier 199                   ', to_date('29-01-1989', 'dd-mm-yyyy'), 84, 3, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (200, 'Soldier 200                   ', to_date('22-10-2003', 'dd-mm-yyyy'), 72, 3, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (201, 'Soldier 201                   ', to_date('01-08-1993', 'dd-mm-yyyy'), 84, 3, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (202, 'Soldier 202                   ', to_date('19-01-1982', 'dd-mm-yyyy'), 97, 8, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (203, 'Soldier 203                   ', to_date('06-09-1984', 'dd-mm-yyyy'), 72, 7, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (204, 'Soldier 204                   ', to_date('22-04-1996', 'dd-mm-yyyy'), 84, 2, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (205, 'Soldier 205                   ', to_date('02-07-2003', 'dd-mm-yyyy'), 72, 3, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (206, 'Soldier 206                   ', to_date('28-11-1989', 'dd-mm-yyyy'), 97, 1, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (207, 'Soldier 207                   ', to_date('07-04-1994', 'dd-mm-yyyy'), 97, 3, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (208, 'Soldier 208                   ', to_date('12-04-1982', 'dd-mm-yyyy'), 84, 5, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (209, 'Soldier 209                   ', to_date('24-04-1992', 'dd-mm-yyyy'), 72, 1, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (210, 'Soldier 210                   ', to_date('18-05-2000', 'dd-mm-yyyy'), 97, 3, 27);
commit;
prompt 200 records committed...
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (211, 'Soldier 211                   ', to_date('03-10-1993', 'dd-mm-yyyy'), 72, 8, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (212, 'Soldier 212                   ', to_date('06-10-2004', 'dd-mm-yyyy'), 97, 1, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (213, 'Soldier 213                   ', to_date('16-01-1995', 'dd-mm-yyyy'), 72, 8, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (214, 'Soldier 214                   ', to_date('29-10-1995', 'dd-mm-yyyy'), 84, 8, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (215, 'Soldier 215                   ', to_date('03-04-2000', 'dd-mm-yyyy'), 72, 2, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (216, 'Soldier 216                   ', to_date('15-02-1998', 'dd-mm-yyyy'), 84, 5, 27);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (217, 'Soldier 217                   ', to_date('03-04-1983', 'dd-mm-yyyy'), 97, 6, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (218, 'Soldier 218                   ', to_date('04-12-1993', 'dd-mm-yyyy'), 72, 3, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (219, 'Soldier 219                   ', to_date('20-05-2001', 'dd-mm-yyyy'), 72, 4, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (220, 'Soldier 220                   ', to_date('05-05-1989', 'dd-mm-yyyy'), 97, 6, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (221, 'Soldier 221                   ', to_date('16-07-1986', 'dd-mm-yyyy'), 97, 2, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (222, 'Soldier 222                   ', to_date('09-06-1998', 'dd-mm-yyyy'), 84, 4, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (223, 'Soldier 223                   ', to_date('12-01-1985', 'dd-mm-yyyy'), 84, 3, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (224, 'Soldier 224                   ', to_date('20-06-1983', 'dd-mm-yyyy'), 72, 2, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (225, 'Soldier 225                   ', to_date('09-06-1980', 'dd-mm-yyyy'), 84, 2, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (226, 'Soldier 226                   ', to_date('28-03-1992', 'dd-mm-yyyy'), 97, 7, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (227, 'Soldier 227                   ', to_date('25-02-1983', 'dd-mm-yyyy'), 84, 8, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (228, 'Soldier 228                   ', to_date('29-02-1996', 'dd-mm-yyyy'), 84, 7, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (229, 'Soldier 229                   ', to_date('20-08-1998', 'dd-mm-yyyy'), 84, 2, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (230, 'Soldier 230                   ', to_date('01-09-1988', 'dd-mm-yyyy'), 84, 7, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (231, 'Soldier 231                   ', to_date('03-04-1998', 'dd-mm-yyyy'), 97, 7, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (232, 'Soldier 232                   ', to_date('19-01-1982', 'dd-mm-yyyy'), 84, 2, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (233, 'Soldier 233                   ', to_date('21-09-1990', 'dd-mm-yyyy'), 72, 6, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (234, 'Soldier 234                   ', to_date('31-08-1992', 'dd-mm-yyyy'), 97, 4, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (235, 'Soldier 235                   ', to_date('10-05-2000', 'dd-mm-yyyy'), 72, 3, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (236, 'Soldier 236                   ', to_date('30-05-1999', 'dd-mm-yyyy'), 72, 7, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (237, 'Soldier 237                   ', to_date('16-12-1983', 'dd-mm-yyyy'), 97, 6, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (238, 'Soldier 238                   ', to_date('17-08-1990', 'dd-mm-yyyy'), 72, 3, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (239, 'Soldier 239                   ', to_date('15-02-1993', 'dd-mm-yyyy'), 72, 2, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (240, 'Soldier 240                   ', to_date('23-04-1988', 'dd-mm-yyyy'), 72, 1, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (241, 'Soldier 241                   ', to_date('05-02-1988', 'dd-mm-yyyy'), 97, 4, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (242, 'Soldier 242                   ', to_date('29-10-1982', 'dd-mm-yyyy'), 72, 4, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (243, 'Soldier 243                   ', to_date('03-02-1988', 'dd-mm-yyyy'), 84, 4, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (244, 'Soldier 244                   ', to_date('19-07-2000', 'dd-mm-yyyy'), 97, 6, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (245, 'Soldier 245                   ', to_date('18-08-1986', 'dd-mm-yyyy'), 97, 7, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (246, 'Soldier 246                   ', to_date('10-11-1987', 'dd-mm-yyyy'), 84, 4, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (247, 'Soldier 247                   ', to_date('04-04-1997', 'dd-mm-yyyy'), 97, 4, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (248, 'Soldier 248                   ', to_date('23-09-1999', 'dd-mm-yyyy'), 97, 4, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (249, 'Soldier 249                   ', to_date('10-03-1983', 'dd-mm-yyyy'), 72, 7, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (250, 'Soldier 250                   ', to_date('11-07-2004', 'dd-mm-yyyy'), 84, 4, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (251, 'Soldier 251                   ', to_date('13-07-1983', 'dd-mm-yyyy'), 97, 8, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (252, 'Soldier 252                   ', to_date('20-03-1982', 'dd-mm-yyyy'), 84, 1, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (253, 'Soldier 253                   ', to_date('17-12-2001', 'dd-mm-yyyy'), 72, 5, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (254, 'Soldier 254                   ', to_date('02-09-1997', 'dd-mm-yyyy'), 84, 1, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (255, 'Soldier 255                   ', to_date('22-06-1993', 'dd-mm-yyyy'), 84, 8, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (256, 'Soldier 256                   ', to_date('20-09-1990', 'dd-mm-yyyy'), 97, 4, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (257, 'Soldier 257                   ', to_date('12-03-1997', 'dd-mm-yyyy'), 72, 8, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (258, 'Soldier 258                   ', to_date('31-03-1993', 'dd-mm-yyyy'), 72, 7, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (259, 'Soldier 259                   ', to_date('13-10-1989', 'dd-mm-yyyy'), 84, 2, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (260, 'Soldier 260                   ', to_date('15-11-1986', 'dd-mm-yyyy'), 72, 6, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (261, 'Soldier 261                   ', to_date('13-05-2001', 'dd-mm-yyyy'), 84, 2, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (262, 'Soldier 262                   ', to_date('19-05-1988', 'dd-mm-yyyy'), 97, 5, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (263, 'Soldier 263                   ', to_date('06-02-1999', 'dd-mm-yyyy'), 72, 1, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (264, 'Soldier 264                   ', to_date('10-02-1989', 'dd-mm-yyyy'), 72, 1, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (265, 'Soldier 265                   ', to_date('12-07-1991', 'dd-mm-yyyy'), 72, 3, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (266, 'Soldier 266                   ', to_date('18-09-1987', 'dd-mm-yyyy'), 72, 5, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (267, 'Soldier 267                   ', to_date('05-09-2000', 'dd-mm-yyyy'), 97, 4, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (268, 'Soldier 268                   ', to_date('09-07-1999', 'dd-mm-yyyy'), 84, 5, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (269, 'Soldier 269                   ', to_date('08-10-1987', 'dd-mm-yyyy'), 84, 2, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (270, 'Soldier 270                   ', to_date('29-03-1983', 'dd-mm-yyyy'), 84, 6, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (271, 'Soldier 271                   ', to_date('28-12-1997', 'dd-mm-yyyy'), 97, 5, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (272, 'Soldier 272                   ', to_date('01-11-1999', 'dd-mm-yyyy'), 72, 5, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (273, 'Soldier 273                   ', to_date('17-06-1996', 'dd-mm-yyyy'), 72, 5, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (274, 'Soldier 274                   ', to_date('31-12-2004', 'dd-mm-yyyy'), 97, 7, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (275, 'Soldier 275                   ', to_date('06-08-1991', 'dd-mm-yyyy'), 72, 4, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (276, 'Soldier 276                   ', to_date('10-12-1985', 'dd-mm-yyyy'), 97, 3, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (277, 'Soldier 277                   ', to_date('07-03-1989', 'dd-mm-yyyy'), 72, 3, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (278, 'Soldier 278                   ', to_date('06-06-1996', 'dd-mm-yyyy'), 72, 5, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (279, 'Soldier 279                   ', to_date('13-04-1984', 'dd-mm-yyyy'), 72, 8, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (280, 'Soldier 280                   ', to_date('30-01-1990', 'dd-mm-yyyy'), 84, 3, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (281, 'Soldier 281                   ', to_date('28-03-1988', 'dd-mm-yyyy'), 84, 8, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (282, 'Soldier 282                   ', to_date('09-01-1997', 'dd-mm-yyyy'), 72, 1, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (283, 'Soldier 283                   ', to_date('30-03-1993', 'dd-mm-yyyy'), 72, 5, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (284, 'Soldier 284                   ', to_date('09-05-2002', 'dd-mm-yyyy'), 72, 1, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (285, 'Soldier 285                   ', to_date('18-10-1986', 'dd-mm-yyyy'), 72, 8, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (286, 'Soldier 286                   ', to_date('16-11-2002', 'dd-mm-yyyy'), 72, 3, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (287, 'Soldier 287                   ', to_date('18-11-2001', 'dd-mm-yyyy'), 97, 7, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (288, 'Soldier 288                   ', to_date('07-10-1991', 'dd-mm-yyyy'), 97, 4, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (289, 'Soldier 289                   ', to_date('19-12-1987', 'dd-mm-yyyy'), 97, 8, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (290, 'Soldier 290                   ', to_date('01-01-1995', 'dd-mm-yyyy'), 72, 5, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (291, 'Soldier 291                   ', to_date('28-07-1999', 'dd-mm-yyyy'), 97, 7, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (292, 'Soldier 292                   ', to_date('03-02-1991', 'dd-mm-yyyy'), 97, 8, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (293, 'Soldier 293                   ', to_date('04-08-2000', 'dd-mm-yyyy'), 97, 3, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (294, 'Soldier 294                   ', to_date('01-06-2004', 'dd-mm-yyyy'), 72, 2, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (295, 'Soldier 295                   ', to_date('03-10-1988', 'dd-mm-yyyy'), 84, 5, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (296, 'Soldier 296                   ', to_date('06-10-1985', 'dd-mm-yyyy'), 84, 1, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (297, 'Soldier 297                   ', to_date('07-11-2003', 'dd-mm-yyyy'), 72, 7, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (298, 'Soldier 298                   ', to_date('15-09-1998', 'dd-mm-yyyy'), 97, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (299, 'Soldier 299                   ', to_date('01-05-1997', 'dd-mm-yyyy'), 84, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (300, 'Soldier 300                   ', to_date('16-05-1999', 'dd-mm-yyyy'), 72, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (301, 'Soldier 301                   ', to_date('01-04-1994', 'dd-mm-yyyy'), 72, 1, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (302, 'Soldier 302                   ', to_date('20-12-1987', 'dd-mm-yyyy'), 84, 8, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (303, 'Soldier 303                   ', to_date('20-01-2004', 'dd-mm-yyyy'), 72, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (304, 'Soldier 304                   ', to_date('22-10-1985', 'dd-mm-yyyy'), 97, 2, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (305, 'Soldier 305                   ', to_date('24-05-1992', 'dd-mm-yyyy'), 72, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (306, 'Soldier 306                   ', to_date('03-07-1986', 'dd-mm-yyyy'), 97, 3, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (307, 'Soldier 307                   ', to_date('01-05-1992', 'dd-mm-yyyy'), 72, 8, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (308, 'Soldier 308                   ', to_date('15-07-1998', 'dd-mm-yyyy'), 84, 1, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (309, 'Soldier 309                   ', to_date('18-12-1998', 'dd-mm-yyyy'), 84, 6, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (310, 'Soldier 310                   ', to_date('11-01-1984', 'dd-mm-yyyy'), 72, 8, 16);
commit;
prompt 300 records committed...
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (311, 'Soldier 311                   ', to_date('22-08-1987', 'dd-mm-yyyy'), 84, 3, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (312, 'Soldier 312                   ', to_date('23-05-1989', 'dd-mm-yyyy'), 72, 4, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (313, 'Soldier 313                   ', to_date('27-05-1983', 'dd-mm-yyyy'), 72, 6, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (314, 'Soldier 314                   ', to_date('04-11-1999', 'dd-mm-yyyy'), 84, 4, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (315, 'Soldier 315                   ', to_date('09-08-1985', 'dd-mm-yyyy'), 84, 3, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (316, 'Soldier 316                   ', to_date('01-01-1984', 'dd-mm-yyyy'), 72, 5, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (317, 'Soldier 317                   ', to_date('08-04-1995', 'dd-mm-yyyy'), 72, 8, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (318, 'Soldier 318                   ', to_date('19-10-1987', 'dd-mm-yyyy'), 84, 6, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (319, 'Soldier 319                   ', to_date('17-08-1990', 'dd-mm-yyyy'), 72, 7, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (320, 'Soldier 320                   ', to_date('03-08-1998', 'dd-mm-yyyy'), 84, 5, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (321, 'Soldier 321                   ', to_date('14-10-2003', 'dd-mm-yyyy'), 72, 4, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (322, 'Soldier 322                   ', to_date('04-10-1994', 'dd-mm-yyyy'), 84, 2, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (323, 'Soldier 323                   ', to_date('29-06-1995', 'dd-mm-yyyy'), 84, 5, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (324, 'Soldier 324                   ', to_date('14-04-1981', 'dd-mm-yyyy'), 72, 2, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (325, 'Soldier 325                   ', to_date('28-07-2000', 'dd-mm-yyyy'), 97, 6, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (326, 'Soldier 326                   ', to_date('26-03-1985', 'dd-mm-yyyy'), 97, 3, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (327, 'Soldier 327                   ', to_date('22-02-1996', 'dd-mm-yyyy'), 84, 6, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (328, 'Soldier 328                   ', to_date('02-12-1993', 'dd-mm-yyyy'), 84, 6, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (329, 'Soldier 329                   ', to_date('12-10-1994', 'dd-mm-yyyy'), 97, 6, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (330, 'Soldier 330                   ', to_date('11-05-1982', 'dd-mm-yyyy'), 72, 7, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (331, 'Soldier 331                   ', to_date('21-08-1980', 'dd-mm-yyyy'), 72, 5, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (332, 'Soldier 332                   ', to_date('04-08-1985', 'dd-mm-yyyy'), 84, 1, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (333, 'Soldier 333                   ', to_date('10-04-1996', 'dd-mm-yyyy'), 97, 1, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (334, 'Soldier 334                   ', to_date('29-03-2000', 'dd-mm-yyyy'), 72, 1, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (335, 'Soldier 335                   ', to_date('26-06-1998', 'dd-mm-yyyy'), 84, 8, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (336, 'Soldier 336                   ', to_date('28-01-1996', 'dd-mm-yyyy'), 84, 4, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (337, 'Soldier 337                   ', to_date('23-08-2004', 'dd-mm-yyyy'), 72, 6, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (338, 'Soldier 338                   ', to_date('09-04-1991', 'dd-mm-yyyy'), 72, 8, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (339, 'Soldier 339                   ', to_date('08-04-1987', 'dd-mm-yyyy'), 84, 8, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (340, 'Soldier 340                   ', to_date('13-04-1985', 'dd-mm-yyyy'), 97, 6, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (341, 'Soldier 341                   ', to_date('23-01-2004', 'dd-mm-yyyy'), 84, 6, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (342, 'Soldier 342                   ', to_date('10-12-1982', 'dd-mm-yyyy'), 72, 4, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (343, 'Soldier 343                   ', to_date('15-11-1985', 'dd-mm-yyyy'), 84, 5, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (344, 'Soldier 344                   ', to_date('04-02-2000', 'dd-mm-yyyy'), 72, 1, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (345, 'Soldier 345                   ', to_date('19-06-1990', 'dd-mm-yyyy'), 84, 7, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (346, 'Soldier 346                   ', to_date('27-02-1994', 'dd-mm-yyyy'), 72, 8, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (347, 'Soldier 347                   ', to_date('21-10-1983', 'dd-mm-yyyy'), 84, 7, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (348, 'Soldier 348                   ', to_date('30-06-1990', 'dd-mm-yyyy'), 84, 4, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (349, 'Soldier 349                   ', to_date('17-03-1998', 'dd-mm-yyyy'), 72, 6, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (350, 'Soldier 350                   ', to_date('17-06-1994', 'dd-mm-yyyy'), 84, 1, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (351, 'Soldier 351                   ', to_date('14-12-1999', 'dd-mm-yyyy'), 84, 4, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (352, 'Soldier 352                   ', to_date('08-01-2000', 'dd-mm-yyyy'), 97, 4, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (353, 'Soldier 353                   ', to_date('30-06-1992', 'dd-mm-yyyy'), 97, 8, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (354, 'Soldier 354                   ', to_date('18-08-1991', 'dd-mm-yyyy'), 84, 5, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (355, 'Soldier 355                   ', to_date('06-04-1993', 'dd-mm-yyyy'), 84, 4, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (356, 'Soldier 356                   ', to_date('05-07-1992', 'dd-mm-yyyy'), 72, 5, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (357, 'Soldier 357                   ', to_date('06-09-2003', 'dd-mm-yyyy'), 84, 1, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (358, 'Soldier 358                   ', to_date('30-12-1999', 'dd-mm-yyyy'), 84, 2, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (359, 'Soldier 359                   ', to_date('01-09-1983', 'dd-mm-yyyy'), 97, 8, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (360, 'Soldier 360                   ', to_date('23-09-1988', 'dd-mm-yyyy'), 97, 6, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (361, 'Soldier 361                   ', to_date('29-08-1992', 'dd-mm-yyyy'), 72, 1, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (362, 'Soldier 362                   ', to_date('03-04-1981', 'dd-mm-yyyy'), 84, 8, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (363, 'Soldier 363                   ', to_date('26-12-1994', 'dd-mm-yyyy'), 97, 3, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (364, 'Soldier 364                   ', to_date('03-10-1997', 'dd-mm-yyyy'), 72, 6, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (365, 'Soldier 365                   ', to_date('11-05-1993', 'dd-mm-yyyy'), 97, 8, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (366, 'Soldier 366                   ', to_date('06-06-1986', 'dd-mm-yyyy'), 97, 5, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (367, 'Soldier 367                   ', to_date('29-12-2002', 'dd-mm-yyyy'), 97, 7, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (368, 'Soldier 368                   ', to_date('25-09-1998', 'dd-mm-yyyy'), 84, 1, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (369, 'Soldier 369                   ', to_date('19-06-1987', 'dd-mm-yyyy'), 97, 3, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (370, 'Soldier 370                   ', to_date('06-04-1991', 'dd-mm-yyyy'), 72, 5, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (371, 'Soldier 371                   ', to_date('29-11-1984', 'dd-mm-yyyy'), 72, 1, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (372, 'Soldier 372                   ', to_date('13-11-2004', 'dd-mm-yyyy'), 84, 1, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (373, 'Soldier 373                   ', to_date('28-02-1992', 'dd-mm-yyyy'), 72, 3, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (374, 'Soldier 374                   ', to_date('18-05-2000', 'dd-mm-yyyy'), 72, 1, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (375, 'Soldier 375                   ', to_date('01-09-1983', 'dd-mm-yyyy'), 84, 2, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (376, 'Soldier 376                   ', to_date('07-07-1982', 'dd-mm-yyyy'), 72, 5, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (377, 'Soldier 377                   ', to_date('21-10-1999', 'dd-mm-yyyy'), 72, 3, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (378, 'Soldier 378                   ', to_date('07-01-1998', 'dd-mm-yyyy'), 72, 1, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (379, 'Soldier 379                   ', to_date('25-05-1999', 'dd-mm-yyyy'), 97, 8, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (380, 'Soldier 380                   ', to_date('13-10-1989', 'dd-mm-yyyy'), 84, 7, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (381, 'Soldier 381                   ', to_date('29-03-1994', 'dd-mm-yyyy'), 97, 8, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (382, 'Soldier 382                   ', to_date('01-03-1989', 'dd-mm-yyyy'), 97, 5, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (383, 'Soldier 383                   ', to_date('11-06-1997', 'dd-mm-yyyy'), 72, 7, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (451, 'Soldier 451                   ', to_date('29-01-1989', 'dd-mm-yyyy'), 84, 9, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (452, 'Soldier 452                   ', to_date('14-01-1985', 'dd-mm-yyyy'), 84, 9, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (453, 'Soldier 453                   ', to_date('30-10-1991', 'dd-mm-yyyy'), 97, 9, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (454, 'Soldier 454                   ', to_date('19-10-1986', 'dd-mm-yyyy'), 84, 9, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (455, 'Soldier 455                   ', to_date('30-05-1989', 'dd-mm-yyyy'), 97, 9, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (456, 'Soldier 456                   ', to_date('04-05-2004', 'dd-mm-yyyy'), 84, 9, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (457, 'Soldier 457                   ', to_date('17-06-1998', 'dd-mm-yyyy'), 97, 9, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (458, 'Soldier 458                   ', to_date('05-10-1991', 'dd-mm-yyyy'), 84, 9, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (459, 'Soldier 459                   ', to_date('07-06-2000', 'dd-mm-yyyy'), 97, 9, 9);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (460, 'Soldier 460                   ', to_date('23-07-1980', 'dd-mm-yyyy'), 97, 9, 10);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (461, 'Soldier 461                   ', to_date('27-02-1981', 'dd-mm-yyyy'), 97, 9, 11);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (462, 'Soldier 462                   ', to_date('20-03-1990', 'dd-mm-yyyy'), 84, 9, 12);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (463, 'Soldier 463                   ', to_date('02-01-1994', 'dd-mm-yyyy'), 97, 9, 13);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (464, 'Soldier 464                   ', to_date('13-06-1992', 'dd-mm-yyyy'), 84, 9, 14);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (465, 'Soldier 465                   ', to_date('06-03-1984', 'dd-mm-yyyy'), 84, 9, 15);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (466, 'Soldier 466                   ', to_date('30-05-1984', 'dd-mm-yyyy'), 97, 9, 16);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (467, 'Soldier 467                   ', to_date('24-07-1986', 'dd-mm-yyyy'), 97, 9, 17);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (468, 'Soldier 468                   ', to_date('18-04-1995', 'dd-mm-yyyy'), 84, 9, 18);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (469, 'Soldier 469                   ', to_date('09-10-1994', 'dd-mm-yyyy'), 84, 9, 19);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (470, 'Soldier 470                   ', to_date('06-10-1983', 'dd-mm-yyyy'), 84, 9, 20);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (471, 'Soldier 471                   ', to_date('01-04-1999', 'dd-mm-yyyy'), 97, 9, 21);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (472, 'Soldier 472                   ', to_date('15-11-1985', 'dd-mm-yyyy'), 97, 9, 22);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (473, 'Soldier 473                   ', to_date('28-06-1995', 'dd-mm-yyyy'), 97, 9, 23);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (474, 'Soldier 474                   ', to_date('13-01-1983', 'dd-mm-yyyy'), 84, 9, 24);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (475, 'Soldier 475                   ', to_date('27-12-1980', 'dd-mm-yyyy'), 97, 9, 25);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (476, 'Soldier 476                   ', to_date('21-07-1988', 'dd-mm-yyyy'), 97, 9, 26);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (477, 'Soldier 477                   ', to_date('28-07-1987', 'dd-mm-yyyy'), 84, 9, 27);
commit;
prompt 400 records committed...
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (478, 'Soldier 478                   ', to_date('16-08-1983', 'dd-mm-yyyy'), 97, 9, 28);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (479, 'Soldier 479                   ', to_date('05-07-1992', 'dd-mm-yyyy'), 97, 9, 29);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (480, 'Soldier 480                   ', to_date('01-10-2003', 'dd-mm-yyyy'), 97, 9, 30);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (481, 'Soldier 481                   ', to_date('07-12-1993', 'dd-mm-yyyy'), 84, 9, 31);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (482, 'Soldier 482                   ', to_date('12-07-1980', 'dd-mm-yyyy'), 97, 9, 32);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (483, 'Soldier 483                   ', to_date('22-06-1987', 'dd-mm-yyyy'), 97, 9, 33);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (484, 'Soldier 484                   ', to_date('17-12-1986', 'dd-mm-yyyy'), 84, 9, 34);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (485, 'Soldier 485                   ', to_date('26-01-1994', 'dd-mm-yyyy'), 84, 9, 35);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (486, 'Soldier 486                   ', to_date('30-03-1981', 'dd-mm-yyyy'), 97, 9, 36);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (487, 'Soldier 487                   ', to_date('03-05-1981', 'dd-mm-yyyy'), 97, 9, 37);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (488, 'Soldier 488                   ', to_date('17-06-2000', 'dd-mm-yyyy'), 84, 9, 38);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (489, 'Soldier 489                   ', to_date('12-04-1987', 'dd-mm-yyyy'), 84, 9, 39);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (490, 'Soldier 490                   ', to_date('25-05-1991', 'dd-mm-yyyy'), 84, 9, 40);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (491, 'Soldier 491                   ', to_date('18-03-1991', 'dd-mm-yyyy'), 84, 9, 41);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (492, 'Soldier 492                   ', to_date('07-09-1992', 'dd-mm-yyyy'), 84, 9, 42);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (493, 'Soldier 493                   ', to_date('05-10-1981', 'dd-mm-yyyy'), 84, 9, 43);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (494, 'Soldier 494                   ', to_date('26-10-1983', 'dd-mm-yyyy'), 97, 9, 44);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (495, 'Soldier 495                   ', to_date('25-06-1982', 'dd-mm-yyyy'), 97, 9, 45);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (496, 'Soldier 496                   ', to_date('12-03-1999', 'dd-mm-yyyy'), 84, 9, 46);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (497, 'Soldier 497                   ', to_date('27-04-1983', 'dd-mm-yyyy'), 97, 9, 47);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (498, 'Soldier 498                   ', to_date('30-03-1984', 'dd-mm-yyyy'), 97, 9, 48);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (499, 'Soldier 499                   ', to_date('22-02-1984', 'dd-mm-yyyy'), 97, 9, 49);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (500, 'Soldier 500                   ', to_date('23-02-1987', 'dd-mm-yyyy'), 84, 9, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (384, 'Soldier 384                   ', to_date('07-08-1987', 'dd-mm-yyyy'), 72, 2, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (385, 'Soldier 385                   ', to_date('08-04-1995', 'dd-mm-yyyy'), 72, 2, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (386, 'Soldier 386                   ', to_date('12-02-2002', 'dd-mm-yyyy'), 97, 4, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (387, 'Soldier 387                   ', to_date('05-06-1995', 'dd-mm-yyyy'), 72, 1, 8);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (388, 'Soldier 388                   ', to_date('02-10-1996', 'dd-mm-yyyy'), 72, 2, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (389, 'Soldier 389                   ', to_date('09-06-1997', 'dd-mm-yyyy'), 97, 7, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (390, 'Soldier 390                   ', to_date('17-08-2004', 'dd-mm-yyyy'), 84, 1, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (391, 'Soldier 391                   ', to_date('20-02-2000', 'dd-mm-yyyy'), 72, 8, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (392, 'Soldier 392                   ', to_date('09-03-1986', 'dd-mm-yyyy'), 72, 8, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (393, 'Soldier 393                   ', to_date('18-11-1994', 'dd-mm-yyyy'), 97, 5, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (394, 'Soldier 394                   ', to_date('15-06-2003', 'dd-mm-yyyy'), 84, 2, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (395, 'Soldier 395                   ', to_date('17-01-1997', 'dd-mm-yyyy'), 84, 2, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (396, 'Soldier 396                   ', to_date('28-01-1993', 'dd-mm-yyyy'), 84, 8, 7);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (397, 'Soldier 397                   ', to_date('23-09-1992', 'dd-mm-yyyy'), 84, 8, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (398, 'Soldier 398                   ', to_date('21-09-2004', 'dd-mm-yyyy'), 72, 6, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (399, 'Soldier 399                   ', to_date('25-01-1980', 'dd-mm-yyyy'), 72, 7, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (400, 'Soldier 400                   ', to_date('27-05-1998', 'dd-mm-yyyy'), 84, 1, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (401, 'Soldier 401                   ', to_date('26-01-1994', 'dd-mm-yyyy'), 84, 1, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (402, 'Soldier 402                   ', to_date('16-06-1998', 'dd-mm-yyyy'), 84, 3, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (403, 'Soldier 403                   ', to_date('25-02-1981', 'dd-mm-yyyy'), 72, 8, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (404, 'Soldier 404                   ', to_date('25-06-1996', 'dd-mm-yyyy'), 97, 3, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (405, 'Soldier 405                   ', to_date('09-02-1994', 'dd-mm-yyyy'), 72, 4, 6);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (406, 'Soldier 406                   ', to_date('06-08-1983', 'dd-mm-yyyy'), 72, 7, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (407, 'Soldier 407                   ', to_date('30-11-1984', 'dd-mm-yyyy'), 72, 3, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (408, 'Soldier 408                   ', to_date('03-09-1997', 'dd-mm-yyyy'), 97, 4, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (409, 'Soldier 409                   ', to_date('13-03-1997', 'dd-mm-yyyy'), 97, 3, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (410, 'Soldier 410                   ', to_date('07-05-1997', 'dd-mm-yyyy'), 97, 5, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (411, 'Soldier 411                   ', to_date('27-02-1980', 'dd-mm-yyyy'), 72, 3, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (412, 'Soldier 412                   ', to_date('22-06-1994', 'dd-mm-yyyy'), 97, 8, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (413, 'Soldier 413                   ', to_date('31-07-1989', 'dd-mm-yyyy'), 97, 5, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (414, 'Soldier 414                   ', to_date('30-01-1981', 'dd-mm-yyyy'), 72, 4, 5);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (415, 'Soldier 415                   ', to_date('25-01-1985', 'dd-mm-yyyy'), 72, 6, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (416, 'Soldier 416                   ', to_date('22-09-1989', 'dd-mm-yyyy'), 72, 3, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (417, 'Soldier 417                   ', to_date('17-03-1991', 'dd-mm-yyyy'), 72, 4, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (418, 'Soldier 418                   ', to_date('02-05-1983', 'dd-mm-yyyy'), 84, 3, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (419, 'Soldier 419                   ', to_date('15-06-1993', 'dd-mm-yyyy'), 72, 3, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (420, 'Soldier 420                   ', to_date('27-12-1989', 'dd-mm-yyyy'), 84, 5, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (421, 'Soldier 421                   ', to_date('07-09-1999', 'dd-mm-yyyy'), 72, 3, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (422, 'Soldier 422                   ', to_date('15-06-1986', 'dd-mm-yyyy'), 72, 4, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (423, 'Soldier 423                   ', to_date('03-04-1985', 'dd-mm-yyyy'), 97, 1, 4);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (424, 'Soldier 424                   ', to_date('19-07-1982', 'dd-mm-yyyy'), 72, 4, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (425, 'Soldier 425                   ', to_date('10-02-1985', 'dd-mm-yyyy'), 84, 3, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (426, 'Soldier 426                   ', to_date('03-06-1981', 'dd-mm-yyyy'), 72, 1, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (427, 'Soldier 427                   ', to_date('18-07-1997', 'dd-mm-yyyy'), 72, 1, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (428, 'Soldier 428                   ', to_date('02-12-1999', 'dd-mm-yyyy'), 97, 4, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (429, 'Soldier 429                   ', to_date('22-06-2001', 'dd-mm-yyyy'), 84, 4, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (430, 'Soldier 430                   ', to_date('21-06-1996', 'dd-mm-yyyy'), 97, 1, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (431, 'Soldier 431                   ', to_date('06-04-1992', 'dd-mm-yyyy'), 72, 7, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (432, 'Soldier 432                   ', to_date('23-04-2004', 'dd-mm-yyyy'), 72, 4, 3);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (433, 'Soldier 433                   ', to_date('06-03-2003', 'dd-mm-yyyy'), 84, 1, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (434, 'Soldier 434                   ', to_date('18-12-1997', 'dd-mm-yyyy'), 84, 3, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (435, 'Soldier 435                   ', to_date('30-09-1995', 'dd-mm-yyyy'), 84, 5, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (436, 'Soldier 436                   ', to_date('06-11-1998', 'dd-mm-yyyy'), 72, 5, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (437, 'Soldier 437                   ', to_date('22-10-1990', 'dd-mm-yyyy'), 72, 4, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (438, 'Soldier 438                   ', to_date('21-12-1987', 'dd-mm-yyyy'), 72, 3, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (439, 'Soldier 439                   ', to_date('12-01-2004', 'dd-mm-yyyy'), 84, 5, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (440, 'Soldier 440                   ', to_date('24-04-1999', 'dd-mm-yyyy'), 97, 2, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (441, 'Soldier 441                   ', to_date('10-03-1995', 'dd-mm-yyyy'), 97, 1, 2);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (442, 'Soldier 442                   ', to_date('06-03-2000', 'dd-mm-yyyy'), 72, 4, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (443, 'Soldier 443                   ', to_date('24-11-1999', 'dd-mm-yyyy'), 72, 7, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (444, 'Soldier 444                   ', to_date('14-07-1987', 'dd-mm-yyyy'), 97, 5, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (445, 'Soldier 445                   ', to_date('31-08-1990', 'dd-mm-yyyy'), 72, 7, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (446, 'Soldier 446                   ', to_date('26-02-1995', 'dd-mm-yyyy'), 84, 1, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (447, 'Soldier 447                   ', to_date('19-02-2004', 'dd-mm-yyyy'), 72, 7, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (448, 'Soldier 448                   ', to_date('20-11-1999', 'dd-mm-yyyy'), 97, 2, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (449, 'Soldier 449                   ', to_date('12-03-1989', 'dd-mm-yyyy'), 84, 7, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (450, 'Soldier 450                   ', to_date('05-06-1989', 'dd-mm-yyyy'), 97, 2, 1);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (1, 'Soldier 1                     ', to_date('25-04-2004', 'dd-mm-yyyy'), 72, 5, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (2, 'Soldier 2                     ', to_date('08-02-2004', 'dd-mm-yyyy'), 84, 7, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (3, 'Soldier 3                     ', to_date('30-03-1987', 'dd-mm-yyyy'), 72, 6, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (4, 'Soldier 4                     ', to_date('07-02-1991', 'dd-mm-yyyy'), 97, 5, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (5, 'Soldier 5                     ', to_date('06-01-2001', 'dd-mm-yyyy'), 97, 8, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (6, 'Soldier 6                     ', to_date('29-10-1987', 'dd-mm-yyyy'), 97, 6, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (7, 'Soldier 7                     ', to_date('22-04-2000', 'dd-mm-yyyy'), 97, 3, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (8, 'Soldier 8                     ', to_date('03-07-1987', 'dd-mm-yyyy'), 72, 3, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (9, 'Soldier 9                     ', to_date('10-03-1999', 'dd-mm-yyyy'), 84, 2, 50);
insert into SOLDIER (soldierid, name, borndate, profile, rank, departmentid)
values (10, 'Soldier 10                    ', to_date('12-01-1992', 'dd-mm-yyyy'), 84, 7, 49);
commit;
prompt 500 records loaded
prompt Loading COMMANDER...
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 451);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 452);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 453);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 454);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 455);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 456);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 457);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 458);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 459);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 460);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 461);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 462);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 463);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 464);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 465);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 466);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 467);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 468);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 469);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 470);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 471);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 472);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 473);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 474);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 475);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 476);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 477);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 478);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 479);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 480);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 481);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 482);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 483);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 484);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 485);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 486);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 487);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 488);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 489);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 490);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 491);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 492);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 493);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 494);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 495);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 496);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 497);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 498);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 499);
insert into COMMANDER (numberofsoldiers, soldierid)
values (9, 500);
commit;
prompt 50 records loaded
prompt Loading DEPBOMBS...
insert into DEPBOMBS (maxweight, departmentid)
values (491, 1);
insert into DEPBOMBS (maxweight, departmentid)
values (513, 2);
insert into DEPBOMBS (maxweight, departmentid)
values (587, 3);
insert into DEPBOMBS (maxweight, departmentid)
values (554, 4);
insert into DEPBOMBS (maxweight, departmentid)
values (406, 5);
insert into DEPBOMBS (maxweight, departmentid)
values (594, 6);
insert into DEPBOMBS (maxweight, departmentid)
values (592, 7);
insert into DEPBOMBS (maxweight, departmentid)
values (493, 8);
insert into DEPBOMBS (maxweight, departmentid)
values (522, 9);
insert into DEPBOMBS (maxweight, departmentid)
values (460, 10);
insert into DEPBOMBS (maxweight, departmentid)
values (451, 11);
insert into DEPBOMBS (maxweight, departmentid)
values (502, 12);
insert into DEPBOMBS (maxweight, departmentid)
values (449, 13);
insert into DEPBOMBS (maxweight, departmentid)
values (594, 14);
insert into DEPBOMBS (maxweight, departmentid)
values (483, 15);
insert into DEPBOMBS (maxweight, departmentid)
values (442, 16);
insert into DEPBOMBS (maxweight, departmentid)
values (440, 17);
insert into DEPBOMBS (maxweight, departmentid)
values (561, 18);
insert into DEPBOMBS (maxweight, departmentid)
values (570, 19);
insert into DEPBOMBS (maxweight, departmentid)
values (541, 20);
insert into DEPBOMBS (maxweight, departmentid)
values (475, 21);
insert into DEPBOMBS (maxweight, departmentid)
values (413, 22);
insert into DEPBOMBS (maxweight, departmentid)
values (516, 23);
insert into DEPBOMBS (maxweight, departmentid)
values (478, 24);
insert into DEPBOMBS (maxweight, departmentid)
values (524, 25);
commit;
prompt 25 records loaded
prompt Loading DEPTUNNELS...
insert into DEPTUNNELS (maxdepth, departmentid)
values (10, 26);
insert into DEPTUNNELS (maxdepth, departmentid)
values (10, 27);
insert into DEPTUNNELS (maxdepth, departmentid)
values (13, 28);
insert into DEPTUNNELS (maxdepth, departmentid)
values (9, 29);
insert into DEPTUNNELS (maxdepth, departmentid)
values (11, 30);
insert into DEPTUNNELS (maxdepth, departmentid)
values (8, 31);
insert into DEPTUNNELS (maxdepth, departmentid)
values (9, 32);
insert into DEPTUNNELS (maxdepth, departmentid)
values (15, 33);
insert into DEPTUNNELS (maxdepth, departmentid)
values (10, 34);
insert into DEPTUNNELS (maxdepth, departmentid)
values (9, 35);
insert into DEPTUNNELS (maxdepth, departmentid)
values (6, 36);
insert into DEPTUNNELS (maxdepth, departmentid)
values (14, 37);
insert into DEPTUNNELS (maxdepth, departmentid)
values (9, 38);
insert into DEPTUNNELS (maxdepth, departmentid)
values (10, 39);
insert into DEPTUNNELS (maxdepth, departmentid)
values (8, 40);
insert into DEPTUNNELS (maxdepth, departmentid)
values (5, 41);
insert into DEPTUNNELS (maxdepth, departmentid)
values (6, 42);
insert into DEPTUNNELS (maxdepth, departmentid)
values (13, 43);
insert into DEPTUNNELS (maxdepth, departmentid)
values (13, 44);
insert into DEPTUNNELS (maxdepth, departmentid)
values (9, 45);
insert into DEPTUNNELS (maxdepth, departmentid)
values (10, 46);
insert into DEPTUNNELS (maxdepth, departmentid)
values (5, 47);
insert into DEPTUNNELS (maxdepth, departmentid)
values (14, 48);
insert into DEPTUNNELS (maxdepth, departmentid)
values (8, 49);
insert into DEPTUNNELS (maxdepth, departmentid)
values (7, 50);
commit;
prompt 25 records loaded
prompt Loading WEAPON...
insert into WEAPON (weaponid, minranktouse, name)
values (5000, 5, 'Weapon5000                    ');
insert into WEAPON (weaponid, minranktouse, name)
values (1, 2, 'Weapon1                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (2, 7, 'Weapon2                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (3, 5, 'Weapon3                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (4, 5, 'Weapon4                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (5, 4, 'Weapon5                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (6, 9, 'Weapon6                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (7, 7, 'Weapon7                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (8, 6, 'Weapon8                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (9, 3, 'Weapon9                       ');
insert into WEAPON (weaponid, minranktouse, name)
values (10, 7, 'Weapon10                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (11, 6, 'Weapon11                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (12, 3, 'Weapon12                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (13, 8, 'Weapon13                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (14, 9, 'Weapon14                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (15, 7, 'Weapon15                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (16, 9, 'Weapon16                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (17, 6, 'Weapon17                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (18, 2, 'Weapon18                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (19, 6, 'Weapon19                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (20, 3, 'Weapon20                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (21, 2, 'Weapon21                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (22, 4, 'Weapon22                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (23, 6, 'Weapon23                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (24, 4, 'Weapon24                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (25, 2, 'Weapon25                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (26, 2, 'Weapon26                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (27, 2, 'Weapon27                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (28, 8, 'Weapon28                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (29, 8, 'Weapon29                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (30, 3, 'Weapon30                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (31, 6, 'Weapon31                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (32, 2, 'Weapon32                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (33, 8, 'Weapon33                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (34, 6, 'Weapon34                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (35, 7, 'Weapon35                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (36, 4, 'Weapon36                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (37, 9, 'Weapon37                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (38, 9, 'Weapon38                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (39, 3, 'Weapon39                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (40, 8, 'Weapon40                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (41, 7, 'Weapon41                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (42, 4, 'Weapon42                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (43, 8, 'Weapon43                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (44, 8, 'Weapon44                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (45, 4, 'Weapon45                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (46, 2, 'Weapon46                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (47, 8, 'Weapon47                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (48, 5, 'Weapon48                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (49, 9, 'Weapon49                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (50, 3, 'Weapon50                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (51, 9, 'Weapon51                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (52, 6, 'Weapon52                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (53, 9, 'Weapon53                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (54, 2, 'Weapon54                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (55, 2, 'Weapon55                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (56, 2, 'Weapon56                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (57, 7, 'Weapon57                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (58, 8, 'Weapon58                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (59, 9, 'Weapon59                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (60, 3, 'Weapon60                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (61, 5, 'Weapon61                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (62, 7, 'Weapon62                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (63, 8, 'Weapon63                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (64, 8, 'Weapon64                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (65, 9, 'Weapon65                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (66, 9, 'Weapon66                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (67, 8, 'Weapon67                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (68, 4, 'Weapon68                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (69, 4, 'Weapon69                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (70, 2, 'Weapon70                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (71, 8, 'Weapon71                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (72, 5, 'Weapon72                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (73, 4, 'Weapon73                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (74, 8, 'Weapon74                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (75, 9, 'Weapon75                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (76, 6, 'Weapon76                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (77, 9, 'Weapon77                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (78, 6, 'Weapon78                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (79, 4, 'Weapon79                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (80, 4, 'Weapon80                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (81, 4, 'Weapon81                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (82, 6, 'Weapon82                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (83, 3, 'Weapon83                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (84, 7, 'Weapon84                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (85, 7, 'Weapon85                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (86, 2, 'Weapon86                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (87, 9, 'Weapon87                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (88, 5, 'Weapon88                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (89, 6, 'Weapon89                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (90, 9, 'Weapon90                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (91, 7, 'Weapon91                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (92, 4, 'Weapon92                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (93, 9, 'Weapon93                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (94, 9, 'Weapon94                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (95, 4, 'Weapon95                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (96, 2, 'Weapon96                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (97, 3, 'Weapon97                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (98, 2, 'Weapon98                      ');
insert into WEAPON (weaponid, minranktouse, name)
values (99, 2, 'Weapon99                      ');
commit;
prompt 100 records committed...
insert into WEAPON (weaponid, minranktouse, name)
values (100, 2, 'Weapon100                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (101, 5, 'Weapon101                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (102, 5, 'Weapon102                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (103, 9, 'Weapon103                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (104, 6, 'Weapon104                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (105, 6, 'Weapon105                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (106, 5, 'Weapon106                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (107, 6, 'Weapon107                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (108, 4, 'Weapon108                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (109, 2, 'Weapon109                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (110, 7, 'Weapon110                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (111, 3, 'Weapon111                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (112, 6, 'Weapon112                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (113, 7, 'Weapon113                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (114, 8, 'Weapon114                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (115, 6, 'Weapon115                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (116, 7, 'Weapon116                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (117, 5, 'Weapon117                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (118, 7, 'Weapon118                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (119, 7, 'Weapon119                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (120, 8, 'Weapon120                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (121, 3, 'Weapon121                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (122, 6, 'Weapon122                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (123, 9, 'Weapon123                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (124, 6, 'Weapon124                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (125, 4, 'Weapon125                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (126, 2, 'Weapon126                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (127, 5, 'Weapon127                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (128, 2, 'Weapon128                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (129, 4, 'Weapon129                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (130, 3, 'Weapon130                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (131, 6, 'Weapon131                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (132, 9, 'Weapon132                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (133, 7, 'Weapon133                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (134, 8, 'Weapon134                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (135, 6, 'Weapon135                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (136, 9, 'Weapon136                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (137, 2, 'Weapon137                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (138, 3, 'Weapon138                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (139, 9, 'Weapon139                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (140, 4, 'Weapon140                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (141, 6, 'Weapon141                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (142, 8, 'Weapon142                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (143, 8, 'Weapon143                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (144, 3, 'Weapon144                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (145, 6, 'Weapon145                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (146, 2, 'Weapon146                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (147, 9, 'Weapon147                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (148, 8, 'Weapon148                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (149, 3, 'Weapon149                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (150, 7, 'Weapon150                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (151, 6, 'Weapon151                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (152, 7, 'Weapon152                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (153, 4, 'Weapon153                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (154, 4, 'Weapon154                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (155, 9, 'Weapon155                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (156, 2, 'Weapon156                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (157, 8, 'Weapon157                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (158, 2, 'Weapon158                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (159, 9, 'Weapon159                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (160, 4, 'Weapon160                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (161, 7, 'Weapon161                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (162, 2, 'Weapon162                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (163, 8, 'Weapon163                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (164, 5, 'Weapon164                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (165, 5, 'Weapon165                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (166, 5, 'Weapon166                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (167, 3, 'Weapon167                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (168, 8, 'Weapon168                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (169, 3, 'Weapon169                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (170, 7, 'Weapon170                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (171, 8, 'Weapon171                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (172, 6, 'Weapon172                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (173, 2, 'Weapon173                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (174, 3, 'Weapon174                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (175, 2, 'Weapon175                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (176, 7, 'Weapon176                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (177, 6, 'Weapon177                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (178, 2, 'Weapon178                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (179, 8, 'Weapon179                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (180, 5, 'Weapon180                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (181, 3, 'Weapon181                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (182, 3, 'Weapon182                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (183, 9, 'Weapon183                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (184, 2, 'Weapon184                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (185, 5, 'Weapon185                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (186, 8, 'Weapon186                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (187, 8, 'Weapon187                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (188, 2, 'Weapon188                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (189, 7, 'Weapon189                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (190, 7, 'Weapon190                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (191, 3, 'Weapon191                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (192, 5, 'Weapon192                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (193, 9, 'Weapon193                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (194, 8, 'Weapon194                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (195, 4, 'Weapon195                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (196, 3, 'Weapon196                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (197, 3, 'Weapon197                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (198, 8, 'Weapon198                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (199, 5, 'Weapon199                     ');
commit;
prompt 200 records committed...
insert into WEAPON (weaponid, minranktouse, name)
values (200, 7, 'Weapon200                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (201, 8, 'Weapon201                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (202, 9, 'Weapon202                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (203, 9, 'Weapon203                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (204, 6, 'Weapon204                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (205, 7, 'Weapon205                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (206, 7, 'Weapon206                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (207, 9, 'Weapon207                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (208, 5, 'Weapon208                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (209, 7, 'Weapon209                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (210, 3, 'Weapon210                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (211, 4, 'Weapon211                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (212, 7, 'Weapon212                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (213, 7, 'Weapon213                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (214, 5, 'Weapon214                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (215, 3, 'Weapon215                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (216, 8, 'Weapon216                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (217, 7, 'Weapon217                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (218, 8, 'Weapon218                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (219, 3, 'Weapon219                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (220, 6, 'Weapon220                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (221, 7, 'Weapon221                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (222, 9, 'Weapon222                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (223, 8, 'Weapon223                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (224, 5, 'Weapon224                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (225, 9, 'Weapon225                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (226, 6, 'Weapon226                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (227, 9, 'Weapon227                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (228, 7, 'Weapon228                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (229, 4, 'Weapon229                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (230, 8, 'Weapon230                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (231, 7, 'Weapon231                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (232, 5, 'Weapon232                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (233, 9, 'Weapon233                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (234, 9, 'Weapon234                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (235, 6, 'Weapon235                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (236, 3, 'Weapon236                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (237, 3, 'Weapon237                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (238, 5, 'Weapon238                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (239, 3, 'Weapon239                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (240, 7, 'Weapon240                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (241, 3, 'Weapon241                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (242, 6, 'Weapon242                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (243, 6, 'Weapon243                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (244, 9, 'Weapon244                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (245, 8, 'Weapon245                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (246, 7, 'Weapon246                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (247, 5, 'Weapon247                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (248, 7, 'Weapon248                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (249, 4, 'Weapon249                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (250, 3, 'Weapon250                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (251, 6, 'Weapon251                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (252, 2, 'Weapon252                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (253, 2, 'Weapon253                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (254, 4, 'Weapon254                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (255, 2, 'Weapon255                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (256, 8, 'Weapon256                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (257, 8, 'Weapon257                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (258, 2, 'Weapon258                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (259, 8, 'Weapon259                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (260, 4, 'Weapon260                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (261, 5, 'Weapon261                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (262, 9, 'Weapon262                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (263, 6, 'Weapon263                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (264, 8, 'Weapon264                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (265, 5, 'Weapon265                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (266, 2, 'Weapon266                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (267, 8, 'Weapon267                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (268, 3, 'Weapon268                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (269, 9, 'Weapon269                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (270, 4, 'Weapon270                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (271, 3, 'Weapon271                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (272, 3, 'Weapon272                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (273, 9, 'Weapon273                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (274, 8, 'Weapon274                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (275, 9, 'Weapon275                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (276, 5, 'Weapon276                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (277, 2, 'Weapon277                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (278, 8, 'Weapon278                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (279, 3, 'Weapon279                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (280, 3, 'Weapon280                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (281, 3, 'Weapon281                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (282, 3, 'Weapon282                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (283, 9, 'Weapon283                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (284, 7, 'Weapon284                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (285, 5, 'Weapon285                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (286, 4, 'Weapon286                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (287, 6, 'Weapon287                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (288, 8, 'Weapon288                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (289, 5, 'Weapon289                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (290, 4, 'Weapon290                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (291, 2, 'Weapon291                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (292, 8, 'Weapon292                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (293, 4, 'Weapon293                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (294, 7, 'Weapon294                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (295, 5, 'Weapon295                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (296, 5, 'Weapon296                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (297, 8, 'Weapon297                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (298, 6, 'Weapon298                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (299, 3, 'Weapon299                     ');
commit;
prompt 300 records committed...
insert into WEAPON (weaponid, minranktouse, name)
values (300, 3, 'Weapon300                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (301, 7, 'Weapon301                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (302, 9, 'Weapon302                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (303, 5, 'Weapon303                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (304, 7, 'Weapon304                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (305, 7, 'Weapon305                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (306, 5, 'Weapon306                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (307, 2, 'Weapon307                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (308, 6, 'Weapon308                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (309, 8, 'Weapon309                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (310, 8, 'Weapon310                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (311, 4, 'Weapon311                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (312, 3, 'Weapon312                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (313, 3, 'Weapon313                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (314, 7, 'Weapon314                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (315, 3, 'Weapon315                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (316, 7, 'Weapon316                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (317, 6, 'Weapon317                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (318, 6, 'Weapon318                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (319, 5, 'Weapon319                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (320, 5, 'Weapon320                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (321, 5, 'Weapon321                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (322, 5, 'Weapon322                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (323, 3, 'Weapon323                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (324, 7, 'Weapon324                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (325, 6, 'Weapon325                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (326, 4, 'Weapon326                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (327, 7, 'Weapon327                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (328, 7, 'Weapon328                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (329, 6, 'Weapon329                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (330, 2, 'Weapon330                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (331, 5, 'Weapon331                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (332, 9, 'Weapon332                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (333, 9, 'Weapon333                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (334, 2, 'Weapon334                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (335, 9, 'Weapon335                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (336, 7, 'Weapon336                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (337, 9, 'Weapon337                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (338, 3, 'Weapon338                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (339, 7, 'Weapon339                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (340, 7, 'Weapon340                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (341, 7, 'Weapon341                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (342, 5, 'Weapon342                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (343, 9, 'Weapon343                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (344, 8, 'Weapon344                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (345, 7, 'Weapon345                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (346, 4, 'Weapon346                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (347, 9, 'Weapon347                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (348, 3, 'Weapon348                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (349, 2, 'Weapon349                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (350, 3, 'Weapon350                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (351, 2, 'Weapon351                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (352, 6, 'Weapon352                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (353, 3, 'Weapon353                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (354, 8, 'Weapon354                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (355, 7, 'Weapon355                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (356, 6, 'Weapon356                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (357, 2, 'Weapon357                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (358, 3, 'Weapon358                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (359, 7, 'Weapon359                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (360, 6, 'Weapon360                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (361, 9, 'Weapon361                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (362, 2, 'Weapon362                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (363, 4, 'Weapon363                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (364, 5, 'Weapon364                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (365, 6, 'Weapon365                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (366, 3, 'Weapon366                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (367, 3, 'Weapon367                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (368, 4, 'Weapon368                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (369, 4, 'Weapon369                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (370, 9, 'Weapon370                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (371, 9, 'Weapon371                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (372, 9, 'Weapon372                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (373, 3, 'Weapon373                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (374, 4, 'Weapon374                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (375, 4, 'Weapon375                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (376, 8, 'Weapon376                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (377, 4, 'Weapon377                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (378, 4, 'Weapon378                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (379, 4, 'Weapon379                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (380, 8, 'Weapon380                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (381, 8, 'Weapon381                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (382, 6, 'Weapon382                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (383, 6, 'Weapon383                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (384, 8, 'Weapon384                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (385, 4, 'Weapon385                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (386, 9, 'Weapon386                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (387, 7, 'Weapon387                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (388, 9, 'Weapon388                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (389, 7, 'Weapon389                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (390, 4, 'Weapon390                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (391, 8, 'Weapon391                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (392, 8, 'Weapon392                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (393, 9, 'Weapon393                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (394, 6, 'Weapon394                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (395, 2, 'Weapon395                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (396, 3, 'Weapon396                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (397, 5, 'Weapon397                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (398, 7, 'Weapon398                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (399, 3, 'Weapon399                     ');
commit;
prompt 400 records committed...
insert into WEAPON (weaponid, minranktouse, name)
values (400, 6, 'Weapon400                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (401, 7, 'Weapon401                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (402, 7, 'Weapon402                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (403, 8, 'Weapon403                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (404, 9, 'Weapon404                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (405, 3, 'Weapon405                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (406, 4, 'Weapon406                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (407, 4, 'Weapon407                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (408, 6, 'Weapon408                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (409, 3, 'Weapon409                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (410, 4, 'Weapon410                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (411, 3, 'Weapon411                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (412, 6, 'Weapon412                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (413, 8, 'Weapon413                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (414, 8, 'Weapon414                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (415, 5, 'Weapon415                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (416, 6, 'Weapon416                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (417, 6, 'Weapon417                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (418, 4, 'Weapon418                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (419, 2, 'Weapon419                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (420, 6, 'Weapon420                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (421, 6, 'Weapon421                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (422, 9, 'Weapon422                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (423, 2, 'Weapon423                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (424, 2, 'Weapon424                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (425, 6, 'Weapon425                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (426, 3, 'Weapon426                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (427, 8, 'Weapon427                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (428, 4, 'Weapon428                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (429, 7, 'Weapon429                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (430, 8, 'Weapon430                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (431, 5, 'Weapon431                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (432, 2, 'Weapon432                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (433, 5, 'Weapon433                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (434, 7, 'Weapon434                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (435, 8, 'Weapon435                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (436, 9, 'Weapon436                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (437, 3, 'Weapon437                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (438, 5, 'Weapon438                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (439, 9, 'Weapon439                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (440, 4, 'Weapon440                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (441, 4, 'Weapon441                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (442, 4, 'Weapon442                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (443, 5, 'Weapon443                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (444, 9, 'Weapon444                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (445, 8, 'Weapon445                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (446, 8, 'Weapon446                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (447, 6, 'Weapon447                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (448, 8, 'Weapon448                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (449, 3, 'Weapon449                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (450, 6, 'Weapon450                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (451, 2, 'Weapon451                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (452, 2, 'Weapon452                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (453, 6, 'Weapon453                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (454, 7, 'Weapon454                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (455, 9, 'Weapon455                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (456, 9, 'Weapon456                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (457, 6, 'Weapon457                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (458, 4, 'Weapon458                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (459, 3, 'Weapon459                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (460, 4, 'Weapon460                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (461, 9, 'Weapon461                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (462, 9, 'Weapon462                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (463, 8, 'Weapon463                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (464, 6, 'Weapon464                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (465, 3, 'Weapon465                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (466, 2, 'Weapon466                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (467, 6, 'Weapon467                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (468, 3, 'Weapon468                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (469, 4, 'Weapon469                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (470, 6, 'Weapon470                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (471, 2, 'Weapon471                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (472, 3, 'Weapon472                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (473, 8, 'Weapon473                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (474, 9, 'Weapon474                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (475, 3, 'Weapon475                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (476, 3, 'Weapon476                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (477, 2, 'Weapon477                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (478, 6, 'Weapon478                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (479, 2, 'Weapon479                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (480, 7, 'Weapon480                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (481, 7, 'Weapon481                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (482, 8, 'Weapon482                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (483, 2, 'Weapon483                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (484, 9, 'Weapon484                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (485, 8, 'Weapon485                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (486, 6, 'Weapon486                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (487, 5, 'Weapon487                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (488, 3, 'Weapon488                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (489, 5, 'Weapon489                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (490, 2, 'Weapon490                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (491, 8, 'Weapon491                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (492, 5, 'Weapon492                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (493, 7, 'Weapon493                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (494, 2, 'Weapon494                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (495, 6, 'Weapon495                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (496, 2, 'Weapon496                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (497, 9, 'Weapon497                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (498, 4, 'Weapon498                     ');
insert into WEAPON (weaponid, minranktouse, name)
values (499, 8, 'Weapon499                     ');
commit;
prompt 500 records committed...
insert into WEAPON (weaponid, minranktouse, name)
values (500, 5, 'Weapon500                     ');
commit;
prompt 501 records loaded
prompt Loading EXPLOSIVES...
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('01-02-2033', 'dd-mm-yyyy'), 1);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-12-2033', 'dd-mm-yyyy'), 2);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('29-05-2030', 'dd-mm-yyyy'), 3);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-04-2034', 'dd-mm-yyyy'), 4);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-12-2033', 'dd-mm-yyyy'), 5);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('03-06-2030', 'dd-mm-yyyy'), 6);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('16-01-2033', 'dd-mm-yyyy'), 7);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-08-2034', 'dd-mm-yyyy'), 8);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-03-2030', 'dd-mm-yyyy'), 9);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-05-2033', 'dd-mm-yyyy'), 10);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-08-2030', 'dd-mm-yyyy'), 11);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-09-2033', 'dd-mm-yyyy'), 12);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-05-2030', 'dd-mm-yyyy'), 13);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-12-2034', 'dd-mm-yyyy'), 14);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-09-2030', 'dd-mm-yyyy'), 15);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-10-2030', 'dd-mm-yyyy'), 16);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-07-2033', 'dd-mm-yyyy'), 17);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-04-2033', 'dd-mm-yyyy'), 18);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-03-2034', 'dd-mm-yyyy'), 19);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-09-2034', 'dd-mm-yyyy'), 20);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-12-2033', 'dd-mm-yyyy'), 21);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('03-01-2031', 'dd-mm-yyyy'), 22);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-07-2031', 'dd-mm-yyyy'), 23);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-09-2032', 'dd-mm-yyyy'), 24);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-11-2030', 'dd-mm-yyyy'), 25);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-10-2030', 'dd-mm-yyyy'), 26);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-10-2034', 'dd-mm-yyyy'), 27);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-12-2030', 'dd-mm-yyyy'), 28);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-04-2034', 'dd-mm-yyyy'), 29);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-03-2030', 'dd-mm-yyyy'), 30);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-09-2034', 'dd-mm-yyyy'), 31);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-06-2031', 'dd-mm-yyyy'), 32);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-06-2034', 'dd-mm-yyyy'), 33);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-02-2031', 'dd-mm-yyyy'), 34);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-12-2030', 'dd-mm-yyyy'), 35);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-06-2034', 'dd-mm-yyyy'), 36);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-04-2034', 'dd-mm-yyyy'), 37);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-08-2034', 'dd-mm-yyyy'), 38);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-09-2033', 'dd-mm-yyyy'), 39);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('12-07-2031', 'dd-mm-yyyy'), 40);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-05-2031', 'dd-mm-yyyy'), 41);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-10-2034', 'dd-mm-yyyy'), 42);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-09-2034', 'dd-mm-yyyy'), 43);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-02-2030', 'dd-mm-yyyy'), 44);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-08-2030', 'dd-mm-yyyy'), 45);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('31-05-2031', 'dd-mm-yyyy'), 46);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-06-2032', 'dd-mm-yyyy'), 47);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-02-2031', 'dd-mm-yyyy'), 48);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-07-2034', 'dd-mm-yyyy'), 49);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-05-2032', 'dd-mm-yyyy'), 50);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-03-2033', 'dd-mm-yyyy'), 51);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-06-2032', 'dd-mm-yyyy'), 52);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-08-2032', 'dd-mm-yyyy'), 53);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-03-2030', 'dd-mm-yyyy'), 54);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-02-2034', 'dd-mm-yyyy'), 55);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-12-2033', 'dd-mm-yyyy'), 56);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-10-2034', 'dd-mm-yyyy'), 57);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-03-2030', 'dd-mm-yyyy'), 58);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('12-03-2030', 'dd-mm-yyyy'), 59);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-04-2033', 'dd-mm-yyyy'), 60);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('05-08-2030', 'dd-mm-yyyy'), 61);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('11-10-2032', 'dd-mm-yyyy'), 62);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-01-2031', 'dd-mm-yyyy'), 63);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('16-08-2034', 'dd-mm-yyyy'), 64);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-07-2034', 'dd-mm-yyyy'), 65);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('01-08-2031', 'dd-mm-yyyy'), 66);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-03-2033', 'dd-mm-yyyy'), 67);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-09-2034', 'dd-mm-yyyy'), 68);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-08-2034', 'dd-mm-yyyy'), 69);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-06-2034', 'dd-mm-yyyy'), 70);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-04-2032', 'dd-mm-yyyy'), 71);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-11-2034', 'dd-mm-yyyy'), 72);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-02-2033', 'dd-mm-yyyy'), 73);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-12-2033', 'dd-mm-yyyy'), 74);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-10-2034', 'dd-mm-yyyy'), 75);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-08-2034', 'dd-mm-yyyy'), 76);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('02-06-2032', 'dd-mm-yyyy'), 77);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-12-2033', 'dd-mm-yyyy'), 78);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-10-2033', 'dd-mm-yyyy'), 79);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('01-06-2030', 'dd-mm-yyyy'), 80);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-03-2033', 'dd-mm-yyyy'), 81);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-01-2033', 'dd-mm-yyyy'), 82);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-06-2033', 'dd-mm-yyyy'), 83);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('02-12-2031', 'dd-mm-yyyy'), 84);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-05-2030', 'dd-mm-yyyy'), 85);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-11-2033', 'dd-mm-yyyy'), 86);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-05-2030', 'dd-mm-yyyy'), 87);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-03-2034', 'dd-mm-yyyy'), 88);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-05-2031', 'dd-mm-yyyy'), 89);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-03-2031', 'dd-mm-yyyy'), 90);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-09-2032', 'dd-mm-yyyy'), 91);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-11-2034', 'dd-mm-yyyy'), 92);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-06-2032', 'dd-mm-yyyy'), 93);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-10-2034', 'dd-mm-yyyy'), 94);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-02-2031', 'dd-mm-yyyy'), 95);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-11-2030', 'dd-mm-yyyy'), 96);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-05-2031', 'dd-mm-yyyy'), 97);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('11-12-2032', 'dd-mm-yyyy'), 98);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('03-11-2034', 'dd-mm-yyyy'), 99);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-04-2030', 'dd-mm-yyyy'), 100);
commit;
prompt 100 records committed...
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-11-2030', 'dd-mm-yyyy'), 101);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-09-2034', 'dd-mm-yyyy'), 102);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-12-2030', 'dd-mm-yyyy'), 103);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-08-2032', 'dd-mm-yyyy'), 104);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('02-05-2031', 'dd-mm-yyyy'), 105);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-01-2033', 'dd-mm-yyyy'), 106);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-02-2032', 'dd-mm-yyyy'), 107);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-01-2030', 'dd-mm-yyyy'), 108);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-02-2034', 'dd-mm-yyyy'), 109);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('05-12-2032', 'dd-mm-yyyy'), 110);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-05-2034', 'dd-mm-yyyy'), 111);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('29-12-2032', 'dd-mm-yyyy'), 112);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-04-2033', 'dd-mm-yyyy'), 113);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-08-2033', 'dd-mm-yyyy'), 114);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('05-03-2030', 'dd-mm-yyyy'), 115);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('12-12-2030', 'dd-mm-yyyy'), 116);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('16-08-2031', 'dd-mm-yyyy'), 117);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('12-06-2031', 'dd-mm-yyyy'), 118);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('31-10-2033', 'dd-mm-yyyy'), 119);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-11-2030', 'dd-mm-yyyy'), 120);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-10-2032', 'dd-mm-yyyy'), 121);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-12-2030', 'dd-mm-yyyy'), 122);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('11-08-2034', 'dd-mm-yyyy'), 123);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-01-2032', 'dd-mm-yyyy'), 124);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-03-2034', 'dd-mm-yyyy'), 125);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-06-2033', 'dd-mm-yyyy'), 126);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-09-2030', 'dd-mm-yyyy'), 127);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-06-2034', 'dd-mm-yyyy'), 128);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-11-2031', 'dd-mm-yyyy'), 129);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-08-2034', 'dd-mm-yyyy'), 130);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-11-2034', 'dd-mm-yyyy'), 131);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-04-2033', 'dd-mm-yyyy'), 132);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-09-2033', 'dd-mm-yyyy'), 133);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-10-2034', 'dd-mm-yyyy'), 134);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('16-01-2033', 'dd-mm-yyyy'), 135);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-07-2034', 'dd-mm-yyyy'), 136);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-01-2031', 'dd-mm-yyyy'), 137);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-07-2030', 'dd-mm-yyyy'), 138);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-12-2031', 'dd-mm-yyyy'), 139);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-06-2034', 'dd-mm-yyyy'), 140);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-10-2031', 'dd-mm-yyyy'), 141);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-10-2034', 'dd-mm-yyyy'), 142);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('16-03-2032', 'dd-mm-yyyy'), 143);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-08-2034', 'dd-mm-yyyy'), 144);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-10-2034', 'dd-mm-yyyy'), 145);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('30-11-2032', 'dd-mm-yyyy'), 146);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-11-2030', 'dd-mm-yyyy'), 147);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-01-2034', 'dd-mm-yyyy'), 148);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-03-2031', 'dd-mm-yyyy'), 149);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-12-2034', 'dd-mm-yyyy'), 150);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-10-2031', 'dd-mm-yyyy'), 151);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-02-2034', 'dd-mm-yyyy'), 152);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-11-2033', 'dd-mm-yyyy'), 153);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-06-2034', 'dd-mm-yyyy'), 154);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-04-2032', 'dd-mm-yyyy'), 155);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('03-02-2030', 'dd-mm-yyyy'), 156);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-02-2033', 'dd-mm-yyyy'), 157);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-09-2031', 'dd-mm-yyyy'), 158);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-02-2032', 'dd-mm-yyyy'), 159);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-03-2033', 'dd-mm-yyyy'), 160);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('04-09-2032', 'dd-mm-yyyy'), 161);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-12-2031', 'dd-mm-yyyy'), 162);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-05-2033', 'dd-mm-yyyy'), 163);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-10-2032', 'dd-mm-yyyy'), 164);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-09-2032', 'dd-mm-yyyy'), 165);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-06-2032', 'dd-mm-yyyy'), 166);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-07-2032', 'dd-mm-yyyy'), 167);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('30-04-2034', 'dd-mm-yyyy'), 168);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-02-2034', 'dd-mm-yyyy'), 169);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-02-2032', 'dd-mm-yyyy'), 170);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-06-2030', 'dd-mm-yyyy'), 171);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-05-2033', 'dd-mm-yyyy'), 172);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('01-04-2031', 'dd-mm-yyyy'), 173);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-01-2031', 'dd-mm-yyyy'), 174);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-07-2030', 'dd-mm-yyyy'), 175);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-07-2032', 'dd-mm-yyyy'), 176);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-11-2033', 'dd-mm-yyyy'), 177);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-06-2030', 'dd-mm-yyyy'), 178);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-02-2031', 'dd-mm-yyyy'), 179);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-06-2030', 'dd-mm-yyyy'), 180);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('31-05-2033', 'dd-mm-yyyy'), 181);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('29-06-2032', 'dd-mm-yyyy'), 182);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-08-2033', 'dd-mm-yyyy'), 183);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-10-2030', 'dd-mm-yyyy'), 184);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('05-02-2034', 'dd-mm-yyyy'), 185);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('13-03-2032', 'dd-mm-yyyy'), 186);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-05-2033', 'dd-mm-yyyy'), 187);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('31-10-2031', 'dd-mm-yyyy'), 188);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('15-07-2031', 'dd-mm-yyyy'), 189);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-02-2030', 'dd-mm-yyyy'), 190);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-10-2032', 'dd-mm-yyyy'), 191);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-09-2033', 'dd-mm-yyyy'), 192);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-07-2032', 'dd-mm-yyyy'), 193);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('30-04-2030', 'dd-mm-yyyy'), 194);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-04-2032', 'dd-mm-yyyy'), 195);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-07-2034', 'dd-mm-yyyy'), 196);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('30-03-2032', 'dd-mm-yyyy'), 197);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-09-2034', 'dd-mm-yyyy'), 198);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-12-2033', 'dd-mm-yyyy'), 199);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-12-2033', 'dd-mm-yyyy'), 200);
commit;
prompt 200 records committed...
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-01-2030', 'dd-mm-yyyy'), 201);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-04-2031', 'dd-mm-yyyy'), 202);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('12-06-2032', 'dd-mm-yyyy'), 203);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-06-2032', 'dd-mm-yyyy'), 204);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-01-2031', 'dd-mm-yyyy'), 205);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('19-04-2032', 'dd-mm-yyyy'), 206);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-09-2031', 'dd-mm-yyyy'), 207);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-10-2032', 'dd-mm-yyyy'), 208);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-11-2034', 'dd-mm-yyyy'), 209);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-06-2033', 'dd-mm-yyyy'), 210);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('14-07-2030', 'dd-mm-yyyy'), 211);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('27-07-2031', 'dd-mm-yyyy'), 212);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-03-2034', 'dd-mm-yyyy'), 213);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-09-2030', 'dd-mm-yyyy'), 214);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-01-2034', 'dd-mm-yyyy'), 215);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-10-2031', 'dd-mm-yyyy'), 216);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-03-2034', 'dd-mm-yyyy'), 217);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-09-2031', 'dd-mm-yyyy'), 218);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-08-2034', 'dd-mm-yyyy'), 219);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('10-04-2034', 'dd-mm-yyyy'), 220);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('05-08-2032', 'dd-mm-yyyy'), 221);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-04-2030', 'dd-mm-yyyy'), 222);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('24-01-2033', 'dd-mm-yyyy'), 223);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('30-08-2031', 'dd-mm-yyyy'), 224);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-06-2032', 'dd-mm-yyyy'), 225);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('23-09-2032', 'dd-mm-yyyy'), 226);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('26-11-2032', 'dd-mm-yyyy'), 227);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-06-2033', 'dd-mm-yyyy'), 228);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('11-10-2030', 'dd-mm-yyyy'), 229);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-07-2034', 'dd-mm-yyyy'), 230);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-06-2031', 'dd-mm-yyyy'), 231);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('09-12-2033', 'dd-mm-yyyy'), 232);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('29-09-2031', 'dd-mm-yyyy'), 233);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('22-07-2033', 'dd-mm-yyyy'), 234);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-11-2032', 'dd-mm-yyyy'), 235);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('07-06-2034', 'dd-mm-yyyy'), 236);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-10-2034', 'dd-mm-yyyy'), 237);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('21-04-2030', 'dd-mm-yyyy'), 238);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-07-2033', 'dd-mm-yyyy'), 239);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('01-01-2034', 'dd-mm-yyyy'), 240);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('17-08-2030', 'dd-mm-yyyy'), 241);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('28-11-2033', 'dd-mm-yyyy'), 242);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('25-05-2033', 'dd-mm-yyyy'), 243);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('02-10-2030', 'dd-mm-yyyy'), 244);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-11-2030', 'dd-mm-yyyy'), 245);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('18-10-2031', 'dd-mm-yyyy'), 246);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('06-07-2030', 'dd-mm-yyyy'), 247);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('11-09-2031', 'dd-mm-yyyy'), 248);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('20-01-2032', 'dd-mm-yyyy'), 249);
insert into EXPLOSIVES (lastdatetouse, weaponid)
values (to_date('08-12-2031', 'dd-mm-yyyy'), 250);
commit;
prompt 250 records loaded
prompt Loading FIGHTER...
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 1);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 2);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 3);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 4);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 5);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 6);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 7);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 8);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 9);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 10);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 11);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 12);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 14);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 15);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 18);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 19);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 20);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 21);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 22);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 23);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 24);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 25);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 26);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 27);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 28);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 29);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 30);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 31);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 32);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 33);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 35);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 36);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 37);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 38);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 39);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 40);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 41);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 42);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 43);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 45);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 46);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 47);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 49);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 50);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 51);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 52);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 53);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 54);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 55);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 57);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 58);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 59);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 60);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 61);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 62);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 63);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 64);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 65);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 66);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 67);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 68);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 69);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 70);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 71);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 72);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 73);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 74);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 75);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 77);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 78);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 79);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 80);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 81);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 82);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 83);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 84);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 85);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 86);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 87);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 89);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 90);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 91);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 92);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 93);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 94);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 95);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 96);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 97);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 98);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 99);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 100);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 101);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 102);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 103);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 104);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 105);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 106);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 107);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 108);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 109);
commit;
prompt 100 records committed...
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 110);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 112);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 113);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 114);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 115);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 116);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 117);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 119);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 120);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 121);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 122);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 123);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 124);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 125);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 126);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 127);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 128);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 129);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 130);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 131);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 133);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 134);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 135);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 136);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 138);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 139);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 140);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 141);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 143);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 144);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 145);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 146);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 147);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 148);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 149);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 150);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 151);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 152);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 153);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 154);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 155);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 156);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 157);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 158);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 159);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 160);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 161);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 162);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 163);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 164);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 165);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 166);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 167);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 168);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 169);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 170);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 171);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 172);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 173);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 174);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 175);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 177);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 178);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 179);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 181);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 182);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 183);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 185);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 186);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 187);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 188);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 189);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 190);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 191);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 192);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 193);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 194);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 195);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 196);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 197);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 199);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 200);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 201);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 202);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 203);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 204);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 205);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 206);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 207);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 208);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 209);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 210);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 211);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 212);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 213);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 214);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 215);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 216);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 217);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 218);
commit;
prompt 200 records committed...
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 219);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 220);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 221);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 222);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 223);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 224);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 226);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 227);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 228);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 229);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 230);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 231);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 232);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 233);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 234);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 235);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 236);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 237);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 238);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 239);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 240);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 241);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 242);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 243);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 244);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 245);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 246);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 247);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 248);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 249);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 250);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 251);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 252);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 253);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 254);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 255);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 256);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 257);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 258);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 259);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 260);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 261);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 262);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 263);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 264);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 265);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 266);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 267);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 268);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 269);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 270);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 271);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 272);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 273);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 274);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 275);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 276);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 277);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 278);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 279);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 280);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 281);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 282);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 283);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 284);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 285);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 286);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 287);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 288);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 289);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 290);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 291);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 292);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 293);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 294);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 295);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 296);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 297);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 298);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 299);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 300);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 301);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 302);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 303);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 304);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 305);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 306);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 307);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 308);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 309);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 310);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 311);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 312);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 313);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 314);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 315);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 316);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 317);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 318);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 319);
commit;
prompt 300 records committed...
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 320);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 321);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 322);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 323);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 325);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 326);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 327);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 328);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 329);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 330);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 332);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 333);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 334);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 335);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 336);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 337);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 338);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 339);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 340);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 341);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 342);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 343);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 344);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 345);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 346);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 347);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 348);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 349);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 350);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 351);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 352);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 353);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 354);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 355);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 356);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 357);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 358);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 359);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 360);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 361);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 363);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 364);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 365);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 366);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 367);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 368);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 369);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 370);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 371);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 372);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 373);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 374);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 375);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 376);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 377);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 378);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 379);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 380);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 381);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 382);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 383);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 384);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 385);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 386);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 387);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 388);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 389);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 390);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 391);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 392);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 393);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 394);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 395);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 396);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 397);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 398);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 400);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 401);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 402);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 404);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 405);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 406);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 407);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 408);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 409);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 410);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 412);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 413);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 415);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 416);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 417);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 418);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 419);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 420);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 421);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 422);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 423);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 424);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 425);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 427);
commit;
prompt 400 records committed...
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 428);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 429);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 430);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 431);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 432);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 433);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 434);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 435);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 436);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 437);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 438);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 439);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 440);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 441);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 442);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 443);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 444);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 445);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 446);
insert into FIGHTER (role, soldierid)
values ('Simple                        ', 447);
insert into FIGHTER (role, soldierid)
values ('Paramedic                     ', 448);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 449);
insert into FIGHTER (role, soldierid)
values ('Sniper                        ', 450);
commit;
prompt 423 records loaded
prompt Loading ROBOTS...
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 251);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 252);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 253);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 254);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 255);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 256);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 257);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 258);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 259);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 260);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 261);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 262);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 263);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 264);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 265);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 266);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 267);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 268);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 269);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 270);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 271);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 272);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 273);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 274);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 275);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 276);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 277);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 278);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 279);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 280);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 281);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 282);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 283);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 284);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 285);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 286);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 287);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 288);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 289);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 290);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 291);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 292);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 293);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 294);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 295);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 296);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 297);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 298);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 299);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 300);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 301);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 302);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 303);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 304);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 305);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 306);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 307);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 308);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 309);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 310);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 311);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 312);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 313);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 314);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 315);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 316);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 317);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 318);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 319);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 320);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 321);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 322);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 323);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 324);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 325);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 326);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 327);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 328);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 329);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 330);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 331);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 332);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 333);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 334);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 335);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 336);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 337);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 338);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 339);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 340);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 341);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 342);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 343);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 344);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 345);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 346);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 347);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 348);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 349);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 350);
commit;
prompt 100 records committed...
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 351);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 352);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 353);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 354);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 355);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 356);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 357);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 358);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 359);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 360);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 361);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 362);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 363);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 364);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 365);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 366);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 367);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 368);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 369);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 370);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 371);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 372);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 373);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 374);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 375);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 376);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 377);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 378);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 379);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 380);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 381);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 382);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 383);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 384);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 385);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 386);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 387);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 388);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 389);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 390);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 391);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 392);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 393);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 394);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 395);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 396);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 397);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 398);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 399);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 400);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 401);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 402);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 403);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 404);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 405);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 406);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 407);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 408);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 409);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 410);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 411);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 412);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 413);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 414);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 415);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 416);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 417);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 418);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 419);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 420);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 421);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 422);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 423);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 424);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 425);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 426);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 427);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 428);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 429);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 430);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 431);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 432);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 433);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 434);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 435);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 436);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 437);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 438);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 439);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 440);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 441);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 442);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 443);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 444);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 445);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 446);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 447);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 448);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 449);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 450);
commit;
prompt 200 records committed...
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 451);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 452);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 453);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 454);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 455);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 456);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 457);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 458);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 459);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 460);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 461);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 462);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 463);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 464);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 465);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 466);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 467);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 468);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 469);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 470);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 471);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 472);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 473);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 474);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 475);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 476);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 477);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 478);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 479);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 480);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 481);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 482);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 483);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 484);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 485);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 486);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 487);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 488);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 489);
insert into ROBOTS (maxhoursbattary, weaponid)
values (6, 490);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 491);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 492);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 493);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 494);
insert into ROBOTS (maxhoursbattary, weaponid)
values (7, 495);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 496);
insert into ROBOTS (maxhoursbattary, weaponid)
values (10, 497);
insert into ROBOTS (maxhoursbattary, weaponid)
values (5, 498);
insert into ROBOTS (maxhoursbattary, weaponid)
values (8, 499);
insert into ROBOTS (maxhoursbattary, weaponid)
values (9, 500);
commit;
prompt 250 records loaded
prompt Loading USESEXPLOSIVE...
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 16);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 34);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 56);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 76);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 85);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 89);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 114);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 135);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 173);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 207);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 217);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 228);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (1, 230);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 3);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 14);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 73);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 129);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 187);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (2, 219);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 78);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 82);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 112);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 165);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 180);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 189);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 208);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 225);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 237);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (3, 249);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 20);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 46);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 49);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 54);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 65);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 69);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 74);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 93);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 96);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 102);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 164);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 184);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 213);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 215);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (4, 240);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 31);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 43);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 44);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 101);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 122);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 128);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 133);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 148);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 150);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 153);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 157);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 158);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 167);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 185);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 201);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 226);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 231);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (5, 238);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 29);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 33);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 52);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 64);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 84);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 103);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 106);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 108);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 116);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 141);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 192);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 221);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (6, 224);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 22);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 28);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 71);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 121);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 136);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 149);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 171);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 177);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 182);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 193);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 205);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (7, 210);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 47);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 55);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 59);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 61);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 81);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 126);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 161);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 183);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 199);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 202);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 204);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 220);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 233);
commit;
prompt 100 records committed...
insert into USESEXPLOSIVE (departmentid, weaponid)
values (8, 247);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 23);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 36);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 62);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 70);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 79);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 110);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 117);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 119);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 123);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 132);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 159);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 174);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 176);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 191);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 194);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 214);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (9, 244);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 9);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 13);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 94);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 97);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 152);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 156);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 190);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (10, 206);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 27);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 30);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 32);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 40);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 67);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 87);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 142);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 144);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 160);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (11, 232);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 21);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 42);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 80);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 88);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 113);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 120);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 147);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 216);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 218);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 223);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (12, 234);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 35);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 95);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 98);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 115);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 127);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 137);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 138);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 163);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 168);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 170);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 236);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (13, 242);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 1);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 7);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 11);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 50);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 51);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 77);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 83);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 211);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (14, 229);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (15, 15);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (15, 154);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (15, 239);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (15, 243);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 18);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 24);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 38);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 48);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 111);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 131);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 166);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 186);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 200);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 222);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 227);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (16, 246);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (17, 17);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (17, 75);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (17, 130);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (17, 245);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 41);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 57);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 68);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 86);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 125);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 151);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 197);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (18, 203);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 5);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 6);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 45);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 63);
commit;
prompt 200 records committed...
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 72);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 105);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 143);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 155);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 162);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 169);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 178);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 209);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 235);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 248);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (19, 250);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 8);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 39);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 66);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 92);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 100);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (20, 241);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 10);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 37);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 60);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 104);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 118);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 188);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 196);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (21, 198);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (22, 2);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (22, 26);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (22, 139);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 4);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 91);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 99);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 109);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 124);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 175);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 179);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 181);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (23, 212);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 19);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 53);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 107);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 134);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 146);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (24, 195);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 12);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 25);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 58);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 90);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 140);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 145);
insert into USESEXPLOSIVE (departmentid, weaponid)
values (25, 172);
commit;
prompt 250 records loaded
prompt Loading USESROBOTS...
insert into USESROBOTS (departmentid, weaponid)
values (26, 266);
insert into USESROBOTS (departmentid, weaponid)
values (26, 278);
insert into USESROBOTS (departmentid, weaponid)
values (26, 284);
insert into USESROBOTS (departmentid, weaponid)
values (26, 293);
insert into USESROBOTS (departmentid, weaponid)
values (26, 310);
insert into USESROBOTS (departmentid, weaponid)
values (26, 419);
insert into USESROBOTS (departmentid, weaponid)
values (26, 420);
insert into USESROBOTS (departmentid, weaponid)
values (26, 483);
insert into USESROBOTS (departmentid, weaponid)
values (27, 260);
insert into USESROBOTS (departmentid, weaponid)
values (27, 268);
insert into USESROBOTS (departmentid, weaponid)
values (27, 274);
insert into USESROBOTS (departmentid, weaponid)
values (27, 279);
insert into USESROBOTS (departmentid, weaponid)
values (27, 298);
insert into USESROBOTS (departmentid, weaponid)
values (27, 306);
insert into USESROBOTS (departmentid, weaponid)
values (27, 313);
insert into USESROBOTS (departmentid, weaponid)
values (27, 342);
insert into USESROBOTS (departmentid, weaponid)
values (27, 373);
insert into USESROBOTS (departmentid, weaponid)
values (27, 424);
insert into USESROBOTS (departmentid, weaponid)
values (27, 480);
insert into USESROBOTS (departmentid, weaponid)
values (27, 491);
insert into USESROBOTS (departmentid, weaponid)
values (28, 269);
insert into USESROBOTS (departmentid, weaponid)
values (28, 358);
insert into USESROBOTS (departmentid, weaponid)
values (28, 359);
insert into USESROBOTS (departmentid, weaponid)
values (28, 423);
insert into USESROBOTS (departmentid, weaponid)
values (29, 267);
insert into USESROBOTS (departmentid, weaponid)
values (29, 299);
insert into USESROBOTS (departmentid, weaponid)
values (29, 335);
insert into USESROBOTS (departmentid, weaponid)
values (29, 343);
insert into USESROBOTS (departmentid, weaponid)
values (29, 353);
insert into USESROBOTS (departmentid, weaponid)
values (29, 397);
insert into USESROBOTS (departmentid, weaponid)
values (29, 422);
insert into USESROBOTS (departmentid, weaponid)
values (29, 468);
insert into USESROBOTS (departmentid, weaponid)
values (29, 469);
insert into USESROBOTS (departmentid, weaponid)
values (30, 255);
insert into USESROBOTS (departmentid, weaponid)
values (30, 259);
insert into USESROBOTS (departmentid, weaponid)
values (30, 281);
insert into USESROBOTS (departmentid, weaponid)
values (30, 294);
insert into USESROBOTS (departmentid, weaponid)
values (30, 303);
insert into USESROBOTS (departmentid, weaponid)
values (30, 308);
insert into USESROBOTS (departmentid, weaponid)
values (30, 317);
insert into USESROBOTS (departmentid, weaponid)
values (30, 328);
insert into USESROBOTS (departmentid, weaponid)
values (30, 344);
insert into USESROBOTS (departmentid, weaponid)
values (30, 360);
insert into USESROBOTS (departmentid, weaponid)
values (30, 407);
insert into USESROBOTS (departmentid, weaponid)
values (30, 432);
insert into USESROBOTS (departmentid, weaponid)
values (30, 449);
insert into USESROBOTS (departmentid, weaponid)
values (30, 455);
insert into USESROBOTS (departmentid, weaponid)
values (30, 465);
insert into USESROBOTS (departmentid, weaponid)
values (30, 485);
insert into USESROBOTS (departmentid, weaponid)
values (31, 265);
insert into USESROBOTS (departmentid, weaponid)
values (31, 275);
insert into USESROBOTS (departmentid, weaponid)
values (31, 287);
insert into USESROBOTS (departmentid, weaponid)
values (31, 311);
insert into USESROBOTS (departmentid, weaponid)
values (31, 318);
insert into USESROBOTS (departmentid, weaponid)
values (31, 338);
insert into USESROBOTS (departmentid, weaponid)
values (31, 393);
insert into USESROBOTS (departmentid, weaponid)
values (31, 394);
insert into USESROBOTS (departmentid, weaponid)
values (31, 411);
insert into USESROBOTS (departmentid, weaponid)
values (31, 430);
insert into USESROBOTS (departmentid, weaponid)
values (31, 456);
insert into USESROBOTS (departmentid, weaponid)
values (31, 486);
insert into USESROBOTS (departmentid, weaponid)
values (31, 496);
insert into USESROBOTS (departmentid, weaponid)
values (32, 263);
insert into USESROBOTS (departmentid, weaponid)
values (32, 276);
insert into USESROBOTS (departmentid, weaponid)
values (32, 277);
insert into USESROBOTS (departmentid, weaponid)
values (32, 288);
insert into USESROBOTS (departmentid, weaponid)
values (32, 295);
insert into USESROBOTS (departmentid, weaponid)
values (32, 323);
insert into USESROBOTS (departmentid, weaponid)
values (32, 368);
insert into USESROBOTS (departmentid, weaponid)
values (32, 434);
insert into USESROBOTS (departmentid, weaponid)
values (32, 467);
insert into USESROBOTS (departmentid, weaponid)
values (33, 256);
insert into USESROBOTS (departmentid, weaponid)
values (33, 273);
insert into USESROBOTS (departmentid, weaponid)
values (33, 293);
insert into USESROBOTS (departmentid, weaponid)
values (33, 296);
insert into USESROBOTS (departmentid, weaponid)
values (33, 302);
insert into USESROBOTS (departmentid, weaponid)
values (33, 366);
insert into USESROBOTS (departmentid, weaponid)
values (33, 367);
insert into USESROBOTS (departmentid, weaponid)
values (33, 403);
insert into USESROBOTS (departmentid, weaponid)
values (33, 410);
insert into USESROBOTS (departmentid, weaponid)
values (33, 429);
insert into USESROBOTS (departmentid, weaponid)
values (33, 459);
insert into USESROBOTS (departmentid, weaponid)
values (33, 481);
insert into USESROBOTS (departmentid, weaponid)
values (34, 262);
insert into USESROBOTS (departmentid, weaponid)
values (34, 270);
insert into USESROBOTS (departmentid, weaponid)
values (34, 275);
insert into USESROBOTS (departmentid, weaponid)
values (34, 279);
insert into USESROBOTS (departmentid, weaponid)
values (34, 286);
insert into USESROBOTS (departmentid, weaponid)
values (34, 289);
insert into USESROBOTS (departmentid, weaponid)
values (34, 324);
insert into USESROBOTS (departmentid, weaponid)
values (34, 336);
insert into USESROBOTS (departmentid, weaponid)
values (34, 340);
insert into USESROBOTS (departmentid, weaponid)
values (34, 341);
insert into USESROBOTS (departmentid, weaponid)
values (34, 357);
insert into USESROBOTS (departmentid, weaponid)
values (34, 362);
insert into USESROBOTS (departmentid, weaponid)
values (34, 371);
insert into USESROBOTS (departmentid, weaponid)
values (34, 375);
insert into USESROBOTS (departmentid, weaponid)
values (34, 378);
insert into USESROBOTS (departmentid, weaponid)
values (34, 427);
insert into USESROBOTS (departmentid, weaponid)
values (34, 464);
commit;
prompt 100 records committed...
insert into USESROBOTS (departmentid, weaponid)
values (34, 473);
insert into USESROBOTS (departmentid, weaponid)
values (35, 272);
insert into USESROBOTS (departmentid, weaponid)
values (35, 312);
insert into USESROBOTS (departmentid, weaponid)
values (35, 325);
insert into USESROBOTS (departmentid, weaponid)
values (35, 354);
insert into USESROBOTS (departmentid, weaponid)
values (35, 364);
insert into USESROBOTS (departmentid, weaponid)
values (35, 417);
insert into USESROBOTS (departmentid, weaponid)
values (35, 425);
insert into USESROBOTS (departmentid, weaponid)
values (35, 444);
insert into USESROBOTS (departmentid, weaponid)
values (35, 450);
insert into USESROBOTS (departmentid, weaponid)
values (36, 252);
insert into USESROBOTS (departmentid, weaponid)
values (36, 257);
insert into USESROBOTS (departmentid, weaponid)
values (36, 259);
insert into USESROBOTS (departmentid, weaponid)
values (36, 260);
insert into USESROBOTS (departmentid, weaponid)
values (36, 261);
insert into USESROBOTS (departmentid, weaponid)
values (36, 326);
insert into USESROBOTS (departmentid, weaponid)
values (36, 333);
insert into USESROBOTS (departmentid, weaponid)
values (36, 345);
insert into USESROBOTS (departmentid, weaponid)
values (36, 372);
insert into USESROBOTS (departmentid, weaponid)
values (36, 384);
insert into USESROBOTS (departmentid, weaponid)
values (36, 408);
insert into USESROBOTS (departmentid, weaponid)
values (36, 500);
insert into USESROBOTS (departmentid, weaponid)
values (37, 254);
insert into USESROBOTS (departmentid, weaponid)
values (37, 264);
insert into USESROBOTS (departmentid, weaponid)
values (37, 282);
insert into USESROBOTS (departmentid, weaponid)
values (37, 288);
insert into USESROBOTS (departmentid, weaponid)
values (37, 301);
insert into USESROBOTS (departmentid, weaponid)
values (37, 327);
insert into USESROBOTS (departmentid, weaponid)
values (37, 379);
insert into USESROBOTS (departmentid, weaponid)
values (37, 388);
insert into USESROBOTS (departmentid, weaponid)
values (37, 396);
insert into USESROBOTS (departmentid, weaponid)
values (37, 445);
insert into USESROBOTS (departmentid, weaponid)
values (37, 454);
insert into USESROBOTS (departmentid, weaponid)
values (37, 494);
insert into USESROBOTS (departmentid, weaponid)
values (38, 271);
insert into USESROBOTS (departmentid, weaponid)
values (38, 273);
insert into USESROBOTS (departmentid, weaponid)
values (38, 276);
insert into USESROBOTS (departmentid, weaponid)
values (38, 284);
insert into USESROBOTS (departmentid, weaponid)
values (38, 286);
insert into USESROBOTS (departmentid, weaponid)
values (38, 292);
insert into USESROBOTS (departmentid, weaponid)
values (38, 305);
insert into USESROBOTS (departmentid, weaponid)
values (38, 329);
insert into USESROBOTS (departmentid, weaponid)
values (38, 377);
insert into USESROBOTS (departmentid, weaponid)
values (38, 383);
insert into USESROBOTS (departmentid, weaponid)
values (38, 399);
insert into USESROBOTS (departmentid, weaponid)
values (38, 409);
insert into USESROBOTS (departmentid, weaponid)
values (38, 415);
insert into USESROBOTS (departmentid, weaponid)
values (38, 418);
insert into USESROBOTS (departmentid, weaponid)
values (38, 437);
insert into USESROBOTS (departmentid, weaponid)
values (39, 251);
insert into USESROBOTS (departmentid, weaponid)
values (39, 266);
insert into USESROBOTS (departmentid, weaponid)
values (39, 267);
insert into USESROBOTS (departmentid, weaponid)
values (39, 285);
insert into USESROBOTS (departmentid, weaponid)
values (39, 321);
insert into USESROBOTS (departmentid, weaponid)
values (39, 322);
insert into USESROBOTS (departmentid, weaponid)
values (39, 387);
insert into USESROBOTS (departmentid, weaponid)
values (39, 395);
insert into USESROBOTS (departmentid, weaponid)
values (39, 401);
insert into USESROBOTS (departmentid, weaponid)
values (39, 405);
insert into USESROBOTS (departmentid, weaponid)
values (39, 435);
insert into USESROBOTS (departmentid, weaponid)
values (39, 447);
insert into USESROBOTS (departmentid, weaponid)
values (39, 472);
insert into USESROBOTS (departmentid, weaponid)
values (39, 484);
insert into USESROBOTS (departmentid, weaponid)
values (40, 272);
insert into USESROBOTS (departmentid, weaponid)
values (40, 274);
insert into USESROBOTS (departmentid, weaponid)
values (40, 283);
insert into USESROBOTS (departmentid, weaponid)
values (40, 297);
insert into USESROBOTS (departmentid, weaponid)
values (40, 351);
insert into USESROBOTS (departmentid, weaponid)
values (40, 355);
insert into USESROBOTS (departmentid, weaponid)
values (40, 406);
insert into USESROBOTS (departmentid, weaponid)
values (40, 438);
insert into USESROBOTS (departmentid, weaponid)
values (40, 443);
insert into USESROBOTS (departmentid, weaponid)
values (40, 458);
insert into USESROBOTS (departmentid, weaponid)
values (40, 482);
insert into USESROBOTS (departmentid, weaponid)
values (40, 495);
insert into USESROBOTS (departmentid, weaponid)
values (40, 499);
insert into USESROBOTS (departmentid, weaponid)
values (41, 255);
insert into USESROBOTS (departmentid, weaponid)
values (41, 261);
insert into USESROBOTS (departmentid, weaponid)
values (41, 268);
insert into USESROBOTS (departmentid, weaponid)
values (41, 282);
insert into USESROBOTS (departmentid, weaponid)
values (41, 285);
insert into USESROBOTS (departmentid, weaponid)
values (41, 287);
insert into USESROBOTS (departmentid, weaponid)
values (41, 291);
insert into USESROBOTS (departmentid, weaponid)
values (41, 316);
insert into USESROBOTS (departmentid, weaponid)
values (41, 334);
insert into USESROBOTS (departmentid, weaponid)
values (41, 339);
insert into USESROBOTS (departmentid, weaponid)
values (41, 352);
insert into USESROBOTS (departmentid, weaponid)
values (41, 356);
insert into USESROBOTS (departmentid, weaponid)
values (41, 382);
insert into USESROBOTS (departmentid, weaponid)
values (41, 446);
insert into USESROBOTS (departmentid, weaponid)
values (41, 452);
insert into USESROBOTS (departmentid, weaponid)
values (41, 460);
insert into USESROBOTS (departmentid, weaponid)
values (41, 463);
insert into USESROBOTS (departmentid, weaponid)
values (41, 466);
insert into USESROBOTS (departmentid, weaponid)
values (41, 475);
insert into USESROBOTS (departmentid, weaponid)
values (41, 489);
insert into USESROBOTS (departmentid, weaponid)
values (41, 497);
insert into USESROBOTS (departmentid, weaponid)
values (42, 270);
insert into USESROBOTS (departmentid, weaponid)
values (42, 278);
insert into USESROBOTS (departmentid, weaponid)
values (42, 290);
commit;
prompt 200 records committed...
insert into USESROBOTS (departmentid, weaponid)
values (42, 350);
insert into USESROBOTS (departmentid, weaponid)
values (42, 414);
insert into USESROBOTS (departmentid, weaponid)
values (42, 448);
insert into USESROBOTS (departmentid, weaponid)
values (42, 461);
insert into USESROBOTS (departmentid, weaponid)
values (42, 476);
insert into USESROBOTS (departmentid, weaponid)
values (42, 493);
insert into USESROBOTS (departmentid, weaponid)
values (43, 251);
insert into USESROBOTS (departmentid, weaponid)
values (43, 252);
insert into USESROBOTS (departmentid, weaponid)
values (43, 264);
insert into USESROBOTS (departmentid, weaponid)
values (43, 269);
insert into USESROBOTS (departmentid, weaponid)
values (43, 347);
insert into USESROBOTS (departmentid, weaponid)
values (43, 404);
insert into USESROBOTS (departmentid, weaponid)
values (43, 413);
insert into USESROBOTS (departmentid, weaponid)
values (43, 433);
insert into USESROBOTS (departmentid, weaponid)
values (43, 487);
insert into USESROBOTS (departmentid, weaponid)
values (44, 256);
insert into USESROBOTS (departmentid, weaponid)
values (44, 291);
insert into USESROBOTS (departmentid, weaponid)
values (44, 294);
insert into USESROBOTS (departmentid, weaponid)
values (44, 331);
insert into USESROBOTS (departmentid, weaponid)
values (44, 365);
insert into USESROBOTS (departmentid, weaponid)
values (44, 369);
insert into USESROBOTS (departmentid, weaponid)
values (44, 370);
insert into USESROBOTS (departmentid, weaponid)
values (44, 389);
insert into USESROBOTS (departmentid, weaponid)
values (44, 400);
insert into USESROBOTS (departmentid, weaponid)
values (44, 453);
insert into USESROBOTS (departmentid, weaponid)
values (44, 457);
insert into USESROBOTS (departmentid, weaponid)
values (44, 470);
insert into USESROBOTS (departmentid, weaponid)
values (44, 492);
insert into USESROBOTS (departmentid, weaponid)
values (45, 253);
insert into USESROBOTS (departmentid, weaponid)
values (45, 257);
insert into USESROBOTS (departmentid, weaponid)
values (45, 262);
insert into USESROBOTS (departmentid, weaponid)
values (45, 283);
insert into USESROBOTS (departmentid, weaponid)
values (45, 330);
insert into USESROBOTS (departmentid, weaponid)
values (45, 381);
insert into USESROBOTS (departmentid, weaponid)
values (45, 386);
insert into USESROBOTS (departmentid, weaponid)
values (45, 428);
insert into USESROBOTS (departmentid, weaponid)
values (45, 436);
insert into USESROBOTS (departmentid, weaponid)
values (45, 439);
insert into USESROBOTS (departmentid, weaponid)
values (46, 265);
insert into USESROBOTS (departmentid, weaponid)
values (46, 280);
insert into USESROBOTS (departmentid, weaponid)
values (46, 290);
insert into USESROBOTS (departmentid, weaponid)
values (46, 292);
insert into USESROBOTS (departmentid, weaponid)
values (46, 385);
insert into USESROBOTS (departmentid, weaponid)
values (46, 416);
insert into USESROBOTS (departmentid, weaponid)
values (46, 431);
insert into USESROBOTS (departmentid, weaponid)
values (46, 462);
insert into USESROBOTS (departmentid, weaponid)
values (46, 477);
insert into USESROBOTS (departmentid, weaponid)
values (47, 253);
insert into USESROBOTS (departmentid, weaponid)
values (47, 254);
insert into USESROBOTS (departmentid, weaponid)
values (47, 263);
insert into USESROBOTS (departmentid, weaponid)
values (47, 271);
insert into USESROBOTS (departmentid, weaponid)
values (47, 277);
insert into USESROBOTS (departmentid, weaponid)
values (47, 295);
insert into USESROBOTS (departmentid, weaponid)
values (47, 297);
insert into USESROBOTS (departmentid, weaponid)
values (47, 298);
insert into USESROBOTS (departmentid, weaponid)
values (47, 363);
insert into USESROBOTS (departmentid, weaponid)
values (47, 390);
insert into USESROBOTS (departmentid, weaponid)
values (47, 398);
insert into USESROBOTS (departmentid, weaponid)
values (47, 440);
insert into USESROBOTS (departmentid, weaponid)
values (47, 451);
insert into USESROBOTS (departmentid, weaponid)
values (47, 479);
insert into USESROBOTS (departmentid, weaponid)
values (47, 488);
insert into USESROBOTS (departmentid, weaponid)
values (48, 258);
insert into USESROBOTS (departmentid, weaponid)
values (48, 281);
insert into USESROBOTS (departmentid, weaponid)
values (48, 314);
insert into USESROBOTS (departmentid, weaponid)
values (48, 332);
insert into USESROBOTS (departmentid, weaponid)
values (48, 349);
insert into USESROBOTS (departmentid, weaponid)
values (48, 392);
insert into USESROBOTS (departmentid, weaponid)
values (48, 402);
insert into USESROBOTS (departmentid, weaponid)
values (48, 498);
insert into USESROBOTS (departmentid, weaponid)
values (49, 258);
insert into USESROBOTS (departmentid, weaponid)
values (49, 289);
insert into USESROBOTS (departmentid, weaponid)
values (49, 300);
insert into USESROBOTS (departmentid, weaponid)
values (49, 309);
insert into USESROBOTS (departmentid, weaponid)
values (49, 315);
insert into USESROBOTS (departmentid, weaponid)
values (49, 320);
insert into USESROBOTS (departmentid, weaponid)
values (49, 337);
insert into USESROBOTS (departmentid, weaponid)
values (49, 348);
insert into USESROBOTS (departmentid, weaponid)
values (49, 361);
insert into USESROBOTS (departmentid, weaponid)
values (49, 412);
insert into USESROBOTS (departmentid, weaponid)
values (49, 426);
insert into USESROBOTS (departmentid, weaponid)
values (49, 441);
insert into USESROBOTS (departmentid, weaponid)
values (49, 442);
insert into USESROBOTS (departmentid, weaponid)
values (49, 474);
insert into USESROBOTS (departmentid, weaponid)
values (49, 478);
insert into USESROBOTS (departmentid, weaponid)
values (50, 280);
insert into USESROBOTS (departmentid, weaponid)
values (50, 296);
insert into USESROBOTS (departmentid, weaponid)
values (50, 304);
insert into USESROBOTS (departmentid, weaponid)
values (50, 307);
insert into USESROBOTS (departmentid, weaponid)
values (50, 319);
insert into USESROBOTS (departmentid, weaponid)
values (50, 346);
insert into USESROBOTS (departmentid, weaponid)
values (50, 374);
insert into USESROBOTS (departmentid, weaponid)
values (50, 376);
insert into USESROBOTS (departmentid, weaponid)
values (50, 380);
insert into USESROBOTS (departmentid, weaponid)
values (50, 391);
insert into USESROBOTS (departmentid, weaponid)
values (50, 421);
insert into USESROBOTS (departmentid, weaponid)
values (50, 471);
insert into USESROBOTS (departmentid, weaponid)
values (50, 490);
commit;
prompt 298 records loaded
