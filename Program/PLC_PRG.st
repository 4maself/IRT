PROGRAM PLC_PRG
VAR
	pid			:	PID;

	Lmin		:	REAL := -2;
	Lmax		:	REAL := 2;
	setPoint	:	REAL := 5.0;

	kP			:	REAL := 1.5;
	kI			:	REAL := 0.1;
	Kd			:	REAL := 2.5;
END_VAR

pid(KP := kP, KI := kI, KD := kD, IlimMin := Lmin, IlimMax := Lmax, setpoint := setpoint, in := Tank.METER_LEVEL);

IF pid.Y > 0 THEN
	Tank.VALVE_FILL := pid.Y;
	Tank.VALVE_DISCHARGE := 0;
ELSIF pid.Y < 0 THEN
	Tank.VALVE_DISCHARGE := (pid.Y * -1);
	Tank.VALVE_FILL := 0;
ELSE
	Tank.VALVE_DISCHARGE := 0;
	Tank.VALVE_FILL := 0;
END_IF