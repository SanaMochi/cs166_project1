COPY hospital (
	hid,
	hname)
FROM 'hospital.txt'
WITH DELIMITER ',';

COPY department_includes (
	did,
	hid,
	dname)
FROM 'dept.txt'
WITH DELIMITER ',';

COPY doctor_worksdept (
	docid,
	did,
	docname,
	specialty)
FROM 'doc.txt'
WITH DELIMITER ',';

COPY patient (
	pid,
	pname,
	gender,
	age,
	address,
	total_appt)
FROM 'patient.txt'
WITH DELIMITER ';';

COPY appt (
	aid,
	adate,
	atime_slot)
FROM 'appt.txt'
WITH DELIMITER ',';

COPY staff_worksin (
	sid,
	hid,
	sname)
FROM 'staff.txt'
WITH DELIMITER ',';

COPY past_appt (
	aid)
FROM 'past_appt.txt';


COPY waitlisted_appt (
	aid)
FROM 'waitlisted_appt.txt';


COPY active_appt (
	aid)
FROM 'active_appt.txt';

COPY avail_appt (
	aid)
FROM 'avail_appt.txt';

COPY has (
	aid,
	docid)
FROM 'has.txt'
WITH DELIMITER ',';

COPY schedule(
	aid,
	sid)
FROM 'schedule.txt'
WITH DELIMITER ',';

COPY request_maintenance (
	sid,
	docid,
	patient_per_hr,
	dept_name,
	time_slot)
FROM 'request.txt'
WITH DELIMITER ',';


COPY searches (
	aid,
	hid,
	pid)
FROM 'searches.txt'
WITH DELIMITER ',';


