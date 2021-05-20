-- Hospital Management --

-- (1) Given a dept ID, get active appts for the week
SELECT appt.aid, appt.adate, appt.atime_slot
FROM department_includes, doctor_worksdept, has, appt, active_appt
WHERE department_includes.did = doctor_worksdept.did AND 
      doctor_worksdept.docid = has.docid AND
      has.aid = appt.aid AND active_appt.aid = appt.aid AND 
      department_includes.did = 2002;

-- (2) Given a dept ID and a date, find available appts


-- (3) Gived a dept ID and a date, fid active appts
SELECT appt.aid, appt.adate, appt.atime_slot
FROM department_includes, doctor_worksdept, has, appt, active_appt
WHERE department_includes.did = doctor_worksdept.did AND
      doctor_worksdept.docid = has.docid AND
      has.aid = appt.aid AND active_appt.aid = appt.aid AND
      department_includes.did = 2003 AND appt.adate = '06-07-2022';


-- (4) Given a dept ID and a date, find the list of patients who made appts on that date





