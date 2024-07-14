prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by gilad on יום חמישי 11 יולי 2024
set feedback off
set define off

prompt Creating COMMANDERT...
create table COMMANDERT
(
  comid        INTEGER not null,
  rank         VARCHAR2(15) not null,
  numofunitcom INTEGER not null
)
;
alter table COMMANDERT
  add primary key (COMID);
alter table COMMANDERT
  add constraint CHECK_NUMOFUNITCOM
  check (numofunitcom BETWEEN 50 AND 100);

prompt Creating EQUIPMENT_MANAGER...
create table EQUIPMENT_MANAGER
(
  equid        INTEGER not null,
  expertise    VARCHAR2(15) not null,
  numofuniteqi INTEGER not null,
  comid        INTEGER
)
;
alter table EQUIPMENT_MANAGER
  add primary key (EQUID);
alter table EQUIPMENT_MANAGER
  add foreign key (COMID)
  references COMMANDERT (COMID);

prompt Creating DOCTOR...
create table DOCTOR
(
  docid          INTEGER not null,
  license_number INTEGER not null,
  seniority      INTEGER not null,
  numofunitdoc   INTEGER not null,
  comid          INTEGER,
  equid          INTEGER
)
;
alter table DOCTOR
  add primary key (DOCID);
alter table DOCTOR
  add foreign key (COMID)
  references COMMANDERT (COMID);
alter table DOCTOR
  add foreign key (EQUID)
  references EQUIPMENT_MANAGER (EQUID);
alter table DOCTOR
  add constraint CHECK_DOCTOR_SENIORITY
  check (seniority <= 40);

prompt Creating DRIVER...
create table DRIVER
(
  license_number INTEGER not null,
  drid           INTEGER not null,
  numofunitdri   INTEGER not null,
  comid          INTEGER
)
;
alter table DRIVER
  add primary key (DRID);
alter table DRIVER
  add constraint UNIQUE_LICENSE_NUMBER unique (LICENSE_NUMBER);
alter table DRIVER
  add foreign key (COMID)
  references COMMANDERT (COMID);

prompt Creating MEDIC...
create table MEDIC
(
  medid        INTEGER not null,
  seniority    INTEGER not null,
  numofunitmed INTEGER not null,
  comid        INTEGER,
  equid        INTEGER
)
;
alter table MEDIC
  add primary key (MEDID);
alter table MEDIC
  add foreign key (COMID)
  references COMMANDERT (COMID);
alter table MEDIC
  add foreign key (EQUID)
  references EQUIPMENT_MANAGER (EQUID);
alter table MEDIC
  add constraint CHECK_MEDIC_SENIORITY
  check (seniority <= 40);

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  parid          INTEGER not null,
  license_number INTEGER not null,
  seniority      INTEGER not null,
  numofunitpar   INTEGER not null,
  comid          INTEGER,
  equid          INTEGER
)
;
alter table PARAMEDIC
  add primary key (PARID);
alter table PARAMEDIC
  add foreign key (COMID)
  references COMMANDERT (COMID);
alter table PARAMEDIC
  add foreign key (EQUID)
  references EQUIPMENT_MANAGER (EQUID);
alter table PARAMEDIC
  add constraint CHECK_PARAMEDIC_SENIORITY
  check (seniority <= 41);

prompt Truncating PARAMEDIC...
truncate table PARAMEDIC;
prompt Truncating MEDIC...
truncate table MEDIC;
prompt Truncating DRIVER...
truncate table DRIVER;
prompt Truncating DOCTOR...
truncate table DOCTOR;
prompt Truncating EQUIPMENT_MANAGER...
truncate table EQUIPMENT_MANAGER;
prompt Truncating COMMANDERT...
truncate table COMMANDERT;
prompt Loading COMMANDERT...
insert into COMMANDERT (comid, rank, numofunitcom)
values (854567801, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (597170275, 'ravseren', 74);
insert into COMMANDERT (comid, rank, numofunitcom)
values (284456997, 'segen', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (382340873, 'ravseren', 52);
insert into COMMANDERT (comid, rank, numofunitcom)
values (456542193, 'ravseren', 56);
insert into COMMANDERT (comid, rank, numofunitcom)
values (239021751, 'segen', 93);
insert into COMMANDERT (comid, rank, numofunitcom)
values (784035019, 'ravseren', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (458692899, 'ravseren', 79);
insert into COMMANDERT (comid, rank, numofunitcom)
values (513254138, 'ravseren', 92);
insert into COMMANDERT (comid, rank, numofunitcom)
values (733741583, 'ravseren', 100);
insert into COMMANDERT (comid, rank, numofunitcom)
values (676175225, 'ravseren', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (292483544, 'segen', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (376752575, 'ravseren', 90);
insert into COMMANDERT (comid, rank, numofunitcom)
values (383487578, 'ravseren', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (661373728, 'segen', 78);
insert into COMMANDERT (comid, rank, numofunitcom)
values (611570580, 'segen', 76);
insert into COMMANDERT (comid, rank, numofunitcom)
values (646340985, 'ravseren', 69);
insert into COMMANDERT (comid, rank, numofunitcom)
values (477760344, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (933504468, 'ravseren', 53);
insert into COMMANDERT (comid, rank, numofunitcom)
values (262033320, 'ravseren', 74);
insert into COMMANDERT (comid, rank, numofunitcom)
values (841282743, 'ravseren', 76);
insert into COMMANDERT (comid, rank, numofunitcom)
values (428132844, 'ravseren', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (341861776, 'ravseren', 90);
insert into COMMANDERT (comid, rank, numofunitcom)
values (910219884, 'segen', 79);
insert into COMMANDERT (comid, rank, numofunitcom)
values (960434058, 'ravseren', 67);
insert into COMMANDERT (comid, rank, numofunitcom)
values (253790977, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (470519370, 'ravseren', 66);
insert into COMMANDERT (comid, rank, numofunitcom)
values (303704035, 'ravseren', 67);
insert into COMMANDERT (comid, rank, numofunitcom)
values (246498308, 'ravseren', 50);
insert into COMMANDERT (comid, rank, numofunitcom)
values (905791950, 'ravseren', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (539094185, 'ravseren', 80);
insert into COMMANDERT (comid, rank, numofunitcom)
values (491631527, 'ravseren', 100);
insert into COMMANDERT (comid, rank, numofunitcom)
values (904977922, 'segen', 85);
insert into COMMANDERT (comid, rank, numofunitcom)
values (290248229, 'ravseren', 97);
insert into COMMANDERT (comid, rank, numofunitcom)
values (525154766, 'segen', 50);
insert into COMMANDERT (comid, rank, numofunitcom)
values (853347828, 'segen', 90);
insert into COMMANDERT (comid, rank, numofunitcom)
values (212413254, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (950013240, 'ravseren', 88);
insert into COMMANDERT (comid, rank, numofunitcom)
values (718205447, 'ravseren', 85);
insert into COMMANDERT (comid, rank, numofunitcom)
values (829154190, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (898565763, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (540096086, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (212827892, 'ravseren', 95);
insert into COMMANDERT (comid, rank, numofunitcom)
values (267538350, 'ravseren', 100);
insert into COMMANDERT (comid, rank, numofunitcom)
values (770752227, 'segen', 100);
insert into COMMANDERT (comid, rank, numofunitcom)
values (423902303, 'ravseren', 84);
insert into COMMANDERT (comid, rank, numofunitcom)
values (851464440, 'segen', 54);
insert into COMMANDERT (comid, rank, numofunitcom)
values (878757230, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (943751248, 'ravseren', 93);
insert into COMMANDERT (comid, rank, numofunitcom)
values (315040981, 'ravseren', 70);
insert into COMMANDERT (comid, rank, numofunitcom)
values (568645505, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (974834557, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (986196041, 'ravseren', 59);
insert into COMMANDERT (comid, rank, numofunitcom)
values (349873296, 'ravseren', 78);
insert into COMMANDERT (comid, rank, numofunitcom)
values (949985303, 'ravseren', 59);
insert into COMMANDERT (comid, rank, numofunitcom)
values (435066258, 'ravseren', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (892421596, 'segen', 63);
insert into COMMANDERT (comid, rank, numofunitcom)
values (961258001, 'ravseren', 94);
insert into COMMANDERT (comid, rank, numofunitcom)
values (542542996, 'segen', 67);
insert into COMMANDERT (comid, rank, numofunitcom)
values (502004177, 'ravseren', 73);
insert into COMMANDERT (comid, rank, numofunitcom)
values (547894176, 'segen', 96);
insert into COMMANDERT (comid, rank, numofunitcom)
values (207475924, 'ravseren', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (812310509, 'segen', 96);
insert into COMMANDERT (comid, rank, numofunitcom)
values (664300005, 'segen', 60);
insert into COMMANDERT (comid, rank, numofunitcom)
values (572998981, 'ravseren', 94);
insert into COMMANDERT (comid, rank, numofunitcom)
values (532859077, 'segen', 78);
insert into COMMANDERT (comid, rank, numofunitcom)
values (255529737, 'ravseren', 87);
insert into COMMANDERT (comid, rank, numofunitcom)
values (907982686, 'ravseren', 75);
insert into COMMANDERT (comid, rank, numofunitcom)
values (405264744, 'ravseren', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (298523277, 'ravseren', 59);
insert into COMMANDERT (comid, rank, numofunitcom)
values (279384977, 'ravseren', 86);
insert into COMMANDERT (comid, rank, numofunitcom)
values (651145540, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (784432519, 'segen', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (363248890, 'ravseren', 60);
insert into COMMANDERT (comid, rank, numofunitcom)
values (997208593, 'ravseren', 99);
insert into COMMANDERT (comid, rank, numofunitcom)
values (583265109, 'ravseren', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (996173193, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (920522812, 'ravseren', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (652561845, 'ravseren', 52);
insert into COMMANDERT (comid, rank, numofunitcom)
values (858817699, 'ravseren', 70);
insert into COMMANDERT (comid, rank, numofunitcom)
values (853792205, 'ravseren', 52);
insert into COMMANDERT (comid, rank, numofunitcom)
values (202971454, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (684014460, 'ravseren', 64);
insert into COMMANDERT (comid, rank, numofunitcom)
values (618975238, 'ravseren', 56);
insert into COMMANDERT (comid, rank, numofunitcom)
values (358898272, 'ravseren', 53);
insert into COMMANDERT (comid, rank, numofunitcom)
values (677030248, 'ravseren', 86);
insert into COMMANDERT (comid, rank, numofunitcom)
values (441471038, 'ravseren', 84);
insert into COMMANDERT (comid, rank, numofunitcom)
values (260059628, 'ravseren', 75);
insert into COMMANDERT (comid, rank, numofunitcom)
values (732240753, 'segen', 75);
insert into COMMANDERT (comid, rank, numofunitcom)
values (850542797, 'ravseren', 73);
insert into COMMANDERT (comid, rank, numofunitcom)
values (253691408, 'segen', 61);
insert into COMMANDERT (comid, rank, numofunitcom)
values (544116765, 'ravseren', 85);
insert into COMMANDERT (comid, rank, numofunitcom)
values (849482254, 'ravseren', 88);
insert into COMMANDERT (comid, rank, numofunitcom)
values (331016009, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (666147840, 'ravseren', 97);
insert into COMMANDERT (comid, rank, numofunitcom)
values (651059352, 'ravseren', 93);
insert into COMMANDERT (comid, rank, numofunitcom)
values (860073050, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (972131463, 'ravseren', 63);
insert into COMMANDERT (comid, rank, numofunitcom)
values (741658230, 'ravseren', 65);
insert into COMMANDERT (comid, rank, numofunitcom)
values (860008864, 'segen', 81);
commit;
prompt 100 records committed...
insert into COMMANDERT (comid, rank, numofunitcom)
values (353513208, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (241733977, 'segen', 90);
insert into COMMANDERT (comid, rank, numofunitcom)
values (809166274, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (512081851, 'segen', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (697091316, 'segen', 51);
insert into COMMANDERT (comid, rank, numofunitcom)
values (545982654, 'ravseren', 90);
insert into COMMANDERT (comid, rank, numofunitcom)
values (576916046, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (270595190, 'segen', 66);
insert into COMMANDERT (comid, rank, numofunitcom)
values (202269236, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (911587198, 'ravseren', 79);
insert into COMMANDERT (comid, rank, numofunitcom)
values (827362279, 'ravseren', 52);
insert into COMMANDERT (comid, rank, numofunitcom)
values (802905052, 'ravseren', 79);
insert into COMMANDERT (comid, rank, numofunitcom)
values (870381417, 'ravseren', 80);
insert into COMMANDERT (comid, rank, numofunitcom)
values (466531974, 'segen', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (647971318, 'ravseren', 86);
insert into COMMANDERT (comid, rank, numofunitcom)
values (397365962, 'ravseren', 54);
insert into COMMANDERT (comid, rank, numofunitcom)
values (983765069, 'ravseren', 70);
insert into COMMANDERT (comid, rank, numofunitcom)
values (624545158, 'ravseren', 99);
insert into COMMANDERT (comid, rank, numofunitcom)
values (324388588, 'ravseren', 87);
insert into COMMANDERT (comid, rank, numofunitcom)
values (480126752, 'segen', 80);
insert into COMMANDERT (comid, rank, numofunitcom)
values (734245301, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (771557352, 'ravseren', 69);
insert into COMMANDERT (comid, rank, numofunitcom)
values (739199329, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (747260588, 'ravseren', 86);
insert into COMMANDERT (comid, rank, numofunitcom)
values (991772982, 'segen', 65);
insert into COMMANDERT (comid, rank, numofunitcom)
values (503934257, 'ravseren', 65);
insert into COMMANDERT (comid, rank, numofunitcom)
values (533018381, 'ravseren', 76);
insert into COMMANDERT (comid, rank, numofunitcom)
values (756036230, 'segen', 92);
insert into COMMANDERT (comid, rank, numofunitcom)
values (398782703, 'segen', 95);
insert into COMMANDERT (comid, rank, numofunitcom)
values (625557300, 'segen', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (649804152, 'segen', 93);
insert into COMMANDERT (comid, rank, numofunitcom)
values (924431918, 'segen', 95);
insert into COMMANDERT (comid, rank, numofunitcom)
values (218968243, 'ravseren', 100);
insert into COMMANDERT (comid, rank, numofunitcom)
values (223777532, 'ravseren', 87);
insert into COMMANDERT (comid, rank, numofunitcom)
values (575689150, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (557467944, 'ravseren', 87);
insert into COMMANDERT (comid, rank, numofunitcom)
values (563304428, 'ravseren', 72);
insert into COMMANDERT (comid, rank, numofunitcom)
values (579993618, 'ravseren', 53);
insert into COMMANDERT (comid, rank, numofunitcom)
values (963878433, 'ravseren', 61);
insert into COMMANDERT (comid, rank, numofunitcom)
values (806108871, 'ravseren', 64);
insert into COMMANDERT (comid, rank, numofunitcom)
values (399009580, 'ravseren', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (869793772, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (246090021, 'segen', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (674603269, 'ravseren', 82);
insert into COMMANDERT (comid, rank, numofunitcom)
values (753362211, 'ravseren', 66);
insert into COMMANDERT (comid, rank, numofunitcom)
values (835878394, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (800447824, 'ravseren', 74);
insert into COMMANDERT (comid, rank, numofunitcom)
values (568991884, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (755944606, 'ravseren', 60);
insert into COMMANDERT (comid, rank, numofunitcom)
values (670592893, 'segen', 72);
insert into COMMANDERT (comid, rank, numofunitcom)
values (944241576, 'segen', 57);
insert into COMMANDERT (comid, rank, numofunitcom)
values (842162772, 'ravseren', 72);
insert into COMMANDERT (comid, rank, numofunitcom)
values (943380656, 'segen', 61);
insert into COMMANDERT (comid, rank, numofunitcom)
values (599945541, 'ravseren', 97);
insert into COMMANDERT (comid, rank, numofunitcom)
values (380538766, 'segen', 96);
insert into COMMANDERT (comid, rank, numofunitcom)
values (742296336, 'ravseren', 70);
insert into COMMANDERT (comid, rank, numofunitcom)
values (827819402, 'segen', 76);
insert into COMMANDERT (comid, rank, numofunitcom)
values (702401932, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (677345115, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (218995711, 'ravseren', 99);
insert into COMMANDERT (comid, rank, numofunitcom)
values (823018259, 'ravseren', 91);
insert into COMMANDERT (comid, rank, numofunitcom)
values (427750823, 'segen', 81);
insert into COMMANDERT (comid, rank, numofunitcom)
values (547575756, 'segen', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (287384023, 'ravseren', 71);
insert into COMMANDERT (comid, rank, numofunitcom)
values (521150880, 'ravseren', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (275313659, 'segen', 60);
insert into COMMANDERT (comid, rank, numofunitcom)
values (243861421, 'segen', 85);
insert into COMMANDERT (comid, rank, numofunitcom)
values (467106037, 'ravseren', 84);
insert into COMMANDERT (comid, rank, numofunitcom)
values (425757594, 'segen', 65);
insert into COMMANDERT (comid, rank, numofunitcom)
values (947219972, 'segen', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (802782814, 'ravseren', 55);
insert into COMMANDERT (comid, rank, numofunitcom)
values (860800214, 'ravseren', 67);
insert into COMMANDERT (comid, rank, numofunitcom)
values (328991545, 'ravseren', 74);
insert into COMMANDERT (comid, rank, numofunitcom)
values (875472507, 'segen', 92);
insert into COMMANDERT (comid, rank, numofunitcom)
values (455289533, 'ravseren', 84);
insert into COMMANDERT (comid, rank, numofunitcom)
values (866507043, 'segen', 75);
insert into COMMANDERT (comid, rank, numofunitcom)
values (687494071, 'ravseren', 60);
insert into COMMANDERT (comid, rank, numofunitcom)
values (584292152, 'ravseren', 62);
insert into COMMANDERT (comid, rank, numofunitcom)
values (706800733, 'segen', 52);
insert into COMMANDERT (comid, rank, numofunitcom)
values (812521770, 'ravseren', 66);
insert into COMMANDERT (comid, rank, numofunitcom)
values (477869897, 'segen', 72);
insert into COMMANDERT (comid, rank, numofunitcom)
values (756525540, 'ravseren', 98);
insert into COMMANDERT (comid, rank, numofunitcom)
values (742283792, 'segen', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (522958381, 'ravseren', 57);
insert into COMMANDERT (comid, rank, numofunitcom)
values (855884233, 'ravseren', 93);
insert into COMMANDERT (comid, rank, numofunitcom)
values (693509106, 'ravseren', 73);
insert into COMMANDERT (comid, rank, numofunitcom)
values (403363213, 'ravseren', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (714444074, 'segen', 65);
insert into COMMANDERT (comid, rank, numofunitcom)
values (540554946, 'ravseren', 85);
insert into COMMANDERT (comid, rank, numofunitcom)
values (281692115, 'ravseren', 95);
insert into COMMANDERT (comid, rank, numofunitcom)
values (413474224, 'segen', 89);
insert into COMMANDERT (comid, rank, numofunitcom)
values (716242522, 'segen', 53);
insert into COMMANDERT (comid, rank, numofunitcom)
values (917431227, 'segen', 91);
insert into COMMANDERT (comid, rank, numofunitcom)
values (747514377, 'segen', 56);
insert into COMMANDERT (comid, rank, numofunitcom)
values (836900152, 'segen', 77);
insert into COMMANDERT (comid, rank, numofunitcom)
values (451155134, 'ravseren', 68);
insert into COMMANDERT (comid, rank, numofunitcom)
values (318728017, 'segen', 70);
insert into COMMANDERT (comid, rank, numofunitcom)
values (785352630, 'segen', 58);
insert into COMMANDERT (comid, rank, numofunitcom)
values (274439624, 'ravseren', 77);
commit;
prompt 199 records loaded
prompt Loading EQUIPMENT_MANAGER...
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (982612224, 'level5', 90, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (727880995, 'level1', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (932526981, 'level5', 72, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (454575986, 'level4', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (972181903, 'level1', 58, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (243448508, 'level1', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (531960412, 'level5', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (766189156, 'level5', 87, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (212977764, 'level3', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (909964051, 'level4', 98, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (454232522, 'level2', 72, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (518096435, 'level1', 71, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (760503329, 'level4', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (858090595, 'level4', 99, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (593299605, 'level5', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (819899409, 'level1', 69, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (469995523, 'level1', 76, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (772327874, 'level2', 75, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (222994471, 'level3', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (348255887, 'level4', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (363793475, 'level4', 72, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (459783586, 'level3', 80, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (640122873, 'level1', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (344431286, 'level1', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (948357160, 'level5', 71, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (210785905, 'level5', 63, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (711261816, 'level1', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (762688896, 'level1', 73, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (682941846, 'level1', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (373206113, 'level1', 53, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (447481045, 'level2', 60, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (465062518, 'level1', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (560067604, 'level3', 81, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (277269929, 'level3', 72, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (742887866, 'level3', 88, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (660514243, 'level2', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (679651710, 'level1', 80, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (724038533, 'level4', 97, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (341880913, 'level1', 57, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (399328062, 'level4', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (498949981, 'level2', 87, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (704182996, 'level2', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (232233786, 'level1', 80, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (576857948, 'level2', 60, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (532656770, 'level5', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (480063267, 'level3', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (257828979, 'level2', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (698814256, 'level1', 77, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (700200654, 'level1', 91, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (321811352, 'level3', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (883295076, 'level5', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (254674536, 'level5', 100, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (297242234, 'level4', 50, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (853614962, 'level5', 76, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (820064168, 'level5', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (266008532, 'level1', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (721177551, 'level2', 98, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (847262796, 'level4', 80, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (321146855, 'level3', 82, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (431308813, 'level3', 84, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (437236299, 'level1', 96, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (953555311, 'level3', 78, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (884537549, 'level1', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (370142499, 'level1', 87, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (986929785, 'level5', 94, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (484099696, 'level3', 69, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (350872400, 'level2', 78, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (791307825, 'level5', 81, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (883006224, 'level2', 57, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (448666546, 'level3', 71, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (469801513, 'level4', 78, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (649026697, 'level4', 63, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (847405574, 'level2', 71, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (608705943, 'level5', 100, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (292756454, 'level2', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (946205391, 'level5', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (489052115, 'level4', 69, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (347902990, 'level4', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (347867303, 'level3', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (615736077, 'level4', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (464493626, 'level2', 61, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (478279825, 'level4', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (633646846, 'level2', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (642907364, 'level3', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (539283960, 'level3', 90, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (727518412, 'level5', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (871780056, 'level5', 80, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (858489334, 'level4', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (632502084, 'level5', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (480476235, 'level2', 93, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (532291535, 'level5', 53, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (595268005, 'level4', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (414142649, 'level1', 95, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (704426073, 'level4', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (425414762, 'level1', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (632651991, 'level5', 61, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (731682022, 'level5', 77, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (580785541, 'level1', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (416991040, 'level2', 56, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (655759381, 'level4', 76, null);
commit;
prompt 100 records committed...
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (956249772, 'level1', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (266450709, 'level2', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (818307882, 'level5', 95, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (481775046, 'level3', 90, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (302206364, 'level3', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (963892237, 'level5', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (610892428, 'level4', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (940285934, 'level4', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (334792942, 'level3', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (839485578, 'level1', 75, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (482939525, 'level5', 63, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (864274577, 'level3', 76, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (792002117, 'level1', 96, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (438432144, 'level3', 66, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (565162990, 'level5', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (277438383, 'level4', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (928751210, 'level4', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (595192013, 'level5', 99, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (365392953, 'level2', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (205162580, 'level5', 52, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (525958429, 'level1', 95, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (583085929, 'level1', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (298030437, 'level2', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (602096606, 'level3', 75, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (283068124, 'level3', 91, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (463970279, 'level3', 56, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (341209519, 'level1', 62, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (364980762, 'level3', 82, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (649841614, 'level4', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (914196053, 'level4', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (482473253, 'level2', 76, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (622300985, 'level1', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (930019837, 'level2', 92, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (301622784, 'level4', 90, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (711578398, 'level1', 84, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (407502197, 'level1', 88, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (735668134, 'level5', 73, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (731072848, 'level3', 58, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (519751631, 'level4', 60, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (382615996, 'level1', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (220297259, 'level3', 56, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (358192813, 'level1', 52, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (506388910, 'level5', 58, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (657408786, 'level2', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (970589351, 'level4', 54, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (200821528, 'level3', 81, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (593262423, 'level2', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (889309465, 'level4', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (452200965, 'level4', 97, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (721769926, 'level1', 100, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (271554840, 'level3', 64, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (230312426, 'level1', 97, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (578603381, 'level4', 79, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (566762434, 'level4', 65, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (712468405, 'level1', 83, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (569814222, 'level5', 57, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (865234479, 'level1', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (709614725, 'level2', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (255007309, 'level2', 97, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (436483704, 'level1', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (625930039, 'level1', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (515277808, 'level1', 83, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (538515820, 'level4', 74, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (854060727, 'level3', 99, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (997957029, 'level3', 93, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (296542066, 'level1', 51, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (644914473, 'level1', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (446321234, 'level2', 61, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (852719821, 'level4', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (930558408, 'level2', 63, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (332279400, 'level5', 75, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (629967297, 'level3', 94, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (259210821, 'level4', 97, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (731402431, 'level2', 98, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (840268806, 'level3', 91, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (598799928, 'level4', 62, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (995573537, 'level1', 67, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (633883477, 'level4', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (999945194, 'level3', 59, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (217551524, 'level3', 50, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (880107473, 'level5', 83, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (974610271, 'level5', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (491883622, 'level3', 55, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (451708929, 'level5', 75, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (867829997, 'level5', 99, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (258179308, 'level3', 70, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (356715176, 'level1', 85, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (331964601, 'level1', 94, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (703388516, 'level5', 89, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (303664558, 'level1', 87, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (769696771, 'level1', 69, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (333173822, 'level1', 90, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (403335064, 'level3', 68, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (520219665, 'level2', 86, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (737788212, 'level2', 61, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (721078133, 'level2', 93, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (773303821, 'level4', 53, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (355545176, 'level4', 50, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (915567979, 'level2', 53, null);
insert into EQUIPMENT_MANAGER (equid, expertise, numofuniteqi, comid)
values (681347186, 'level4', 55, null);
commit;
prompt 200 records loaded
prompt Loading DOCTOR...
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (688619120, 281629, 34, 53, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (993911247, 234281, 17, 82, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (548593139, 833960, 19, 58, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (218383930, 974309, 15, 97, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (667022288, 507774, 35, 92, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (399362748, 231639, 12, 97, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (838750603, 351322, 12, 77, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (703636194, 125796, 18, 58, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (418893385, 431876, 12, 86, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (971446708, 650516, 26, 54, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (260235153, 775131, 9, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (532918789, 844804, 31, 51, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (577124290, 335234, 5, 93, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (766746895, 726107, 20, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (216309955, 239981, 30, 69, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (366649427, 777612, 26, 60, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (436369012, 862776, 24, 69, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (679111943, 803688, 29, 55, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (549472743, 331070, 23, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (522325116, 650248, 2, 80, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (477675772, 887727, 6, 86, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (233866319, 255315, 21, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (581255648, 180489, 17, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (914771070, 752512, 30, 55, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (230699733, 902155, 15, 54, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (868880719, 492807, 7, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (296792603, 797130, 3, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (549031907, 753463, 36, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (603091024, 400530, 29, 91, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (430363596, 823160, 2, 99, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (655059484, 520274, 22, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (621690437, 127409, 36, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (898171865, 220605, 3, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (474675784, 347837, 29, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (463547219, 911771, 30, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (382872727, 166984, 25, 95, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (202120670, 920070, 39, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (411476785, 916644, 5, 55, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (271064562, 345955, 18, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (352180230, 697864, 11, 50, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (312231605, 582410, 13, 69, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (331518934, 361719, 3, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (321703997, 309800, 27, 59, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (963699968, 239890, 34, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (962070187, 963971, 25, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (790206670, 180025, 15, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (850347584, 367651, 18, 60, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (655571819, 703376, 11, 100, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (442841269, 667691, 24, 90, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (465350193, 868029, 36, 95, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (332860510, 382914, 19, 96, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (698098271, 672774, 21, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (364202997, 322540, 11, 78, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (898452201, 130273, 16, 98, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (915465588, 950228, 36, 62, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (536400272, 792018, 30, 97, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (852013259, 605154, 33, 60, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (783618053, 444135, 23, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (922830711, 187069, 31, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (242380951, 310537, 9, 59, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (848976876, 786390, 18, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (390836647, 618533, 13, 77, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (875744674, 201500, 9, 93, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (669633379, 622252, 22, 72, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (948465728, 683648, 4, 94, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (514408905, 563438, 10, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (249438243, 295588, 31, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (236763788, 276702, 15, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (910160367, 116959, 21, 53, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (505250445, 113699, 8, 100, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (371701313, 275888, 24, 62, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (282126592, 887008, 19, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (645689062, 803499, 4, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (799420579, 643786, 39, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (358851785, 657655, 11, 67, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (635656788, 714898, 16, 75, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (767358207, 957286, 5, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (926811331, 763689, 4, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (437049965, 147129, 17, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (575591737, 251597, 30, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (295822795, 416729, 17, 78, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (831344011, 250632, 17, 99, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (873120277, 925692, 13, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (582834726, 182525, 11, 53, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (384122349, 238425, 28, 96, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (333361975, 230102, 35, 54, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (583731345, 868680, 10, 59, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (485921453, 735050, 20, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (515464458, 864984, 26, 51, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (692647298, 155039, 28, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (727273630, 941274, 4, 90, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (702945870, 208668, 23, 86, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (686901818, 903643, 23, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (756643635, 901755, 24, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (847001903, 373827, 4, 98, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (543823442, 255387, 3, 60, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (231349276, 236327, 27, 88, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (923995755, 630594, 11, 51, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (963564304, 565798, 27, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (957377198, 641177, 21, 54, null, null);
commit;
prompt 100 records committed...
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (278778322, 951545, 26, 54, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (928548116, 522543, 15, 66, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (204573138, 543222, 15, 78, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (736462160, 183377, 18, 90, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (924809015, 743874, 33, 56, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (631993184, 186497, 8, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (944159739, 339652, 20, 74, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (694350211, 405470, 33, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (919313833, 856543, 2, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (631699331, 919145, 1, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (806890118, 735500, 20, 86, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (610938742, 231230, 22, 88, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (973981902, 760857, 23, 66, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (906115333, 975955, 3, 53, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (769175651, 733359, 22, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (489609108, 656459, 24, 90, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (763736310, 159163, 34, 80, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (358506692, 456685, 24, 72, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (778155531, 332963, 24, 82, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (344146943, 994805, 40, 94, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (893740208, 323150, 28, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (423563793, 393047, 37, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (341353205, 762309, 8, 92, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (985846158, 483882, 34, 69, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (527765712, 469332, 24, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (638597255, 686519, 12, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (249035037, 716733, 11, 99, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (719764911, 435978, 39, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (667749669, 219706, 12, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (490238273, 654365, 15, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (659881509, 985544, 8, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (691197891, 811375, 13, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (708666900, 507429, 3, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (710314275, 308710, 36, 67, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (607977348, 570644, 30, 85, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (664320403, 172810, 17, 75, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (988245328, 169765, 16, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (787458013, 835266, 22, 81, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (337866289, 847950, 15, 67, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (352583875, 315205, 7, 84, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (200439126, 178808, 7, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (978695153, 392711, 13, 99, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (402314024, 355495, 5, 51, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (583973222, 956124, 16, 97, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (520209564, 925157, 37, 98, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (880697827, 366757, 2, 78, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (694349637, 812922, 24, 60, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (268903252, 548556, 6, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (279568135, 229740, 15, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (636136301, 384427, 19, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (350840858, 926605, 14, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (537360106, 469952, 12, 87, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (200758947, 545036, 20, 94, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (340765092, 717908, 26, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (630110954, 925553, 5, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (560533474, 334656, 40, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (838533849, 725605, 3, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (759985031, 364114, 15, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (641307488, 956246, 32, 65, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (434818722, 865302, 35, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (583541087, 137891, 39, 77, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (914270193, 998120, 26, 97, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (740013821, 777030, 25, 77, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (820627707, 502853, 16, 78, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (857524937, 801955, 26, 59, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (442833478, 333064, 7, 76, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (998644536, 280417, 6, 62, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (450510233, 912589, 29, 66, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (396662561, 261126, 33, 67, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (301180706, 166173, 24, 75, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (516486659, 303816, 39, 91, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (260110154, 717999, 26, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (471691401, 794866, 17, 68, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (615822075, 628339, 22, 58, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (703967785, 430380, 35, 98, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (835454862, 344978, 38, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (420721173, 219206, 30, 89, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (525434532, 612638, 3, 80, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (623218341, 601497, 3, 73, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (653143580, 306325, 9, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (242315187, 535006, 36, 63, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (909628957, 753500, 10, 95, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (878735517, 569489, 28, 99, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (640677061, 970080, 5, 52, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (889351117, 813415, 29, 51, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (935547897, 861837, 37, 92, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (393967251, 596528, 35, 91, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (670456762, 108942, 21, 61, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (994309732, 789591, 2, 83, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (825247454, 142008, 1, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (569096064, 238941, 38, 64, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (465085546, 194403, 10, 88, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (680053971, 154793, 35, 91, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (859444555, 534705, 35, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (617237487, 736890, 31, 88, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (855318206, 913571, 18, 89, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (446180330, 614797, 36, 58, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (216483449, 612174, 14, 70, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (492147047, 844163, 6, 79, null, null);
insert into DOCTOR (docid, license_number, seniority, numofunitdoc, comid, equid)
values (905968778, 728851, 24, 66, null, null);
commit;
prompt 200 records loaded
prompt Loading DRIVER...
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2693421, 754850310, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6362578, 563668234, 91, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4171820, 485961846, 84, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3721185, 396879269, 52, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8008907, 741755826, 61, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2928558, 421300385, 74, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3125817, 896006679, 61, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5384969, 438708268, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9332852, 561545568, 72, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7188616, 458194298, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2803412, 449356429, 87, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2659903, 416096532, 77, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2715961, 898688129, 53, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4526345, 687019960, 97, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9059816, 238380337, 75, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3059246, 765647006, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7372011, 583794353, 75, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2788364, 394129399, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4670151, 988603482, 69, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3922945, 241990631, 65, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3747728, 917938930, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2319298, 988654449, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2790802, 203827084, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8951953, 864843487, 86, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2646701, 974918188, 62, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3317315, 792357175, 56, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9737092, 804417598, 100, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6302591, 265597155, 76, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5995275, 320235419, 90, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2659578, 570518879, 88, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9400003, 406585426, 74, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9228233, 595073780, 57, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7975297, 980138370, 69, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2101818, 736894554, 63, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6006458, 428480453, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2988919, 756058299, 88, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9870090, 487718868, 92, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8788139, 994628901, 77, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3250297, 689925740, 74, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1941591, 401702694, 90, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4295720, 746111431, 69, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4315888, 938616428, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1790677, 948884916, 94, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7226294, 375684751, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6985200, 336820812, 55, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9333849, 986415825, 91, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9668819, 246217915, 93, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2622390, 450264245, 84, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6860014, 773983442, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1082126, 615713216, 63, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6980236, 666335398, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4944832, 623592586, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4957075, 558452076, 72, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1091192, 997452654, 85, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8037276, 765051016, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9610988, 310000624, 58, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6543932, 885927843, 61, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3615745, 509335037, 97, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1323928, 226789243, 65, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7013047, 686999212, 50, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5304267, 220152430, 55, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3316573, 928798041, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2120670, 511271937, 52, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9550204, 464800500, 95, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3999977, 977077425, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1038157, 604017019, 92, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5256095, 833591388, 59, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8586109, 477547383, 53, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7358768, 534732068, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3125671, 532848954, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1813708, 695990349, 62, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9723578, 481479479, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1236650, 349842875, 50, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2293706, 439423189, 69, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5019848, 340404650, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9390760, 653015077, 62, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8636746, 259387554, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4221631, 831272378, 85, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3432115, 774319230, 83, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7438799, 491979798, 86, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7886440, 365257990, 63, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2708727, 885009951, 95, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5878444, 515004428, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7253464, 428460214, 99, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1695726, 276900605, 90, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1939548, 631867539, 80, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7784090, 725275431, 90, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7963947, 444016747, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9350398, 733080691, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9362240, 346792266, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3696151, 554522476, 87, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6450901, 797990521, 80, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4448642, 240728084, 72, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2683643, 881297491, 71, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8021727, 827433628, 85, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2646229, 550492330, 64, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8423845, 914365845, 57, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7640391, 741326125, 76, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5366395, 208028711, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3455959, 342518850, 62, null);
commit;
prompt 100 records committed...
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5138858, 708258350, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1727107, 964575005, 93, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6022960, 601740869, 54, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6129063, 689498007, 83, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8732747, 718509797, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9964447, 395752081, 93, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9077738, 745709473, 75, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1163919, 999150011, 94, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2233557, 788508207, 52, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8482588, 863350375, 87, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7781683, 630717016, 86, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5098592, 286848921, 86, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4933831, 618872199, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7800362, 281559487, 100, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7825885, 951480178, 77, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6403669, 341368761, 76, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8218085, 797353908, 84, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9245814, 866442038, 85, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6394323, 965083022, 59, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4750067, 554152828, 95, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2879444, 893282558, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6541466, 984912421, 50, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1506204, 537518339, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6290009, 349089473, 70, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3271016, 406175340, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1428808, 862925280, 98, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5139626, 483191902, 63, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5358924, 556998325, 54, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8333214, 226292976, 78, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6749140, 334065375, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2768295, 807521914, 95, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6155574, 326640689, 88, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7850988, 793543003, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3539702, 743839691, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6846549, 894964549, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5827337, 875953166, 98, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8001489, 336882325, 68, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6686298, 401315449, 50, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9303967, 378015607, 55, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4367028, 734144285, 76, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1776541, 864603176, 98, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8035734, 714075108, 74, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7430341, 680101877, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5616327, 620282002, 55, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8451186, 996762514, 97, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4796787, 364765141, 72, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6497061, 589852399, 56, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1889345, 555183237, 100, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4494221, 889609159, 93, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6837525, 812438080, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6644585, 509595240, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5980296, 940458969, 64, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4671743, 283253973, 74, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8528484, 687200055, 91, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8238202, 914671353, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4694197, 344193423, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4323985, 599627456, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2298612, 557533592, 88, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4924015, 907781325, 62, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3181159, 397849987, 97, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3073216, 676164488, 78, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1822615, 520726703, 84, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9217263, 301043018, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1017533, 916770876, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1117110, 296294517, 69, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8132105, 681353074, 73, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7226268, 531116008, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6309033, 480944047, 89, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6028572, 851111151, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1510121, 570260627, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9603756, 825451860, 52, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3925681, 204277787, 87, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3360855, 635425834, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (7502712, 923116493, 56, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3487610, 211142104, 96, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3099921, 906106610, 77, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9932730, 248210543, 91, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8725492, 811660019, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4866378, 969555471, 64, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4181589, 834101788, 66, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (3738950, 203123797, 94, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9392172, 843182893, 62, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5376331, 932928997, 71, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6854850, 913466542, 100, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8841955, 835630788, 94, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (6211704, 205703064, 83, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (2348904, 990918736, 96, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9821799, 987232339, 67, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9162168, 917200994, 87, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8499690, 522351672, 86, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4100088, 200189891, 82, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9062074, 721814266, 51, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1716554, 336808653, 99, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1948103, 846247008, 98, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9191234, 947265144, 79, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (4690483, 369030089, 50, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (1149272, 323926553, 61, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (9406723, 747529222, 81, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (8293590, 763261413, 99, null);
insert into DRIVER (license_number, drid, numofunitdri, comid)
values (5785365, 802359317, 95, null);
commit;
prompt 200 records loaded
prompt Loading MEDIC...
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (234085349, 39, 54, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (651838266, 34, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (890675071, 39, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (793837457, 7, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (832331645, 7, 65, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (291226579, 15, 61, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (902221394, 29, 74, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (740789922, 12, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (963913705, 32, 51, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (779263499, 40, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (322745610, 17, 97, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (518959405, 19, 95, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (919568806, 28, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (446840659, 4, 100, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (520291794, 25, 96, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (548889067, 21, 100, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (591489237, 35, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (624995766, 25, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (841984821, 8, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (467700627, 3, 91, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (799867060, 28, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (297584637, 13, 79, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (566957404, 18, 61, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (697734654, 1, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (530391943, 19, 97, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (871955615, 12, 62, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (758609677, 15, 94, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (751624913, 21, 84, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (907457269, 3, 75, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (277900932, 23, 79, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (382874329, 37, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (737725800, 28, 60, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (857055521, 2, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (377705927, 33, 93, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (414167169, 32, 92, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (595720611, 23, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (347384096, 17, 71, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (238188495, 10, 54, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (348160815, 35, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (453249945, 2, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (327863379, 35, 61, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (842182229, 23, 56, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (306958502, 4, 68, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (997055474, 31, 73, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (942680272, 15, 58, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (623252700, 7, 100, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (441668445, 36, 60, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (550379633, 39, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (337862231, 14, 75, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (901519983, 23, 58, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (727586756, 11, 73, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (459720762, 39, 93, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (304194600, 23, 84, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (463646529, 2, 93, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (513134365, 19, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (458225046, 2, 62, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (725418726, 29, 79, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (557195139, 26, 72, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (304514762, 27, 63, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (752331071, 2, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (519920547, 12, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (432467823, 35, 66, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (308775630, 9, 98, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (512184207, 16, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (706596151, 10, 80, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (537024413, 37, 55, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (308008362, 30, 70, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (787942498, 25, 94, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (960687717, 15, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (909350871, 28, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (410680070, 15, 72, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (867990021, 35, 94, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (516573061, 39, 81, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (724500198, 21, 55, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (610687069, 39, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (417789472, 37, 100, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (336002026, 17, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (927496542, 25, 81, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (650594346, 26, 60, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (540671407, 40, 81, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (941163499, 33, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (931452875, 2, 85, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (590945336, 36, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (290280179, 9, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (551984383, 8, 62, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (270576550, 37, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (538082163, 2, 99, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (793143517, 7, 70, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (232605534, 33, 92, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (709525570, 28, 92, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (274301915, 2, 91, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (277528989, 30, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (232986716, 18, 85, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (978482996, 33, 56, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (699398559, 34, 68, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (797155743, 18, 91, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (420924753, 34, 57, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (838083944, 5, 62, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (717729476, 4, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (420918342, 35, 85, null, null);
commit;
prompt 100 records committed...
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (618791854, 34, 74, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (812041779, 21, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (265593209, 29, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (434518746, 36, 79, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (360584366, 19, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (636970599, 23, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (296679948, 5, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (520339337, 1, 63, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (609620768, 18, 91, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (643853720, 30, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (996361395, 16, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (971026706, 22, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (776028419, 15, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (925941044, 31, 79, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (611855918, 40, 68, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (747527322, 25, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (343592915, 8, 55, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (567385403, 37, 51, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (810515396, 25, 91, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (749224261, 22, 86, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (605422774, 13, 73, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (690811603, 6, 61, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (477248137, 6, 98, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (370147107, 27, 67, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (978793967, 4, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (355494441, 37, 100, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (476136528, 11, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (346410477, 14, 55, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (853893170, 39, 72, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (600597233, 8, 59, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (227741116, 28, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (992102214, 21, 67, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (585375492, 5, 94, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (703031003, 2, 63, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (695034283, 9, 89, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (976520450, 10, 77, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (944780139, 4, 99, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (593478915, 31, 85, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (670946315, 18, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (822663597, 34, 51, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (281094584, 11, 96, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (907079129, 13, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (928210301, 33, 73, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (643006983, 29, 58, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (239890074, 39, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (836607164, 2, 68, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (489068668, 20, 77, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (819038558, 22, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (535529709, 39, 54, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (326317294, 12, 82, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (202648873, 12, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (743710735, 17, 57, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (601390528, 40, 75, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (611909684, 40, 65, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (811689106, 39, 66, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (361857458, 13, 62, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (233969348, 39, 71, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (376994711, 5, 50, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (730860325, 17, 97, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (779506864, 35, 60, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (200075898, 20, 53, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (511593222, 1, 67, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (324105297, 22, 72, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (249803200, 28, 69, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (422825834, 29, 76, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (936630826, 1, 66, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (716690816, 22, 88, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (351747397, 21, 73, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (526912563, 20, 88, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (903973380, 6, 68, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (378561692, 2, 66, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (842928712, 40, 51, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (575398878, 9, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (289750900, 20, 72, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (747904919, 8, 99, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (628726513, 33, 69, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (254315147, 6, 84, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (568092746, 39, 97, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (640935247, 28, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (708931639, 6, 64, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (421213994, 12, 88, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (946011285, 17, 60, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (654954595, 13, 77, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (270899201, 30, 52, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (858281697, 1, 61, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (608415845, 12, 85, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (949219394, 24, 90, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (704169862, 18, 99, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (666474638, 6, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (393060905, 18, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (499918569, 34, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (545161690, 20, 98, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (926601534, 31, 87, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (417737162, 12, 63, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (586538370, 18, 58, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (276795979, 14, 69, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (534358900, 1, 98, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (204429106, 9, 83, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (901425149, 23, 59, null, null);
insert into MEDIC (medid, seniority, numofunitmed, comid, equid)
values (419198156, 16, 57, null, null);
commit;
prompt 200 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (944052349, 28880, 33, 88, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (989563848, 92148, 20, 71, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (964649785, 65949, 22, 96, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (582106092, 34738, 37, 99, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (469768163, 45100, 38, 93, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (406019333, 70248, 12, 100, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (455066432, 86899, 19, 55, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (961059386, 48128, 34, 81, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (806597481, 62920, 20, 71, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (831830071, 46297, 33, 81, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (882197863, 26002, 7, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (495221724, 73048, 39, 89, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (271535005, 23557, 19, 63, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (856902670, 54176, 6, 91, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (238625053, 84923, 8, 80, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (821240777, 49944, 27, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (407734479, 69321, 7, 54, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (345473603, 76476, 20, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (366789908, 99027, 25, 55, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (808374616, 32403, 31, 71, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (514165228, 30708, 27, 50, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (913482156, 22578, 20, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (419035521, 14044, 24, 78, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (282428803, 71425, 12, 72, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (984183928, 84674, 19, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (227018664, 94480, 23, 69, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (545260484, 58088, 17, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (968328541, 85215, 7, 88, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (391162568, 96879, 17, 93, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (807218322, 61731, 7, 66, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (539889862, 45673, 15, 58, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (843007948, 96710, 24, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (989880883, 36331, 30, 54, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (683794954, 18783, 40, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (586004806, 17230, 27, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (510810957, 29455, 34, 69, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (956898022, 56467, 20, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (671279044, 48259, 25, 99, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (983652506, 85853, 27, 65, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (855285210, 63692, 27, 70, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (245428380, 44495, 35, 64, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (476145632, 81243, 20, 52, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (468139150, 49539, 39, 55, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (693934009, 82857, 17, 59, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (454034232, 77571, 33, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (552265170, 34466, 13, 58, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (496388028, 76576, 39, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (240203291, 35396, 25, 88, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (958408039, 99479, 22, 52, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (718783863, 93047, 9, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (851287858, 89595, 7, 65, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (691544219, 96274, 20, 75, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (948882720, 37590, 18, 83, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (828883469, 12295, 20, 62, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (884801804, 18024, 27, 75, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (561284223, 13484, 28, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (950585345, 19823, 20, 94, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (322286082, 64326, 31, 80, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (754441338, 63951, 30, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (260854569, 21928, 13, 69, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (222923263, 27500, 26, 92, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (211255503, 59764, 10, 74, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (873948198, 95801, 37, 93, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (312087983, 21585, 18, 55, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (806816198, 64074, 31, 82, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (443598093, 80506, 20, 99, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (691344282, 81683, 12, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (374766487, 55577, 11, 57, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (710757960, 12952, 8, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (445306075, 48936, 29, 89, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (995688668, 19098, 35, 78, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (652722411, 82492, 28, 75, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (621077477, 89058, 32, 96, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (545221165, 86573, 31, 58, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (425156114, 66087, 19, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (818606459, 12466, 19, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (598188444, 50525, 12, 58, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (441346003, 84536, 17, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (617290747, 26933, 31, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (402985437, 53859, 19, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (781196390, 87367, 14, 50, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (573914777, 27387, 25, 68, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (842831771, 75270, 35, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (630450359, 22040, 33, 77, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (399094454, 29203, 34, 96, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (203391234, 62465, 38, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (811973075, 55626, 22, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (706061384, 21626, 29, 62, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (262663281, 94505, 18, 97, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (376407912, 33479, 30, 70, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (749178077, 34128, 16, 79, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (993874364, 66577, 19, 100, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (884573670, 94481, 33, 91, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (670019517, 74705, 22, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (577841650, 27048, 31, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (275689661, 18793, 24, 58, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (804622177, 82490, 39, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (571149512, 45331, 6, 77, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (618266586, 49310, 11, 80, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (699855371, 35575, 37, 92, null, null);
commit;
prompt 100 records committed...
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (452207890, 56714, 8, 88, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (289838436, 48195, 17, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (708571924, 70631, 19, 96, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (317412460, 32080, 7, 70, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (864673555, 51452, 29, 94, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (491590053, 92241, 32, 63, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (381849050, 50991, 9, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (204453034, 25470, 21, 64, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (440319289, 60771, 40, 59, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (759876471, 79313, 6, 64, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (906989217, 84401, 9, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (547186172, 71548, 26, 99, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (608323500, 64562, 18, 53, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (702579309, 79396, 9, 88, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (969819406, 71225, 29, 75, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (353673495, 49653, 25, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (868216124, 80532, 18, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (209113765, 60233, 27, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (458864113, 22404, 18, 66, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (789217012, 12331, 7, 52, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (508177523, 24501, 12, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (962038068, 57435, 11, 61, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (867205290, 43841, 38, 74, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (931168872, 75777, 19, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (829818622, 47258, 22, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (941322349, 33009, 36, 76, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (236464859, 18656, 26, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (727079712, 33447, 22, 73, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (584217167, 20931, 6, 52, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (513397281, 30971, 9, 68, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (661317642, 84138, 23, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (802512326, 15358, 11, 95, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (262067059, 90048, 7, 94, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (755637647, 89192, 29, 56, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (235697092, 67721, 30, 57, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (916693309, 31468, 16, 91, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (407253352, 34090, 20, 77, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (898634971, 59350, 21, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (284894598, 36039, 38, 89, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (285109856, 74462, 19, 55, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (609319129, 94762, 10, 80, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (353402897, 99111, 15, 82, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (860828170, 76652, 17, 66, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (411921528, 24529, 25, 94, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (596732893, 90482, 9, 95, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (422855713, 86820, 34, 94, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (589583856, 23621, 8, 62, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (842727131, 72762, 10, 50, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (723632348, 85722, 16, 93, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (453516347, 94538, 33, 99, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (230851972, 31650, 23, 80, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (201302482, 44058, 34, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (556097732, 25518, 13, 65, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (687769567, 55572, 24, 65, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (725474033, 33947, 12, 68, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (712631974, 51238, 39, 59, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (507656943, 92347, 25, 62, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (826090029, 85393, 22, 65, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (358147740, 14907, 32, 67, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (703452921, 46723, 10, 89, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (682071816, 44974, 40, 72, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (281706607, 94671, 11, 75, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (477536678, 54204, 13, 98, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (599992764, 12466, 15, 63, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (304503192, 39774, 11, 61, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (962309690, 26164, 28, 59, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (602390173, 87575, 12, 60, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (994706467, 85203, 8, 71, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (796439987, 17148, 32, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (699609424, 65286, 35, 54, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (666804854, 57680, 33, 51, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (469980250, 11828, 7, 87, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (838327286, 65630, 34, 85, null, null);
insert into PARAMEDIC (parid, license_number, seniority, numofunitpar, comid, equid)
values (408699583, 25785, 12, 86, null, null);
commit;
prompt 174 records loaded

set feedback on
set define on
prompt Done
