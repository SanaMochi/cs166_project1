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

CREATE TABLE department (did INTEGER,
                         dname CHAR(40),
                         PRIMARY KEY(did));
                         
CREATE TABLE doctor (docid INTEGER,
                     docname CHAR(40),
                     specialty CHAR(40),
                     PRIMARY KEY(docid));

CREATE TABLE patient (pid INTEGER,
                     pname CHAR(40),
                     gender CHAR(40),
                     age INTEGER,
                     address CHAR(40),
                     total_appt INTEGER,
                     PRIMARY KEY(pid));

CREATE TABLE staff (sid INTEGER,
                    sname CHAR(40),
                    PRIMARY KEY(sid));

CREATE TABLE appointment (aid INTEGER,
                          date DATE,
                          time_slot CHAR(10),
                          PRIMARY KEY(aid));

