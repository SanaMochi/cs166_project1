--
-- Database Table Creation
--
-- This file will create the tables for the diagram given in part 1
--
-- First drop any existing tables.
--
DROP TABLE if EXISTS hospital CASCADE;
DROP TABLE if EXISTS department_includes CASCADE;
DROP TABLE if EXISTS doctor_worksdept CASCADE;
DROP TABLE if EXISTS patient CASCADE;
DROP TABLE if EXISTS staff_worksin CASCADE;
DROP TABLE if EXISTS appt CASCADE;
DROP TABLE if EXISTS past_appt CASCADE;
DROP TABLE if EXISTS waitlisted_appt CASCADE;
DROP TABLE if EXISTS active_appt CASCADE;
DROP TABLE if EXISTS avail_appt CASCADE;
DROP TABLE if EXISTS has CASCADE;
DROP TABLE if EXISTS schedule CASCADE;
DROP TABLE if EXISTS request_maintenance CASCADE;
DROP TABLE if EXISTS searches CASCADE;

CREATE TABLE hospital (hid INTEGER NOT NULL,
                       hname CHAR(40),
                       PRIMARY KEY(hid));

CREATE TABLE department_includes (did INTEGER NOT NULL,
                                  hid INTEGER NOT NULL,
                                  dname CHAR(40),
                                  PRIMARY KEY(did),
                                  FOREIGN KEY (hid) REFERENCES hospital -- many depts in a hospital
                                  ON DELETE CASCADE);                     -- participation constraint
                                 
CREATE TABLE doctor_worksdept (docid INTEGER NOT NULL,
                               did INTEGER NOT NULL,
                               docname CHAR(40),
                               specialty CHAR(40),
                               PRIMARY KEY(docid),
                               FOREIGN KEY (did) REFERENCES department_includes -- many docs in a dept
                               ON DELETE CASCADE);                                -- participation constraint);

CREATE TABLE patient (pid INTEGER NOT NULL,
                      pname CHAR(40),
                      gender CHAR(40),
                      age INTEGER,
                      address CHAR(40),
                      total_appt INTEGER,
                      PRIMARY KEY(pid));


CREATE TABLE appt (aid INTEGER NOT NULL,
                   adate DATE,
                   atime_slot CHAR(10),
                   PRIMARY KEY(aid));
                          
CREATE TABLE staff_worksin (sid INTEGER NOT NULL,
                            hid INTEGER NOT NULL,
                            sname CHAR(40),
                            PRIMARY KEY(sid),
                            FOREIGN KEY (hid) REFERENCES hospital -- many staff work in a hospital
                            ON DELETE CASCADE);                   -- participation constraint

-- ISA Heirarchy

CREATE TABLE past_appt (aid INTEGER NOT NULL,
                        PRIMARY KEY(aid),
                        FOREIGN KEY (aid) REFERENCES appt
                        ON DELETE CASCADE);

CREATE TABLE waitlisted_appt (aid INTEGER NOT NULL,
                              PRIMARY KEY(aid),
                              FOREIGN KEY (aid) REFERENCES appt
                              ON DELETE CASCADE);
                        
CREATE TABLE active_appt (aid INTEGER NOT NULL,
                          PRIMARY KEY(aid),
                          FOREIGN KEY (aid) REFERENCES appt
                          ON DELETE CASCADE);

CREATE TABLE avail_appt (aid INTEGER NOT NULL,
                         PRIMARY KEY(aid),
                         FOREIGN KEY (aid) REFERENCES appt
                         ON DELETE CASCADE);


-- Relationship Tables
CREATE TABLE has (aid INTEGER NOT NULL,
                  docid INTEGER NOT NULL,
                  PRIMARY KEY(aid, docid),
                  FOREIGN KEY (aid) REFERENCES appt,
                  FOREIGN KEY (docid) REFERENCES doctor_worksdept); -- many docs can attend an appt and a doc can have many appts
                  
CREATE TABLE schedule (aid INTEGER NOT NULL,
                       sid INTEGER NOT NULL,
                       PRIMARY KEY(aid, sid),
                       FOREIGN KEY (aid) REFERENCES appt,
                       FOREIGN KEY (sid) REFERENCES staff_worksin); --staff can schedule many appts and different staff can edit the same appt
                       
CREATE TABLE request_maintenance (sid INTEGER NOT NULL,
                                  docid INTEGER NOT NULL,
                                  patient_per_hr INTEGER NOT NULL,
                                  dept_name CHAR(40),
                                  time_slot CHAR(40),
                                  PRIMARY KEY(sid, docid),
                                  FOREIGN KEY (sid) REFERENCES staff_worksin,
                                  FOREIGN KEY (docid) REFERENCES doctor_worksdept); -- doc can make many requests and staff can deal with many requests
                                  
CREATE TABLE searches (aid INTEGER,
                       hid INTEGER,
                       pid INTEGER,
                       PRIMARY KEY (aid, hid, pid),
                       FOREIGN KEY (aid) REFERENCES appt,
                       FOREIGN KEY (hid) REFERENCES hospital,
                       FOREIGN KEY (pid) REFERENCES patient);


