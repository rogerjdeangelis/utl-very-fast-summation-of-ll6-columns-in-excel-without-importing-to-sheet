Very fast summation of 116 columns in excel without importing to sheet


INPUT  (116 columns)
====================

 d:/xls/oneone16.xlsx

 https://tinyurl.com/ya5g8ejj
 https://github.com/rogerjdeangelis/utl-very-fast-summation-of-ll6-columns-in-excel-without-importing-to-sheet

    +-------------------------------------------------------------+
    |     A   |    B       |     C      |   ...      |   DM       |
    +-------------------------------------------------------------+
1   |  ASSET  |   f1901    |  f1902     |  f1903     |  f2016     |
    +---------+------------+------------+------------+------------+
2   | AE10.A  |   232      |   414      |   469      |   222      |
    +---------+------------+------------+------------+------------+
2   | AE21.A  |   456      |   917      |   679      |   224      |
    +---------+------------+------------+------------+------------+
    ...
    +---------+------------+------------+------------+------------+
104 | SU60.A  |   456      |   115      |   287      |   456      |
    +---------+------------+------------+------------+------------+

 [data]


OUTPUT
======

 WORK.WANT total obs=1

  F1901  F1902  F1903  F1904 ... F2016

  15723  17016  15192  14950 ... 16750


 Observation(1 ) of WORK.WANT - Total Obs 1

   -- NUMERIC --

  COL            SUM

  F1901    N8   15723
  F1902    N8   17016
  F1903    N8   15192
  ....
  F2014    N8   134459
  F2015    N8   100908
  F2016    N8   97431

PROCESS
=======

%array(cols,values=f1901-f2016);

proc sql dquote=ansi;
 connect to excel
    (Path="d:/xls/oneone6.xls" );
    create
        table want as
    select
        *
        from connection to Excel
        (
         Select
            %do_over(cols,phrase=sum(?) as ?,between=comma)
         from
           data
        );
    disconnect from Excel;
Quit;

OUTPUT
======

 see above

