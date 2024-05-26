prompt
prompt Creating table DEPARTMENT
prompt =========================
prompt
create table BISHAPIR.DEPARTMENT
(
  departmentid INTEGER not null,
  name         CHAR(30) not null
)
;
alter table BISHAPIR.DEPARTMENT
  add primary key (DEPARTMENTID);
alter table BISHAPIR.DEPARTMENT
  add unique (NAME);

prompt
prompt Creating table SOLDIER
prompt ======================
prompt
create table BISHAPIR.SOLDIER
(
  soldierid    INTEGER not null,
  name         CHAR(30) not null,
  borndate     DATE not null,
  profile      INTEGER not null,
  rank         INTEGER not null,
  departmentid INTEGER not null
)
;
alter table BISHAPIR.SOLDIER
  add primary key (SOLDIERID);
alter table BISHAPIR.SOLDIER
  add foreign key (DEPARTMENTID)
  references BISHAPIR.DEPARTMENT (DEPARTMENTID);

prompt
prompt Creating table COMMANDER
prompt ========================
prompt
create table BISHAPIR.COMMANDER
(
  numberofsoldiers INTEGER not null,
  soldierid        INTEGER not null
)
;
alter table BISHAPIR.COMMANDER
  add primary key (SOLDIERID);
alter table BISHAPIR.COMMANDER
  add foreign key (SOLDIERID)
  references BISHAPIR.SOLDIER (SOLDIERID);

prompt
prompt Creating table DEPBOMBS
prompt =======================
prompt
create table BISHAPIR.DEPBOMBS
(
  maxweight    INTEGER not null,
  departmentid INTEGER not null
)
;
alter table BISHAPIR.DEPBOMBS
  add primary key (DEPARTMENTID);
alter table BISHAPIR.DEPBOMBS
  add foreign key (DEPARTMENTID)
  references BISHAPIR.DEPARTMENT (DEPARTMENTID);

prompt
prompt Creating table DEPTUNNELS
prompt =========================
prompt
create table BISHAPIR.DEPTUNNELS
(
  maxdepth     INTEGER not null,
  departmentid INTEGER not null
)
;
alter table BISHAPIR.DEPTUNNELS
  add primary key (DEPARTMENTID);
alter table BISHAPIR.DEPTUNNELS
  add foreign key (DEPARTMENTID)
  references BISHAPIR.DEPARTMENT (DEPARTMENTID);

prompt
prompt Creating table WEAPON
prompt =====================
prompt
create table BISHAPIR.WEAPON
(
  weaponid     INTEGER not null,
  minranktouse INTEGER not null,
  name         CHAR(30) not null
)
;
alter table BISHAPIR.WEAPON
  add primary key (WEAPONID);
alter table BISHAPIR.WEAPON
  add unique (NAME);

prompt
prompt Creating table EXPLOSIVES
prompt =========================
prompt
create table BISHAPIR.EXPLOSIVES
(
  lastdatetouse DATE not null,
  weaponid      INTEGER not null
)
;
alter table BISHAPIR.EXPLOSIVES
  add primary key (WEAPONID);
alter table BISHAPIR.EXPLOSIVES
  add foreign key (WEAPONID)
  references BISHAPIR.WEAPON (WEAPONID);

prompt
prompt Creating table FIGHTER
prompt ======================
prompt
create table BISHAPIR.FIGHTER
(
  role      CHAR(30) not null,
  soldierid INTEGER not null
)
;
alter table BISHAPIR.FIGHTER
  add primary key (SOLDIERID);
alter table BISHAPIR.FIGHTER
  add foreign key (SOLDIERID)
  references BISHAPIR.SOLDIER (SOLDIERID);

prompt
prompt Creating table ROBOTS
prompt =====================
prompt
create table BISHAPIR.ROBOTS
(
  maxhoursbattary INTEGER not null,
  weaponid        INTEGER not null
)
;
alter table BISHAPIR.ROBOTS
  add primary key (WEAPONID);
alter table BISHAPIR.ROBOTS
  add foreign key (WEAPONID)
  references BISHAPIR.WEAPON (WEAPONID);

prompt
prompt Creating table USESEXPLOSIVE
prompt ============================
prompt
create table BISHAPIR.USESEXPLOSIVE
(
  departmentid INTEGER not null,
  weaponid     INTEGER not null
)
;
alter table BISHAPIR.USESEXPLOSIVE
  add primary key (DEPARTMENTID, WEAPONID);
alter table BISHAPIR.USESEXPLOSIVE
  add foreign key (DEPARTMENTID)
  references BISHAPIR.DEPBOMBS (DEPARTMENTID);
alter table BISHAPIR.USESEXPLOSIVE
  add foreign key (WEAPONID)
  references BISHAPIR.EXPLOSIVES (WEAPONID);

prompt
prompt Creating table USESROBOTS
prompt =========================
prompt
create table BISHAPIR.USESROBOTS
(
  departmentid INTEGER not null,
  weaponid     INTEGER not null
)
;
alter table BISHAPIR.USESROBOTS
  add primary key (DEPARTMENTID, WEAPONID);
alter table BISHAPIR.USESROBOTS
  add foreign key (DEPARTMENTID)
  references BISHAPIR.DEPTUNNELS (DEPARTMENTID);
alter table BISHAPIR.USESROBOTS
  add foreign key (WEAPONID)
  references BISHAPIR.ROBOTS (WEAPONID);

