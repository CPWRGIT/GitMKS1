//CWEZXXXR JOB (#SALES),'ISPW',CLASS=L,MSGCLASS=X,REGION=0M,
//      MSGLEVEL=(1,1),NOTIFY=&USERID
//*
//***     THIS JOB IS FOR REPORTING STATISTICS FROM SYSLOG(S)
//STEP000 EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
//DEL1 DD DSN=CWEZXXX.SYSLOG.TXT,DISP=(MOD,DELETE),SPACE=(TRK,1)
//DEL2 DD DSN=CWEZXXX.SYSLOGO.DATA,DISP=(MOD,DELETE),SPACE=(TRK,1)
//DEL3 DD DSN=CWEZXXX.SYSLOGH.DATA,DISP=(MOD,DELETE),SPACE=(TRK,1)
//*
//STEP020 EXEC PGM=SLOGREPT
//* SPECIFY CORRECT LOADLIB FOR YOUR TEST
//STEPLIB  DD DISP=SHR,DSN=CWEZ.#APP.PRD.LOAD
//SYSLOGF  DD DSN=SYS2.SYSLOG.DAILY.CW01(0),DISP=SHR,DCB=BUFNO=50
//* YOU CAN CONCATENATE ANY NUMBER OF INPUT
//* LOG DATASETS HERE (UP TO 255)
//HASP892  DD DSN=CWEZXXX.SYSLOGH.DATA,DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(6000,1500),RLSE),UNIT=SYSDA,
//            DCB=(LRECL=133,RECFM=FB,BUFNO=50)
//SYSLOGO  DD DSN=CWEZXXX.SYSLOGO.DATA,DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(6000,1500),RLSE),UNIT=SYSDA,
//            DCB=(LRECL=133,RECFM=FB,BUFNO=50)
//REPORT   DD DSN=CWEZXXX.SYSLOG.TXT,DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(6000,1500),RLSE),UNIT=SYSDA,
//            DCB=(LRECL=80,RECFM=FB,BUFNO=50)
//OPUSERS  DD DSN=&&OPUSERS,UNIT=SYSDA,SPACE=(TRK,(1500,750),RLSE),
//            DCB=(LRECL=22,RECFM=FB,BUFNO=10)
//LOGFIN   DD DSN=&&LOGFIN,UNIT=SYSDA,SPACE=(TRK,(9000,9000),RLSE),
//            DCB=(LRECL=133,RECFM=FB,BUFNO=50),DSNTYPE=LARGE
//LOGFOUT  DD DSN=&&LOGFOUT,UNIT=SYSDA,SPACE=(TRK,(9000,9000),RLSE),
//            DCB=(LRECL=133,RECFM=FB,BUFNO=50),DSNTYPE=LARGE
//SORTIN   DD DSN=&&SORTIN,UNIT=SYSDA,SPACE=(TRK,(7500,1500),RLSE),
//            DCB=(LRECL=16,RECFM=FB,BUFNO=30)
//SORTOUT  DD DSN=&&SORTOUT,UNIT=SYSDA,SPACE=(TRK,(7500,1500),RLSE),
//            DCB=(LRECL=16,RECFM=FB,BUFNO=30)
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//*