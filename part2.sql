--
-- Database Table Creation
--
-- This file will create the tables for the diagram given in part 1
--
-- First drop any existing tables.
--
DROP TABLE if EXISTS hospital;
DROP TABLE if EXISTS department_includes;
DROP TABLE if EXISTS doctor_worksdept;
DROP TABLE if EXISTS patient;
DROP TABLE if EXISTS staff_worksin;
DROP TABLE if EXISTS appt_has;
DROP TABLE if EXISTS past_appt;
DROP TABLE if EXISTS waitlisted_appt;
DROP TABLE if EXISTS active_appt;
DROP TABLE if EXISTS avail_appt;
DROP TABLE if EXISTS schedule;
DROP TABLE if EXISTS request_maintenance;
DROP TABLE if EXISTS searches;

CREATE TABLE hospital (hid INTEGER,
                       hname CHAR(40),
                       PRIMARY KEY(hid));

CREATE TABLE department_includes (did INTEGER,
                                  hid INTEGER,
                                  dname CHAR(40),
                                  PRIMARY KEY(did),
                                  FOREIGN KEY (hid) REFERENCES hospital -- many depts in a hospital
                                  ON DELETE CASCADE);                     -- participation constraint
                                 
CREATE TABLE doctor_worksdept (docid INTEGER,
                               did INTEGER,
                               docname CHAR(40),
                               specialty CHAR(40),
                               PRIMARY KEY(docid),
                               FOREIGN KEY (did) REFERENCES department_includes -- many docs in a dept
                               ON DELETE CASCADE);                                -- participation constraint);

CREATE TABLE patient (pid INTEGER,
                     pname CHAR(40),
                     gender CHAR(40),
                     age INTEGER,
                     address CHAR(40),
                     total_appt INTEGER,
                     PRIMARY KEY(pid));


CREATE TABLE appt_has (aid INTEGER,
                          date DATE,
                          time_slot CHAR(10),
                          PRIMARY KEY(aid);
                          
CREATE TABLE staff_worksin (sid INTEGER,
                            aid INTEGER,
                            sname CHAR(40),
                            PRIMARY KEY(sid),
                            FOREIGN KEY (aid) REFERENCES appt_has -- many staff work in a hospital
                            ON DELETE CASCADE);                      -- participation constraint

-- ISA Heirarchy

CREATE TABLE past_appt (aid INTEGER,
                        PRIMARY KEY(aid),
                        FOREIGN KEY (aid) REFERENCES appt_has
                        ON DELETE CASCADE);

CREATE TABLE waitlisted_appt (aid INTEGER,
                              PRIMARY KEY(aid),
                              FOREIGN KEY (aid) REFERENCES appt_has
                              ON DELETE CASCADE);
                        
CREATE TABLE active_appt (aid INTEGER,
                          PRIMARY KEY(aid),
                          FOREIGN KEY (aid) REFERENCES appt_has
                          ON DELETE CASCADE);

CREATE TABLE avail_appt (aid INTEGER,
                         PRIMARY KEY(aid),
                         FOREIGN KEY (aid) REFERENCES appt_has
                         ON DELETE CASCADE);


-- Relationship Tables
CREATE TABLE has (aid INTEGER,
                  docid INTEGER,
                  PRIMARY KEY(aid, docid),
                  FOREIGN KEY (aid) REFERENCES (appointment),
                  FOREIGN KEY (docid) REFERENCES (doctor_worksdept)); -- many docs can attend an appt and a doc can have many appts
                  
CREATE TABLE schedule (aid INTEGER,
                       sid INTEGER,
                       PRIMARY KEY(aid, sid),
                       FOREIGN KEY (aid) REFERENCES appt_has,
                       FOREIGN KEY (sid) REFERENCES staff_worksin); --staff can schedule many appts and different staff can edit the same appt
                       
CREATE TABLE request_maintenance (sid INTEGER,
                                  docid INTEGER,
                                  patient_per_hr INTEGER,
                                  dept_name CHAR(40),
                                  time_slot CHAR(40),
                                  PRIMARY KEY(sid, docid),
                                  FOREIGN KEY (sid) REFERENCES staff,
                                  FOREIGN KEY (docid) REFERENCES doctor_worksdept); -- doc can make many requests and staff can deal with many requests
                                  
CREATE TABLE searches (aid INTEGER,
                       hid INTEGER,
                       pid INTEGER,
                       PRIMARY KEY (aid, hid, pid),
                       FOREIGN KEY (aid) REFERENCES appt_has,
                       FOREIGN KEY (hid) REFERENCES hospital,
                       FOREIGN KEY (pid) REFERENCES patient);


