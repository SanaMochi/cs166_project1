--
-- Database Table Creation
--
-- This file will create the tables for the diagram given in part 1
--
-- First drop any existing tables.
--
DROP TABLE if EXISTS hospital
DROP TABLE if EXISTS department
DROP TABLE if EXISTS doctor
DROP TABLE if EXISTS patient
DROP TABLE if EXISTS staff
DROP TABLE if EXISTS appointment

CREATE TABLE hospital (hid INTEGER,
                       hname CHAR(40),
                       PRIMARY KEY(hid));

CREATE TABLE department_includes (did INTEGER,
                                  dname CHAR(40),
                                  PRIMARY KEY(did),
                                  FOREIGN KEY (hid) REFERENCES (hospital) -- many depts in a hospital
                                  ON DELETE CASCADE);                     -- participation constraint
                                 
CREATE TABLE doctor_worksdept (docid INTEGER,
                               docname CHAR(40),
                               specialty CHAR(40),
                               PRIMARY KEY(docid),
                               FOREIGN KEY (did) REFERENCES (department_includes) -- many docs in a dept
                               ON DELETE CASCADE);                                -- participation constraint);

CREATE TABLE patient (pid INTEGER,
                     pname CHAR(40),
                     gender CHAR(40),
                     age INTEGER,
                     address CHAR(40),
                     total_appt INTEGER,
                     PRIMARY KEY(pid));

CREATE TABLE staff_worksin (sid INTEGER,
                    sname CHAR(40),
                    PRIMARY KEY(sid),
                    FOREIGN KEY (aid) REFERENCES (appointment), -- many staff work in a hospital
                    ON DELETE CASCADE);                         -- participation constraint

CREATE TABLE appt_sched_has (aid INTEGER,
                          date DATE,
                          time_slot CHAR(10),
                          PRIMARY KEY(aid),
                          FOREIGN KEY (docid) REFERENCES (doctor_worksdept));  -- a doc can attend many appts (only one doc per appt)

-- Many-to-many relationships

--CREATE TABLE has (aid INTEGER,
--                  docid INTEGER,
--                  PRIMARY KEY(aid, docid),
--                  FOREIGN KEY (aid) REFERENCES (appointment),
--                  FOREIGN KEY (docid) REFERENCES (doctor_worksdept)); --doesn't seem right - appts can have many docs? nothing specified on soln (put in appt)
                  
CREATE TABLE schedule (aid INTEGER,
                       sid INTEGER,
                       PRIMARY KEY(aid, sid),
                       FOREIGN KEY (aid) REFERENCES (appointment),
                       FOREIGN KEY (sid) REFERENCES (staff_worksin)); 
                       
CREATE TABLE request_maintenance (sid INTEGER,
                                  docid INTEGER,
                                  patient_per_hr INTEGER,
                                  dept_name CHAR(40),
                                  time_slot CHAR(40),
                                  PRIMARY KEY(sid, docid),
                                  FOREIGN KEY (sid) REFERENCES (staff),
                                  FOREIGN KEY (docid) REFERENCES (doctor_worksdept));


